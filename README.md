# gammonx-training

Training data, model metrics, and evaluation results for neural networks used by the **GammonX.Mars** bot.

## Overview

This repository acts as a versioned record of the iterative self-play training pipeline for GammonX.Mars. Each generation of neural nets is trained via self-play, evaluated against prior generations in head-to-head tournaments, and documented here for reproducibility and comparison.

The pipeline currently covers the following game variants:

| Variant     | Status      |
| ----------- | ----------- |
| Plakoto     | active      |
| Fevga       | active      |
| Tavla       | planned     |
| Portes      | planned     |
| Backgammon  | planned     |

## Repository Structure

```
gen{N}/
  {variant}/
    README.md            # training data stats, model metrics, tournament results
    training_data.csv    # self-play training samples
    training_data.val.csv# validation samples
```

Each generation folder (`gen0`, `gen1`, ...) contains one subfolder per game variant. The `README.md` inside each tracks three sections:

- **Trainings Data** — self-play run statistics (sample size, completed games, avg turns, duration, etc.)
- **Training Model** — dataset and loss metrics (train/val size, mean, min/max, per-epoch losses, val gap)
- **Tournament** — head-to-head results vs. one or more prior generations (win rates, confidence intervals, significance tests, verdict)

## Neural Net Architectures

### Plakoto
`266 → 256 → 128 → 64 → 1`

### Fevga
`216 → 256 → 128 → 64 → 1`

### Default (Backgammon, Tavla, Portes)
`216 → 256 → 128 → 64 → 5`

## Training Approach

Each generation is produced by:

1. Running self-play games using the previous generation's model to generate training samples.
2. Training a new model on accumulated samples from all prior generations (gen 0 to current).
3. Evaluating the new model against the previous generation (and optionally earlier generations) in a tournament.
4. Promoting the new model if the tournament verdict is **STRONGER** with statistical significance.

Tournament significance is assessed via a two-proportion z-test with a 95% confidence interval.