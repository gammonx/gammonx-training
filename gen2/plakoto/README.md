# Trainings Data
|    Metric    |    Value    |
| ------------ | ----------- |
| prior gen    | gen1        |
| sample size  | 3000        |
| completed    | 2875        |
| discarded    | 125         |
| samples      | 271_958     |
| avg turns    | 105         |
| avg pred var | 0.06158     |
| duration     | 00:15:29:47 |

# Training Model
|    Metric    |    Value    |
| ------------ | ----------- |
| train size   | 231_164     |
| val size     | 40_794      |
| train mean   | 0.6514      |
| train min    | 0           |
| train max    | 0           |
| t-near 0.5   | 12.2%       |
| val mean     | 0.6532      |
| val min      | 0           |
| val max      | 0           |
| v-near 0.5   | 12.1%       |
| e1 t-loss    | 0.52674     |
| e1 v-loss    | 0.51611     |
| e100 t-loss  | 0.50862     |
| e100 v-loss  | 0.50787     |

# Review
Model is probably worse than gen1
1. Mean label shifted from 0.571 → 0.651 — this is the primary red flag Nearly 65% of positions in gen2 training data are labeled as white-favorable. This means gen1 developed an asymmetric playing style that systematically favors white, creating biased training data. The model is now learning from a distorted picture of the game rather than balanced gameplay.
2. Smaller relative improvement despite 3× more data More samples didn't help because the data quality degraded. The model is fitting to a biased distribution, not a richer one.
3. Final val_loss regressed — 0.5079 vs gen1's 0.4997 in absolute terms, on an easier baseline.

> Cause was probably that white always started the game and had an advantage