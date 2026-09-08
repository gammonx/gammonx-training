# Changelog

## 08.09.2026
- updated training pipeline documentation

## 06.09.2026
- added selective 2-ply search policy (first phase implementation)
- changes to NetTrainer.cs
    - batch size: 16384
    - learning rate: 1e-4
    - optimizer: AdamW
    - weight decay: 1e-4
    - maximum epochs: 50
    - early-stop patience: 8
    - minimum delta: 1e-5
    - scheduler: ReduceLROnPlateau

## 01.09.2026
- updated training pipeline documentation

## 14.08.2026
- feature semantics changes for plakoto, fevga, default bot
    - invalidates training data and models from gen0 to gen9 (legacy)
- fixed an issue where turn count was not properly recorded in self play
- applies to training data and models starting from gen10
- training generation now writes trajectory and per-game metadata sidecars
- added forward-view TD(lambda) target rebuilding without changing the feature/label CSV format
- added per game data shuffling
- added proper epsilon greedy exploration
- only return unique legal moves for training (hashed end board state)
- added score gap analysis
- added score gap based ranked exploration
- added output constraint analysis and enforcement
- added 2-ply deep move search
- increased net architecture