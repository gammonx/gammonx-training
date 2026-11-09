#Requires -Version 5.1
<#
.SYNOPSIS
Runs a configurable, resumable GammonX hyperparameter search on existing games.
.DESCRIPTION
Reads a JSON plan, optionally compares reference models, trains/screens optimizer
candidates, then rebuilds/screens TD targets using the winning optimizer settings.
All local tournaments use Hard (1-ply). Packages a challenger and reference for
independent remote evaluation. Every candidate starts from parentModel.
The app controls epochs, scheduling, early stopping and checkpoint selection.
See README.md for configuration, outputs, limitations and background execution.
.PARAMETER ConfigPath
JSON configuration. Relative paths resolve against its directory, not the shell.
.PARAMETER ValidateOnly
Checks paths/settings and prints the plan without writing or launching the app.
.EXAMPLE
.\run-search.ps1 -ConfigPath .\search.example.json -ValidateOnly
.EXAMPLE
.\run-search.ps1 -ConfigPath .\my-search.json
.NOTES
Windows PowerShell 5.1 or PowerShell 7 on Windows. Requires an already built
GammonX.Mars.Training.exe. Resume with unchanged configuration, runner and inputs;
use a new outputDirectory for another experiment. Console prompt order must match
the three answer arrays in this script. No new training games are generated.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$ConfigPath,
    [switch]$ValidateOnly
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$culture = [Globalization.CultureInfo]::InvariantCulture
$configFile = (Resolve-Path -LiteralPath $ConfigPath).Path
$configDirectory = Split-Path -Parent $configFile
$configText = [IO.File]::ReadAllText($configFile)
$config = $configText | ConvertFrom-Json

function Setting($object, [string]$key, $fallback = $null) {
    $property = $object.PSObject.Properties[$key]
    if ($null -eq $property) { return $fallback }
    return $property.Value
}
function Absolute-Path([string]$path) {
    if ([string]::IsNullOrWhiteSpace($path) -or $path -match '[\r\n]') { throw 'Paths must be nonempty single-line strings.' }
    if (![IO.Path]::IsPathRooted($path)) { $path = Join-Path $configDirectory $path }
    return [IO.Path]::GetFullPath($path).TrimEnd([char[]]'\/')
}
function Required-File([string]$key) {
    $path = Absolute-Path ([string](Setting $config $key))
    if (!(Test-Path -LiteralPath $path -PathType Leaf)) { throw "Missing $key file: $path" }
    return $path
}
function Number($value) { return ([double]$value).ToString('R', $culture) }
function Positive-Integer($value, [string]$label) {
    $number = [double]$value
    if ([double]::IsNaN($number) -or $number -lt 1 -or $number -gt [int]::MaxValue -or $number -ne [math]::Floor($number)) { throw "$label must be a positive integer." }
    return [int]$number
}
function Probability($value, [string]$label) {
    if ($null -eq $value) { throw "Missing $label." }
    $number = [double]$value
    if ([double]::IsNaN($number) -or $number -lt 0 -or $number -gt 1) { throw "$label must be between 0 and 1." }
    return $number
}
function Dataset-Paths([string]$csv) {
    $val = [IO.Path]::ChangeExtension($csv, '.val.csv')
    return @($csv, $val, [IO.Path]::ChangeExtension($csv, '.trajectory.csv'),
        [IO.Path]::ChangeExtension($val, '.trajectory.csv'), [IO.Path]::ChangeExtension($csv, '.games.csv'))
}

$exe = Required-File 'appPath'
$source = Required-File 'trainingCsv'
$parent = Required-File 'parentModel'
$reference = Required-File 'referenceModel'
$work = Absolute-Path ([string](Setting $config 'outputDirectory'))
$challenger = ''
if (Setting $config 'baselineChallenger') { $challenger = Required-File 'baselineChallenger' }
if ($challenger -eq $reference) { throw 'baselineChallenger must differ from referenceModel.' }
$modes = @('Plakoto', 'Fevga', 'Backgammon', 'Tavla', 'Portes')
$modus = [string](Setting $config 'gameMode' 'Backgammon')
$modeIndex = [array]::IndexOf($modes, $modus) + 1
if ($modeIndex -eq 0) { throw "gameMode must be one of: $($modes -join ', ')." }
$games = Positive-Integer (Setting $config 'screenGames' 10000) 'screenGames'
if ($games -lt 100) { throw 'screenGames must be at least 100 for an equity interval.' }
$evalBatch = Positive-Integer (Setting $config 'evalBatchSize' 64) 'evalBatchSize'
$processes = Positive-Integer (Setting $config 'processCount' ([Environment]::ProcessorCount)) 'processCount'
$producers = Positive-Integer (Setting $config 'producerCount' 8) 'producerCount'
$queue = Positive-Integer (Setting $config 'queueCapacity' 16) 'queueCapacity'
$torchThreads = Positive-Integer (Setting $config 'torchThreads' 8) 'torchThreads'
$keepCaches = Setting $config 'keepBinaryCaches' $false
if ($keepCaches -isnot [bool]) { throw 'keepBinaryCaches must be a JSON boolean.' }
$sourceTargets = Setting $config 'sourceTargets'
if ($null -eq $sourceTargets) { throw 'sourceTargets with lambda and gamma is required.' }
$sourceLambda = Probability (Setting $sourceTargets 'lambda') 'sourceTargets.lambda'
$sourceGamma = Probability (Setting $sourceTargets 'gamma') 'sourceTargets.gamma'
$optimizers = @(Setting $config 'optimizerCandidates' @())
$targets = @(Setting $config 'targetCandidates' @())
if ($optimizers.Count -eq 0) { throw 'At least one optimizerCandidates entry is required.' }
$names = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($entry in @($optimizers) + @($targets)) {
    $name = [string](Setting $entry 'name')
    if ($name -notmatch '^[A-Za-z0-9][A-Za-z0-9_-]{0,79}$' -or !$names.Add($name)) { throw "Candidate names must be unique safe filenames (1-80 letters, numbers, hyphens or underscores): $name" }
}
foreach ($entry in $optimizers) {
    $lr = [double](Setting $entry 'learningRate')
    if ([double]::IsNaN($lr) -or [double]::IsInfinity($lr) -or $lr -le 0) { throw "Invalid learningRate: $($entry.name)" }
    $null = Positive-Integer (Setting $entry 'batchSize') "$($entry.name).batchSize"
}
foreach ($entry in $targets) {
    $null = Probability (Setting $entry 'lambda') "$($entry.name).lambda"
    $null = Probability (Setting $entry 'gamma') "$($entry.name).gamma"
}
$datasetFiles = @(Dataset-Paths $source)
$requiredInputs = @($exe, $source, $datasetFiles[1], $parent, $reference)
if ($challenger) { $requiredInputs += $challenger }
if ($targets.Count -gt 0) { $requiredInputs += $datasetFiles[2..4] }
foreach ($model in @($parent, $reference, $challenger)) {
    if ($model -and (Test-Path -LiteralPath "$model.meta.json")) { $requiredInputs += "$model.meta.json" }
}
$dll = [IO.Path]::ChangeExtension($exe, '.dll')
if (Test-Path -LiteralPath $dll) { $requiredInputs += $dll }
$requiredInputs = @($requiredInputs | Sort-Object -Unique)
foreach ($path in $requiredInputs) {
    if (!(Test-Path -LiteralPath $path -PathType Leaf)) { throw "Missing input: $path" }
    if ($path.StartsWith($work + '\', [StringComparison]::OrdinalIgnoreCase)) { throw "outputDirectory must not contain input files: $path" }
}
if ($ValidateOnly) {
    [pscustomobject]@{OutputDirectory=$work; GameMode=$modus; GamesPerTournament=$games;
        OptimizerCandidates=$optimizers.Count; TargetCandidates=$targets.Count;
        BaselineComparison=[bool]$challenger; Reference=$reference; Parent=$parent}
    return
}

function Status([string]$message) {
    $line = "$(Get-Date -Format o) $message"
    Add-Content -LiteralPath (Join-Path $work 'progress.log') -Value $line
    Write-Host $line
}
function Write-Json($value, [string]$path) {
    $value | ConvertTo-Json -Depth 12 | Set-Content -LiteralPath $path -Encoding UTF8
}
function Require-Outputs([string[]]$paths) {
    foreach ($path in $paths) {
        if (!(Test-Path -LiteralPath $path -PathType Leaf) -or (Get-Item -LiteralPath $path).Length -eq 0) { throw "Missing or empty output: $path" }
    }
}

# The app exposes an interactive console: these answer arrays are its adapter.
# Review them whenever Program.cs changes its prompts or menu option ordering.
function Invoke-App([string]$name, [string[]]$answers, [string]$success, [string[]]$outputs = @()) {
    $log = Join-Path $work "$name.log"
    $done = Join-Path $work "$name.done.json"
    if (Test-Path -LiteralPath $done) {
        Require-Outputs (@($log) + $outputs)
        if ([IO.File]::ReadAllText($log) -notmatch $success) { throw "Invalid completed stage: $name" }
        return $log
    }
    $inputPath = Join-Path $work "$name.input.txt"
    [IO.File]::WriteAllText($inputPath, (($answers + '') -join "`r`n") + "`r`n")
    Status "Starting $name"
    $p = Start-Process -FilePath $exe -WorkingDirectory $work -WindowStyle Hidden -RedirectStandardInput $inputPath -RedirectStandardOutput $log -RedirectStandardError (Join-Path $work "$name.stderr.log") -PassThru
    # Acquire the handle before waiting so ExitCode remains available in PS 5.1.
    $processHandle = $p.Handle
    Write-Json @{name=$name; pid=$p.Id; started=(Get-Date -Format o)} (Join-Path $work 'active.json')
    $p.WaitForExit()
    $p.Refresh()
    if ($p.ExitCode -ne 0 -or [IO.File]::ReadAllText($log) -notmatch $success) { throw "Failed $name (exit $($p.ExitCode)); inspect $log and stderr." }
    Require-Outputs $outputs
    Write-Json @{name=$name; completed=(Get-Date -Format o); exitCode=$p.ExitCode} $done
    Status "Completed $name"
    return $log
}
function Read-Score([string]$path) {
    $s = [IO.File]::ReadAllText($path)
    $n = [regex]::Match($s, 'Scored games\s*:\s*(\d+)')
    $d = [regex]::Match($s, 'Discarded\s*:\s*(\d+)')
    $e = [regex]::Match($s, 'A cubeless points/game\s*:\s*([+\-\d.]+)')
    $ci = [regex]::Match($s, 'Approx\. 95% equity CI\s*:\s*\[([+\-\d.]+),\s*([+\-\d.]+)\]')
    if (!$n.Success -or [int]$n.Groups[1].Value -ne $games -or !$d.Success -or [int]$d.Groups[1].Value -ne 0 -or !$e.Success -or !$ci.Success) { throw "Incomplete or invalid tournament: $path" }
    return [pscustomobject]@{equity=[double]::Parse($e.Groups[1].Value,$culture); low=[double]::Parse($ci.Groups[1].Value,$culture); high=[double]::Parse($ci.Groups[2].Value,$culture); games=$games; log=$path}
}
function Screen([string]$name, [string]$a, [string]$b) {
    # mode 5: modus, A path/level, B path/level, game count, batch, processes.
    $log = Invoke-App $name @('5',"$modeIndex",$a,'3',$b,'3',"$games","$evalBatch","$processes") 'Verdict:'
    return Read-Score $log
}
function Rebuild([string]$name, [double]$lambda, [double]$gamma) {
    $output = Join-Path $work "$name.csv"
    # No fixed sample size or separator: accept Swiss and other N0 formats.
    $log = Invoke-App "rebuild-$name" @('7',"$modeIndex",$source,$datasetFiles[1],$datasetFiles[2],$datasetFiles[3],$datasetFiles[4],$output,(Number $lambda),(Number $gamma)) 'Rebuilt [0-9][0-9\s\x27\u2019.,]* labels with lambda=' (Dataset-Paths $output)
    return $output
}
function Remove-Caches([string]$csv) {
    if ($keepCaches) { return }
    # Delete only the exact app-created cache files in this isolated run folder.
    foreach ($suffix in @('.bin', '.val.bin')) {
        $path = [IO.Path]::GetFullPath((Join-Path $work ([IO.Path]::GetFileNameWithoutExtension($csv) + $suffix)))
        if ([IO.Path]::GetDirectoryName($path) -ne $work) { throw "Cache outside outputDirectory: $path" }
        if (Test-Path -LiteralPath $path) { Remove-Item -LiteralPath $path; Status "Removed binary cache $path" }
    }
}
$results = [Collections.Generic.List[object]]::new()
function Candidate([string]$name, [string]$csv, [double]$lambda, [double]$gamma, [double]$lr, [int]$batch) {
    $model = Join-Path $work "$name.dat"
    # mode 2: modus, train/output/input paths, batch, producers, queue, initial LR.
    $trainLog = Invoke-App "train-$name" @('2',"$modeIndex",$csv,$model,$parent,"$batch","$producers","$queue",(Number $lr)) 'Model saved:' @($model,"$model.meta.json")
    Remove-Caches $csv
    $score = Screen "screen-$name" $model $script:baseline
    $r = [pscustomobject]@{name=$name; model=$model; lambda=$lambda; gamma=$gamma; lr=$lr; batch=$batch; equity=$score.equity; low=$score.low; high=$score.high; trainLog=$trainLog; matchLog=$score.log}
    $results.Add($r)
    $results | Export-Csv -LiteralPath (Join-Path $work 'screening.csv') -NoTypeInformation
    return $r
}

$lock = $null
$oldCulture = [Threading.Thread]::CurrentThread.CurrentCulture
$environmentNames = @('OMP_NUM_THREADS','MKL_NUM_THREADS','DOTNET_SYSTEM_GLOBALIZATION_INVARIANT')
$oldEnvironment = @{}
foreach ($key in $environmentNames) { $oldEnvironment[$key] = [Environment]::GetEnvironmentVariable($key, 'Process') }
$started = $false
try {
    # Never mix a new experiment with a nonempty directory lacking our manifest.
    $manifestPath = Join-Path $work 'manifest.json'
    if ((Test-Path -LiteralPath $work) -and !(Test-Path -LiteralPath $manifestPath) -and @(Get-ChildItem -LiteralPath $work -Force).Count -gt 0) { throw 'outputDirectory is not empty and has no manifest. Choose a new run directory.' }
    New-Item -ItemType Directory -Path $work -Force | Out-Null
    $lock = [IO.File]::Open((Join-Path $work '.run.lock'), [IO.FileMode]::OpenOrCreate, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
    # A killed parent can leave its app process alive after the lock is released.
    $activePath = Join-Path $work 'active.json'
    if (Test-Path -LiteralPath $activePath) {
        $active = Get-Content -LiteralPath $activePath -Raw | ConvertFrom-Json
        $child = Get-Process -Id $active.pid -ErrorAction SilentlyContinue
        if ($null -ne $child -and $child.ProcessName -eq [IO.Path]::GetFileNameWithoutExtension($exe) -and
            [math]::Abs(($child.StartTime.ToUniversalTime() - ([datetime]$active.started).ToUniversalTime()).TotalSeconds) -lt 30) {
            throw "Previous app process $($active.pid) is still running. Wait for it or stop it before resuming."
        }
    }
    # Fingerprints prevent reuse after app, data, model, runner or config changes.
    $hashes = @($requiredInputs | ForEach-Object { $h = Get-FileHash -LiteralPath $_ -Algorithm SHA256; [pscustomobject]@{path=$h.Path; sha256=$h.Hash} })
    $manifest = [ordered]@{runnerSha256=(Get-FileHash -LiteralPath $PSCommandPath).Hash; configuration=($configText | ConvertFrom-Json); inputs=$hashes}
    $manifestJson = $manifest | ConvertTo-Json -Depth 12
    if (Test-Path -LiteralPath $manifestPath) {
        $previous = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json | ConvertTo-Json -Depth 12
        if ($previous -cne $manifestJson) { throw 'Configuration, runner or inputs changed. Use a new outputDirectory; completed stages were not reused.' }
    } else { $manifestJson | Set-Content -LiteralPath $manifestPath -Encoding UTF8 }
    [Threading.Thread]::CurrentThread.CurrentCulture = $culture
    $env:OMP_NUM_THREADS = "$torchThreads"
    $env:MKL_NUM_THREADS = "$torchThreads"
    # A parent thread's culture is not inherited by an executable. Force invariant
    # numeric parsing in the .NET child, including on comma-decimal Windows locales.
    $env:DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = '1'
    $started = $true
    $failure = Join-Path $work 'failure.json'
    if (Test-Path -LiteralPath $failure) {
        Move-Item -LiteralPath $failure -Destination (Join-Path $work ("failure.$(Get-Date -Format 'yyyyMMdd-HHmmss-fff').json"))
    }
    $resultPath = Join-Path $work 'result.json'
    if (Test-Path -LiteralPath $resultPath) { Remove-Item -LiteralPath $resultPath }
    Status 'Starting/resuming configuration search on existing data.'
    $script:baseline = $reference
    $baseScore = $null
    if ($challenger) {
        $baseScore = Screen 'baseline' $reference $challenger
        if ($baseScore.high -lt 0) { $script:baseline = $challenger }
    }
    Status "Screening reference: $script:baseline"
    foreach ($entry in $optimizers) {
        $r = Candidate $entry.name $source $sourceLambda $sourceGamma ([double]$entry.learningRate) ([int]$entry.batchSize)
    }
    $optimizer = $results | Sort-Object @{Expression='equity';Descending=$true},name | Select-Object -First 1
    foreach ($entry in $targets) {
        $csv = $source
        if ([double]$entry.lambda -ne $sourceLambda -or [double]$entry.gamma -ne $sourceGamma) {
            $csv = Rebuild $entry.name ([double]$entry.lambda) ([double]$entry.gamma)
        }
        $r = Candidate $entry.name $csv ([double]$entry.lambda) ([double]$entry.gamma) $optimizer.lr $optimizer.batch
    }
    $selected = $results | Sort-Object @{Expression='equity';Descending=$true},name | Select-Object -First 1
    $summary = [ordered]@{status='ready-for-remote-2ply'; baseline=$script:baseline; baselineComparison=$baseScore; finalist=$selected;
        note='Fixed-size 1-ply screening selects a challenger, not a confirmed stronger model. Run an independent remote 2-ply comparison. No new training sample generated.'}
    $handoff = Join-Path $work 'remote-2ply'
    New-Item -ItemType Directory -Path $handoff -Force | Out-Null
    # Stable A/B filenames prevent collisions with identically named source models.
    foreach ($pair in @(@($selected.model,'model-a.dat'), @($script:baseline,'model-b.dat'))) {
        Copy-Item -LiteralPath $pair[0] -Destination (Join-Path $handoff $pair[1])
        $sidecar = $pair[0] + '.meta.json'
        if (Test-Path -LiteralPath $sidecar) {
            $metadata = Get-Content -LiteralPath $sidecar -Raw | ConvertFrom-Json
            if ($null -ne $metadata.PSObject.Properties['Name']) { $metadata.Name = $pair[1] }
            Write-Json $metadata (Join-Path $handoff ($pair[1]+'.meta.json'))
        }
    }
    Write-Json $summary (Join-Path $handoff 'comparison.json')
    Get-ChildItem -LiteralPath $handoff -Filter '*.dat*' | ForEach-Object {
        [pscustomobject]@{file=$_.Name; sha256=(Get-FileHash -LiteralPath $_.FullName).Hash}
    } | Export-Csv -LiteralPath (Join-Path $handoff 'sha256.csv') -NoTypeInformation
    Write-Json $summary (Join-Path $work 'result.json')
    if (Test-Path -LiteralPath $activePath) { Remove-Item -LiteralPath $activePath }
    Status "Ready for remote 2-ply: $($selected.name) against $script:baseline. Package: $handoff"
} catch {
    if ($started) {
        Write-Json @{status='failed'; message=$_.Exception.Message; time=(Get-Date -Format o)} (Join-Path $work 'failure.json')
        Status "FAILED: $($_.Exception.Message)"
    }
    throw
} finally {
    [Threading.Thread]::CurrentThread.CurrentCulture = $oldCulture
    foreach ($key in $environmentNames) { [Environment]::SetEnvironmentVariable($key, $oldEnvironment[$key], 'Process') }
    if ($null -ne $lock) { $lock.Dispose() }
}
