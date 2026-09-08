## TD(0.95) 100k gen7
- low score gap ranked exploration
- 15k replay game data from gen5/gen6 in addition

### Trainings Data self play
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen6 sp 1ply |
| sample size  | 50_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.1          |
| big multi    | 0.5          |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_138_681    |
| avg turns    | 62.8         |
| avg pred var | 0.09553      |
| duration     | 00:01:04:21  |

### Trainings Data wildbg 2-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen6         |
| sample size  | 10_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.1          |
| big multi    | 0.5          |
| completed    | 10_000       |
| discarded    | 0            |
| samples      | 570_067      |
| avg turns    | 57.0         |
| avg pred var | 0.09058      |
| duration     | 00:04:31:12  |

### Trainings Data wildbg 1-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen6         |
| sample size  | 25_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.1          |
| big multi    | 0.5          |
| completed    | 24_999       |
| discarded    | 1            |
| samples      | 1_444_770    |
| avg turns    | 57.8         |
| avg pred var | 0.09352      |
| duration     | 00:01:27:02  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen7         |
| train size   | 5_157_714    |
| val size     | 918_206      |
| train mean   | 0.5043       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.2%         |
| val mean     | 0.5043       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.3%         |
| parent v-loss| 0.25581      |
| e1 t-loss    | 0.25610      |
| e1 v-loss    | 0.25518      |
| e200 t-loss  | 0.25567      |
| e200 v-loss  | 0.25503      |
| val gap      | 0.00015      |

### Tournaments

===========================================
  gen7 2-ply vs wildbg
===========================================
  Model A : training_net.td095.gen7
  Model B : wildbg
  Modus   : (from game)
  Total games  : 3000
  Decisive     : 2993
  Draws        : 0
  Discarded    : 7
  Avg turns    : 55.0
  Model A wins : 1334 (44.6%)
  Model B wins : 1659 (55.4%)
  A win rate   : 44.57%
  95% CI       : [42.80%, 46.36%]
  Significance : p<0.001 (z=5.94) ? highly significant
  Win rate last 10 checkpoints: 44.55% ? 0.02%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen7 1-ply vs wildbg
===========================================
  Model A : training_net.td095.gen7
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.4
  Model A wins : 1985 (39.7%)
  Model B wins : 3015 (60.3%)
  A win rate   : 39.70%
  95% CI       : [38.35%, 41.06%]
  Significance : p<0.001 (z=14.57) ? highly significant
  Win rate last 10 checkpoints: 39.70% ? 0.01%
  Verdict: B is STRONGER (significant).
=========================================== 

===========================================
  gen7 1-ply vs gen6 1-ply
===========================================
  Model A : training_net.td095.gen7
  Model B : training_net.td095.gen6
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 19996
  Draws        : 0
  Discarded    : 4
  Avg turns    : 57.8
  Model A wins : 10080 (50.4%)
  Model B wins : 9916 (49.6%)
  A win rate   : 50.41%
  95% CI       : [49.72%, 51.10%]
  Significance : p>0.10  (z=1.16) ? not significant
  Win rate last 10 checkpoints: 50.41% ? 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

===========================================
   gen7 1-ply vs gen5 1-ply
===========================================
  Model A : training_net.td095.gen7
  Model B : training_net.td095.gen5
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 59.0
  Model A wins : 2658 (53.2%)
  Model B wins : 2342 (46.8%)
  A win rate   : 53.16%
  95% CI       : [51.77%, 54.54%]
  Significance : p<0.001 (z=4.47) ? highly significant
  Win rate last 10 checkpoints: 53.14% ? 0.01%
  Verdict: INCONCLUSIVE.
===========================================