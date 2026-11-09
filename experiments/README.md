# GammonX hyperparameter experiments

`run-search.ps1` drives the existing GammonX.Mars.Training console app using a JSON configuration. It can be reused with other generations, model families, datasets and candidate settings. It uses existing games, runs fixed-size 1-ply screenings and packages two models for a remote 2-ply comparison.

The completed gen13 findings are in [RESULTS.md](RESULTS.md). Compact results are in `screening.csv` and `result.json`; the selected model pair is in `remote-2ply/`. Supporting logs and original run notes are in `evidence.zip`. Rebuilt datasets, losing models and transient files from that experiment have been removed. The cleaned historical experiment is not a resumable run of the new runner.

## Requirements

- Windows PowerShell 5.1 or PowerShell 7 on Windows.
- A built `GammonX.Mars.Training.exe` with its normal dependencies. Point `appPath` at the executable; the runner does not build the server repository.
- Training and validation CSVs, a parent model to continue from, and a reference model. All candidates load the same parent; their architecture and output semantics come from it.
- Training/validation trajectory sidecars and game metadata when using `targetCandidates`. Their filenames must follow the conventions below.
- Disk space for the original data, rebuilt datasets, model checkpoints and one dataset's binary caches. `keepBinaryCaches: false` removes only generated binary caches after each training stage; rebuilt CSVs remain available for resume.

## Start an experiment

Run these commands from this directory:

```powershell
Copy-Item .\search.example.json .\my-search.json
# Edit my-search.json: paths, source targets, candidates and a new outputDirectory.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run-search.ps1 -ConfigPath .\my-search.json -ValidateOnly
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run-search.ps1 -ConfigPath .\my-search.json
```

`-ValidateOnly` checks paths/settings and prints the plan without writing files or starting training. The real run also hashes inputs before starting. On a machine that already permits scripts, use `& .\run-search.ps1 -ConfigPath .\my-search.json` directly. `-ExecutionPolicy Bypass` applies only to that launched PowerShell process; it does not change the machine's policy.

All paths inside JSON resolve relative to the JSON file, so moving or copying a configuration may require changing its paths. Absolute paths are also supported. The example points at the original gen13 source data and an unused `runs/gen13-new-search` output folder. It describes the same nine configurations as the historical search, but stochastic training and dice mean it will not reproduce the same scores.

To run independently of the chat in a hidden background window:

```powershell
$runner = (Resolve-Path .\run-search.ps1).Path
$plan = (Resolve-Path .\my-search.json).Path
$arguments = '-NoProfile -ExecutionPolicy Bypass -File "{0}" -ConfigPath "{1}"' -f $runner, $plan
Start-Process powershell.exe -ArgumentList $arguments -WindowStyle Hidden -PassThru
```

The computer must stay awake and the user session must remain available. Follow `progress.log` in the configured output directory with `Get-Content <run-directory>\progress.log -Tail 10 -Wait`. No chat observation is required.

## Configuration

JSON has no comments; the example includes all available fields. Numeric values must be JSON numbers, and booleans must be `true` or `false`.

| Field | Meaning / default |
|---|---|
| `appPath` | Required path to the built training executable. |
| `trainingCsv` | Required source training CSV. Validation is the same stem with `.val.csv`. |
| `parentModel` | Required starting weights for every candidate. |
| `referenceModel` | Required initial screening opponent. |
| `baselineChallenger` | Optional second existing model for a preliminary comparison; omit to skip. |
| `outputDirectory` | Required new/empty directory, or a directory created by this runner with its manifest. Must not contain input files. |
| `gameMode` | `Backgammon` (default), `Plakoto`, `Fevga`, `Tavla` or `Portes`; must match the models/data. |
| `screenGames` | Fixed games per baseline/screening tournament; default 10,000, minimum 100. |
| `evalBatchSize` | Tournament evaluation batch size; default 64. |
| `processCount` | Concurrent tournament games; default logical processor count. |
| `producerCount` / `queueCapacity` | Training data-loader settings; default 8 / 16. |
| `torchThreads` | `OMP_NUM_THREADS` and `MKL_NUM_THREADS` for child processes; default 8. |
| `keepBinaryCaches` | Keep generated `.bin` caches; default `false`. The app currently reconverts CSVs when retraining anyway. |
| `sourceTargets` | Required `{ "lambda": 0.7, "gamma": 1 }` describing labels already in `trainingCsv`. This declaration is supplied by you; it cannot be inferred from the CSV. |
| `optimizerCandidates` | Required nonempty array of `{ "name": "trial", "learningRate": 0.0001, "batchSize": 16384 }`. All use source labels. |
| `targetCandidates` | Optional array of `{ "name": "td050", "lambda": 0.5, "gamma": 1 }`; default empty. These inherit the best optimizer candidate's initial LR and batch size. |

Candidate names must be unique across both arrays, 1-80 characters long, start with a letter or number, and contain only letters, numbers, `_` or `-`. Learning rates must be finite and positive; lambda/gamma must be in [0,1]; resource counts must be positive integers.

For `sample.csv`, the expected dataset files are:

```text
sample.csv
sample.val.csv
sample.trajectory.csv
sample.val.trajectory.csv
sample.games.csv
```

The last three are needed only for target rebuilding. Rebuild mode preserves original row order and game partitions. It reads recorded trajectory predictions; it does not re-evaluate a teacher model. If a target candidate matches `sourceTargets`, it reuses the source CSV instead of rebuilding.

## What the runner does

1. Validates configuration and input paths, locks the run directory and fingerprints the runner, configuration, executable/adjacent DLL, source files, parent/reference weights and available model metadata.
2. Optionally plays `referenceModel` (A) against `baselineChallenger` (B). It switches to B only if the complete equity interval for A is below zero; otherwise it retains the initial reference.
3. Trains every optimizer candidate from `parentModel` and screens it against that fixed reference.
4. Selects the optimizer with the highest screening point equity. Each target candidate uses that optimizer's LR/batch, rebuilds labels if needed, trains from the same parent and gets its own screening tournament.
5. Selects the highest-equity candidate across both stages, breaking exact ties by name. Writes `result.json` only after preparing the remote model pair and checksums.

All local tournaments use **Hard (1-ply)** for both models. Every completed report must contain the requested scored-game count, zero discarded games and a numeric point-equity interval. Unexpected app exits, missing outputs or invalid reports stop execution and write `failure.json`. Do not extend a tournament repeatedly until its interval excludes zero.

Initial LR/batch are configurable. AdamW, weight decay, maximum epochs, scheduler, early stopping, minimum delta and best-checkpoint selection remain controlled by the app's `NetTrainer` / `NetTrainingMetadata`; the current console does not prompt for them. The child .NET process runs with invariant globalization so decimal-point parameters are parsed consistently; rebuild success also accepts localized thousands separators. Environment settings are restored when the runner exits.

## Resume and diagnose

Rerun the same command after a failure. The runner checks its manifest, revalidates completed-stage logs and required outputs, skips those stages and retries the first unfinished stage. Previous `failure.json` files are archived with timestamps. Input fingerprints are recomputed on resume; hashing a large dataset takes time.

Use a **new outputDirectory** if you change the JSON, script, data, model weights/metadata or app executable/DLL. The runner refuses stale resume state and refuses an existing nonempty folder without its own manifest. Do not reuse the cleaned historical `tuning/` directory as output. Keep source files and app binaries unchanged while a run is active; a machine restart, logout or build that replaces the executable can interrupt it.

The run lock prevents simultaneous runners in the same directory. If a killed runner left its app process alive, the next invocation reports that PID and refuses to launch a duplicate. Inspect `active.json` and wait for or stop that specific process before resuming. A partial stage without a completion marker is rerun. If a completed tournament was rejected because it discarded games, diagnose its log and remove only that stage's `.done.json` to rerun it deliberately.

| Output | Purpose |
|---|---|
| `manifest.json`, `.run.lock` | Input/config identity and exclusive running lock. |
| `progress.log`, `active.json` | Stage history and currently/last launched child PID; active file is removed on success. |
| `*.input.txt`, `*.log`, `*.stderr.log` | Exact console answers and process output. |
| `*.done.json`, `failure*.json` | Completed-stage markers and failure history. |
| `*.csv`, `*.dat`, `*.dat.meta.json` | Rebuilt datasets and trained models. |
| `screening.csv` | Completed candidate configurations and equity estimates, updated after every screen. |
| `result.json` | Selected finalist/reference after the whole experiment finishes. |
| `remote-2ply/` | `model-a.dat` (challenger), `model-b.dat` (reference), available metadata, `comparison.json` and `sha256.csv`. |

New packages use stable A/B filenames to avoid name collisions. Metadata `Name` fields are updated when present; training provenance remains intact. Copy the whole package to your remote server. Select Expert (2-ply) for both models there and choose a fixed comparison size before starting. Historical gen13 package filenames are preserved as recorded in RESULTS.md.

## Interpreting results and maintaining the adapter

This is a staged search, not an exhaustive grid. One run per candidate mixes parameter effects with training variability. You can add repeats under unique names; the script ranks individual checkpoints, not averages over seeds. Console training and tournament RNG seeds are not exposed, so exact results are not reproducible. `sourceTargets` describes the data, not the reference model's history.

Rank by actual cubeless points/game. Validation losses against different target definitions are not directly comparable. Screening intervals are unadjusted; selecting the largest score across many trials introduces selection bias. A winning screen is a candidate for independent evaluation, not an automatic model promotion. Gamma 1 matches eventual undiscounted outcomes; changing gamma changes target interpretation.

The console adapter depends on menu modes 2 (train), 5 (tournament), 7 (rebuild), the game-mode order and the Hard bot-level index. If app prompts change, update `Candidate`, `Screen` and `Rebuild` answer arrays in the script and start a new run directory. Adjust report parsing if the app's report labels change.

The script has built-in help (`Get-Help .\run-search.ps1 -Full`). Run its integration checks without real training:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\test-run-search.ps1
```

The checks compile a tiny fake console app in a temporary directory and exercise configuration validation, optimizer/target selection, Swiss formatting, cache cleanup, packaging, resume, changed-input protection, locking, unsafe names, process failures and discarded-game rejection. They remove their own temporary files afterward. They validate orchestration, not neural-network behavior or compatibility with future prompt changes.
