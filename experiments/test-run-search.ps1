#Requires -Version 5.1
<#
.SYNOPSIS
Exercises the runner with a tiny fake console app; never trains a real network.
.EXAMPLE
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\test-run-search.ps1
#>
$ErrorActionPreference = 'Stop'
$runner = Join-Path $PSScriptRoot 'run-search.ps1'
$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$testRoot = Join-Path $tempBase ('gammonx-search-test-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $testRoot | Out-Null
function Assert($condition, [string]$message) { if (!$condition) { throw $message } }
function Run([string]$file, [bool]$success = $true, [switch]$Validate) {
    $arguments = @('-NoProfile','-ExecutionPolicy','Bypass','-File',$runner,'-ConfigPath',$file)
    if ($Validate) { $arguments += '-ValidateOnly' }
    $oldPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $output = & powershell.exe @arguments 2>&1
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $oldPreference }
    if (($code -eq 0) -ne $success) { throw "Unexpected exit $code : $($output -join [Environment]::NewLine)" }
    return ($output -join [Environment]::NewLine)
}
try {
    $mockExe = Join-Path $testRoot 'mock.exe'
    Add-Type -OutputAssembly $mockExe -OutputType ConsoleApplication -TypeDefinition @'
using System;
using System.IO;
using System.Collections.Generic;
public static class MockTrainingApp {
 static string[] Paths(string p) {
  string v=Path.ChangeExtension(p,".val.csv");
  return new[]{p,v,Path.ChangeExtension(p,".trajectory.csv"),Path.ChangeExtension(v,".trajectory.csv"),Path.ChangeExtension(p,".games.csv")};
 }
 public static int Main() {
  var a=new List<string>(); string line;
  while((line=Console.ReadLine())!=null) a.Add(line);
  File.AppendAllText("events.txt",a[0]+"|"+string.Join("|",a.ToArray())+Environment.NewLine);
  if(File.Exists("fail-once")) {File.Delete("fail-once"); Console.Error.WriteLine("Simulated app failure"); return 3;}
  if(a[0]=="2") {
   File.WriteAllText(a[3],"mock weights"); File.WriteAllText(a[3]+".meta.json","{\"FormatVersion\":1}");
   string b=Path.GetFileNameWithoutExtension(a[2]); File.WriteAllText(b+".bin","cache"); File.WriteAllText(b+".val.bin","cache");
   Console.WriteLine("Model saved: "+a[3]);
  } else if(a[0]=="7") {
   string[] dest=Paths(a[7]); for(int i=0;i<5;i++) File.Copy(a[2+i],dest[i],true);
   Console.WriteLine("Rebuilt 3'107 labels with lambda="+a[8]+" gamma="+a[9]+".");
  } else if(a[0]=="5") {
   bool negative=Path.GetFileName(a[2]).StartsWith("slow");
   string equity=negative?"-0.0400":(Path.GetFileName(a[2]).StartsWith("target")?"+0.0600":"+0.0400");
   Console.WriteLine("Scored games : "+a[6]); Console.WriteLine("Discarded : "+(File.Exists("discard")?"1":"0"));
   Console.WriteLine("A cubeless points/game : "+equity);
   Console.WriteLine("Approx. 95% equity CI : "+(negative?"[-0.0700, -0.0100]":"[+0.0100, +0.0900]"));
   Console.WriteLine("Verdict: mock");
  } else return 4;
  return 0;
 }
}
'@
    foreach ($name in @('data.csv','data.val.csv','data.trajectory.csv','data.val.trajectory.csv','data.games.csv','parent.dat','reference.dat','other.dat')) {
        [IO.File]::WriteAllText((Join-Path $testRoot $name), "header`nrow`n")
    }
    $plan = [ordered]@{appPath=$mockExe; trainingCsv='data.csv'; parentModel='parent.dat'; referenceModel='reference.dat'; baselineChallenger='other.dat';
        outputDirectory='run'; screenGames=100; sourceTargets=@{lambda=0.7; gamma=1};
        optimizerCandidates=@(@{name='slow'; learningRate=0.00005; batchSize=8},@{name='fast';learningRate=0.0001;batchSize=16});
        targetCandidates=@(@{name='target050';lambda=0.5;gamma=1})}
    $config = Join-Path $testRoot 'plan.json'
    $plan | ConvertTo-Json -Depth 8 | Set-Content $config
    $null = Run $config -Validate
    Assert (!(Test-Path (Join-Path $testRoot 'run'))) 'ValidateOnly wrote files.'
    $null = Run $config
    $runRoot = Join-Path $testRoot 'run'
    $result = Get-Content (Join-Path $runRoot 'result.json') -Raw | ConvertFrom-Json
    Assert ($result.finalist.name -eq 'target050') 'Wrong finalist.'
    Assert ($result.finalist.batch -eq 16 -and $result.finalist.lr -eq 0.0001) 'Target stage did not inherit the best optimizer.'
    Assert (@(Get-ChildItem $runRoot -Filter '*.bin').Count -eq 0) 'Temporary caches were retained.'
    Assert ((Get-FileHash (Join-Path $runRoot 'target050.dat')).Hash -eq (Get-FileHash (Join-Path $runRoot 'remote-2ply\model-a.dat')).Hash) 'Handoff differs from finalist.'
    $events = [IO.File]::ReadAllText((Join-Path $runRoot 'events.txt'))
    $null = Run $config
    Assert ($events -ceq [IO.File]::ReadAllText((Join-Path $runRoot 'events.txt'))) 'Resume reran completed stages.'
    Add-Content (Join-Path $testRoot 'parent.dat') 'changed'
    Assert ((Run $config $false) -match 'inputs changed') 'Changed inputs reused checkpoints.'
    [IO.File]::WriteAllText((Join-Path $testRoot 'parent.dat'), "header`nrow`n")
    $lock = [IO.File]::Open((Join-Path $runRoot '.run.lock'), 'Open', 'ReadWrite', 'None')
    try { $null = Run $config $false } finally { $lock.Dispose() }
    $plan.optimizerCandidates[0].name = '../escape'
    $badConfig = Join-Path $testRoot 'bad.json'
    $plan | ConvertTo-Json -Depth 8 | Set-Content $badConfig
    Assert ((Run $badConfig $false -Validate) -match 'unique safe filenames') 'Unsafe candidate name was accepted.'
    $plan.optimizerCandidates[0].name = 'slow'
    $plan.outputDirectory = 'failure-run'
    $failureConfig = Join-Path $testRoot 'failure.json'
    $plan | ConvertTo-Json -Depth 8 | Set-Content $failureConfig
    $failureRun = Join-Path $testRoot 'failure-run'
    $null = Run $failureConfig
    # Remove only the mock baseline checkpoint and request a process failure.
    Remove-Item -LiteralPath (Join-Path $failureRun 'baseline.done.json')
    [IO.File]::WriteAllText((Join-Path $failureRun 'fail-once'),'fail')
    $null = Run $failureConfig $false
    Assert (Test-Path (Join-Path $failureRun 'failure.json')) 'App failure was not recorded.'
    $null = Run $failureConfig
    Assert (!(Test-Path (Join-Path $failureRun 'failure.json'))) 'Successful resume left an active failure.'
    # A scored-game report with discarded games must stop selection.
    Remove-Item -LiteralPath (Join-Path $failureRun 'baseline.done.json')
    [IO.File]::WriteAllText((Join-Path $failureRun 'discard'),'discard')
    Assert ((Run $failureConfig $false) -match 'Incomplete or invalid tournament') 'Discarded games were accepted.'
    $plan.Remove('baselineChallenger')
    $plan.targetCandidates = @()
    $plan.outputDirectory = 'optimizer-only'
    $plan | ConvertTo-Json -Depth 8 | Set-Content $config
    $null = Run $config
    $minimal = Get-Content (Join-Path $testRoot 'optimizer-only\result.json') -Raw | ConvertFrom-Json
    Assert ($minimal.finalist.name -eq 'fast' -and $null -eq $minimal.baselineComparison) 'Optimizer-only plan failed.'
    Write-Output 'Passed: validation, staged selection, Swiss formatting, cache cleanup, handoff, resume, changed-input protection, lock, safe names, failure recovery and discarded-game rejection.'
} finally {
    $resolved = [IO.Path]::GetFullPath($testRoot)
    if (!$resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -or [IO.Path]::GetFileName($resolved) -notmatch '^gammonx-search-test-[0-9a-f]{32}$') { throw 'Unexpected test directory; cleanup refused.' }
    Remove-Item -LiteralPath $resolved -Recurse -Force
}
