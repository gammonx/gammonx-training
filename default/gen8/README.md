## TD(0.95) 60k gen8
- low score gap ranked exploration
- 10k replay game data from gen5/gen6 in addition

### Trainings Data self play 2-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen7         |
| sample size  | 35_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 34_999       |
| discarded    | 1            |
| samples      | 2_197_329    |
| avg turns    | 62.8         |
| avg pred var | 0.09487      |
| duration     | 01:05:13:21  |

### Trainings Data wildbg 2-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen7         |
| sample size  | 15_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 15_000       |
| discarded    | 0            |
| samples      | 864_561      |
| avg turns    | 57.6         |
| avg pred var | 0.09347      |
| duration     | 00:06:53:16  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen8         |
| train size   | 3_119_792    |
| val size     | 550_105      |
| train mean   | 0.5043       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.3%         |
| val mean     | 0.5043       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.2%         |
| parent v-loss| 0.25495      |
| e1 t-loss    | 0.25441      |
| e1 v-loss    | 0.25469      |
| e14  t-loss  | 0.25392      |
| e14  v-loss  | 0.25460      |
| val gap      | 0.00068      |

### Tournaments

===========================================
  gen8 1-ply vs. gen7 1-ply
===========================================
  Model A : training_net.td095.gen8
  Model B : training_net.td095.gen7
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 58.4
  Model A wins : 4863 (48.6%)
  Model B wins : 5137 (51.4%)
  A win rate   : 48.63%
  95% CI       : [47.65%, 49.61%]
  Significance : p<0.01  (z=2.74) ? significant
  Win rate last 10 checkpoints: 48.64% ? 0.01%
  Verdict: INCONCLUSIVE.
===========================================

===========================================
  gen8 1-ply vs. wildbg 1-ply
===========================================
  Model A : training_net.td095.gen8
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.5
  Model A wins : 1904 (38.1%)
  Model B wins : 3096 (61.9%)
  A win rate   : 38.08%
  95% CI       : [36.74%, 39.43%]
  Significance : p<0.001 (z=16.86) ? highly significant
  Win rate last 10 checkpoints: 38.10% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================