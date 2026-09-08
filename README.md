# gammonx-training

Training data, model metrics, and evaluation results for neural networks used by the **GammonX.Mars** bot.

## Overview

This repository is a versioned record of the iterative self-play training pipeline for the GammonX Mars bot. Neural networks are trained with self-play data, games against the WildBG bot service, and replay data from previous generations. Each candidate is evaluated in head-to-head tournaments and documented for reproducibility and comparison.

The pipeline currently covers the following game variants:

| Variant     | Status      | Champion  |
| ----------- | ----------- | -----------
| Plakoto     | active      | legacy    |
| Fevga       | active      | legacy    |
| Tavla       | active      | gen10     |
| Portes      | active      | gen10     |
| Backgammon  | active      | gen10     |

The game variants `Tavla`, `Portes`, and `Backgammon` share the `Default` neural network. Historical Fevga and Plakoto generations are stored under their respective `legacy` directories.

## TD-Gammon Approach
The neural net learns a value function from self-play games. For each position, it
predicts the expected game outcome. Training targets are constructed from later
position-value estimates and are anchored by the actual result at the end of the game.
This propagates useful learning signals backward without labelled moves or a
hand-crafted evaluation function.

Forward-view TD($\lambda$) builds each target from a weighted mixture of rewards and
later position-value estimates. The trace parameter $\lambda$ controls the trade-off
between bootstrapping and waiting for the observed result, while $\gamma$ controls
discounting. Because backgammon games are finite and the final outcome is not
discounted here, $\gamma = 1.0$.

- **Monte Carlo** ($\lambda = 1.0$): every position is trained directly toward the
  final game result. This is unbiased by the net's intermediate predictions, but has
  higher variance.
- **Forward-view TD(0)** ($\lambda = 0.0$): each position is trained toward the next
  position's predicted value. This learns sooner from intermediate positions, but
  introduces bootstrapping bias.
- **Forward-view TD(0.7)** ($\lambda = 0.7$): combines multi-step targets, balancing
  the lower variance of TD(0) with the stronger outcome signal of Monte Carlo.

The Default network uses five cumulative output probabilities: win, gammon win,
backgammon win, gammon loss, and backgammon loss. Fevga and Plakoto use a single
win-probability output. The bot converts these probabilities into position equity when
ranking candidate moves.

## Repository Structure

```
{model-family}/
  [legacy/]
    gen{N}/
      README.md                       # Run statistics, metrics, and tournament results
      training_data/
        *.csv                         # Training, validation, game, and trajectory data
      training_net*.dat               # TorchSharp neural-network model
      training_net*.dat.meta.json     # Model format, game mode, outputs, and architecture
```

Each model-family directory contains generation directories (`gen0`, `gen1`, ...).
Generation READMEs may record:

- **Training Data**: self-play settings and run statistics, including sample size,
  completed games, average turns, and duration.
- **Training Model**: dataset statistics and per-epoch training and validation losses.
- **Tournaments**: head-to-head results against prior generations or external bots,
  including win rates, confidence intervals, significance tests, and verdicts.

## Neural Net Architectures
Each neural network implementation can define its own model size.

### Plakoto
- (A) `266 → 256 → 128 → 64 → 1`

### Fevga
- (A) `216 → 256 → 128 → 64 → 1`

### Default (Backgammon, Tavla, Portes)
- Legacy (A): `216 → 256 → 128 → 64 → 5`
- New (B): `216 → 384 → 192 → 96 → 5`

## Training Approach

Each generation is produced by:

1. Run self-play games with the previous generation's model to generate training
  samples.
2. Train a candidate model. A typical data mix is 70% previous-generation self-play,
  15% games against the WildBG bot service, and 15% replay data from earlier
  generations.
3. Evaluate the candidate against the previous generation, and optionally earlier
  generations, using tournaments at 1-ply and 2-ply search depth.
4. Promote the candidate when the tournament verdict is **STRONGER** with statistical
  significance. The candidate is marked as **STRONGER** if the lower 95% CI is greater than 52%. A win rate above 50% but below the threshold can be marked as **INCONCLUSIVE** or **EQUIVALENT**.

Tournament significance is assessed with a two-proportion z-test and a 95% confidence
interval.

Monte Carlo and TD($\lambda$) targets are compared periodically, typically after three
to five generations, to select the target strategy for subsequent training.

## Common Learning Rates

- `1.5e-3`: aggressive
- `1e-4` to `3e-4`: normal
- `5e-5`: conservative

## Glossary

- `sp`: self-play
- `wb`: WildBG bot service
- `lm`: linear model
- `MC`: Monte Carlo
- `TD`: temporal-difference learning
- `val`: validation