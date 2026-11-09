# Gen13 configuration search results

Completed November 8, 2026, at 16:28 Europe/Zurich. The best observed candidate uses the original configuration: TD(lambda)=0.70, gamma=1, initial learning rate=1e-4, batch size=16,384. It is a new training run from gen12-6, not further training of gen13-3.

All candidates used the same existing 50,000-game sample, original game-level training/validation split, architecture B, monotonic cumulative outputs, AdamW and the app's validation-based scheduler and checkpoint selection. The nine screenings and baseline comparison each completed 10,000 games at 1-ply, with zero discarded games: 100,000 completed evaluation games total. The interrupted original 50k baseline run is excluded. No new training sample or local 2-ply evaluation was performed.

## Playing-strength results

All rows below are candidate A against the original `training_net.td070.gen13-3.dat`. Points are actual signed cubeless points per game, including gammons and backgammons. Intervals are the app's approximate, unadjusted 95% intervals.

| Lambda | Gamma | Initial LR | Batch | Points/game | 95% interval |
|---:|---:|---:|---:|---:|---|
| **0.70 (repeat)** | **1** | **1e-4** | **16,384** | **+0.0356** | **[+0.0077, +0.0635]** |
| 0.70 | 1 | 5e-5 | 16,384 | -0.0442 | [-0.0721, -0.0163] |
| 0.70 | 1 | 2e-4 | 16,384 | +0.0075 | [-0.0205, +0.0355] |
| 0.70 | 1 | 1e-4 | 8,192 | -0.0021 | [-0.0297, +0.0255] |
| 0.70 | 1 | 1e-4 | 32,768 | +0.0073 | [-0.0205, +0.0351] |
| 0.50 | 1 | 1e-4 | 16,384 | -0.0015 | [-0.0292, +0.0262] |
| 0.85 | 1 | 1e-4 | 16,384 | -0.0245 | [-0.0525, +0.0035] |
| 0.95 | 1 | 1e-4 | 16,384 | -0.0500 | [-0.0783, -0.0217] |
| 0.70 | 0.995 | 1e-4 | 16,384 | +0.0096 | [-0.0181, +0.0373] |

The separate original TD0.70 vs original TD0.95 baseline comparison scored +0.0234 for TD0.70, interval [-0.0044, +0.0512]. This favors TD0.70 numerically but remains inconclusive. It is distinct from the newly trained TD0.95 candidate above.

## Interpretation

- Retain lambda 0.70, gamma 1, LR 1e-4 and batch 16,384 as the working configuration. None of the alternative settings established an improvement over the original TD0.70 reference.
- The 5e-5 learning-rate run and newly trained lambda 0.95 run lost with nominal intervals excluding zero. These are individual runs, not replicated estimates of each configuration's expected strength.
- Lambda 0.50, both alternate batch sizes, LR 2e-4 and gamma 0.995 remain inconclusive against the reference. Lambda 0.85 also remains inconclusive despite its negative estimate. Inconclusive does not establish equivalence.
- The repeat candidate reached validation loss 0.21916 at epoch 12. The original model's recorded best is also 0.21916. The LR 5e-5 and 2e-4 runs likewise reported 0.21916, yet their tournament results differed materially. Matching rounded validation losses does not ensure equal playing strength.
- Lambda 0.50 had validation loss 0.21835, but that is against different targets. Absolute losses across lambda/gamma settings cannot rank playing strength.
- This is a finite staged, single-run search. It does not prove a global optimum or isolate hyperparameter effects from training variability. Picking the largest of nine screening estimates introduces selection bias; the reported intervals are not adjusted for those comparisons. An independent remote comparison is needed before replacing the reference.