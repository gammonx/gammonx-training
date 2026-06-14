### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen0         |
| sample size  | 80_000       |
| bootstrap    | 1            |
| completed    | 80_000       |
| discarded    | 0            |
| samples      | 4_653_108    |
| avg turns    | 65.0         |
| avg pred var | 0.12577      |
| duration     | 00:08:04:31  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 1            |
| train size   | 3_955_141    |
| val size     | 697_967      |
| train mean   | 0.5349       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5337       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.25341      |
| e1 v-loss    | 0.23454      |
| e200 t-loss  | 0.23004      |
| e200 v-loss  | 0.22812      |
| val gap      | 0.00192      |

### Tournament

===========================================
  Tournament Results gen1 vs. gen0
===========================================
  Model A : training_net (gen1)
  Model B : training_net (gen2)
  Modus   : (from game)
  Total games  : 1000
  Decisive     : 1000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 61.9
  Model A wins : 645 (64.5%)
  Model B wins : 355 (35.5%)
  A win rate   : 64.50%
  95% CI       : [61.48%, 67.41%]
  Significance : p<0.001 (z=9.17) - highly significant
  Win rate last 10 checkpoints: 64.35% ± 0.09%
  Verdict: A is STRONGER (significant).
===========================================

===========================================
  Tournament Results gen1 vs. wildbg
===========================================
  Model A : training_net (gen1)
  Model B : wildbg
  Modus   : (from game)
  Total games  : 1000
  Decisive     : 1000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 60.4
  Model A wins : 537 (53.7%)
  Model B wins : 463 (46.3%)
  A win rate   : 53.70%
  95% CI       : [50.60%, 56.77%]
  Significance : p<0.05  (z=2.34) - significant
  Win rate last 10 checkpoints: 53.75% ± 0.05%
  Verdict: INCONCLUSIVE.
===========================================