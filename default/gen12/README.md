## Review Finding Fixes
- turn input is properly passed
- introduced trailing count for feature vectory holding 4+ checkers
- fixed home board gammon/backgammon evaluation
- record one prediction per move: two-ply when searched, otherwise one-ply; use it for TD bootstrapping
- fixed feature vector normalization

## TD(1.0) 50k gen12-5 1-ply
- batch size 16_384
- learning rate 1e-3

### Trainings Data 1-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen11        |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_112_460    |
| avg turns    | 62.2         |
| avg pred var | 0.12005      |
| duration     | 00:00:16:26  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 11       |
| train size   | 2_650_203    |
| val size     | 462_257      |
| train mean   | 0.5042       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5042       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.26734      |
| e1 t-loss    | 0.23973      |
| e1 v-loss    | 0.23906      |
| e1 t-loss    | 0.23973      |
| e1 v-loss    | 0.23906      |
| val gap      | 0.00000      |

## TD(1.0) 50k gen12-5-1 1-ply
- batch size 16_384
- learning rate 1e-4
- data from gen12-5

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 11       |
| train size   | 2_650_203    |
| val size     | 462_257      |
| train mean   | 0.5042       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5042       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.26734      |
| e1 t-loss    | 0.24085      |
| e1 v-loss    | 0.23944      |
| e5  t-loss   | 0.23755      |
| e5  v-loss   | 0.23874      |
| val gap      | 0.00119      |

===========================================
  gen12-5 vs. gen12-5-1
===========================================
  Model A : training_net.td10.gen12-5
  Model B : training_net.td10.gen12-5-1
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 58.1
  Model A wins : 9754 (48.8%)
  Model B wins : 10246 (51.2%)
  A win rate   : 48.77%
  95% CI       : [48.08%, 49.46%]
  Significance : p<0.001 (z=3.48) � highly significant
  Win rate last 10 checkpoints: 48.77% � 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

## TD(1.0) 50k gen12-6 2-ply
- batch size 16_384
- learning rate 1e-4

### Trainings Data 2-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen11        |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_002_885    |
| avg turns    | 60.1         |
| avg pred var | 0.10968      |
| duration     | 00:11:05:03  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 11       |
| train size   | 2_570_396    |
| val size     | 432_489      |
| train mean   | 0.5044       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5044       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.22367      |
| e1 t-loss    | 0.21157      |
| e1 v-loss    | 0.20951      |
| e4  t-loss   | 0.20918      |
| e4  v-loss   | 0.20918      |
| val gap      | 0.00000      |

===========================================
  gen12-6 vs. gen12-5-1 1-ply
===========================================
  Model A : training_net.td10.gen12-6
  Model B : training_net.td10.gen12-5-1
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.2
  Model A wins : 10639 (53.2%)
  Model B wins : 9361 (46.8%)
  A win rate   : 53.20%
  95% CI       : [52.50%, 53.89%]
  Significance : p<0.001 (z=9.04) � highly significant
  Win rate last 10 checkpoints: 53.20% � 0.00%
  Verdict: A is STRONGER (significant).
===========================================

===========================================
  gen12-6 vs. gen12-5-1 2-ply
===========================================
  Model A : training_net.td10.gen12-6
  Model B : training_net.td10.gen12-5-1
  Modus   : (from game)
  Total games  : 1000
  Decisive     : 1000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.2
  Model A wins : 523 (52.3%)
  Model B wins : 477 (47.7%)
  A win rate   : 52.30%
  95% CI       : [49.20%, 55.38%]
  Significance : p>0.10  (z=1.45) � not significant
  Win rate last 10 checkpoints: 52.31% � 0.04%
  Verdict: INCONCLUSIVE.
===========================================

===========================================
  gen12-6 vs. wildbg
===========================================
  Model A : training_net.td10.gen12-6
  Model B : wildbg
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.3
  Model A wins : 8803 (44.0%)
  Model B wins : 11197 (56.0%)
  A win rate   : 44.01%
  95% CI       : [43.33%, 44.70%]
  Significance : p<0.001 (z=16.93) ? highly significant
  Win rate last 10 checkpoints: 44.01% ? 0.00%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen12-6 vs. wildbg
===========================================
  Model A : training_net.td10.gen12-6
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.9
  Model A wins : 2391 (47.8%)
  Model B wins : 2609 (52.2%)
  A win rate   : 47.82%
  95% CI       : [46.44%, 49.21%]
  Significance : p<0.01  (z=3.08) ? significant
  Win rate last 10 checkpoints: 47.79% ? 0.02%
  Verdict: INCONCLUSIVE.
===========================================