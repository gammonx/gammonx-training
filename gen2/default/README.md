### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen1         |
| sample size  | 80_000       |
| bootstrap    | 1            |
| completed    | 80_000       |
| discarded    | 0            |
| samples      | 4_759_664    |
| avg turns    | 66.4         |
| avg pred var | 0.11678      |
| duration     | 00:05:40:37  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 2            |
| train size   | 4_045_714    |
| val size     | 713_950      |
| train mean   | 0.5322       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5329       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.24945      |
| e1 v-loss    | 0.23302      |
| e187 t-loss  | 0.23002      |
| e187 v-loss  | 0.22775      |
| val gap      | 0.00227      |

### Tournament

===========================================
  Tournament Results gen2 vs. gen1
===========================================
  Model A : training_net (gen2)
  Model B : training_net (gen1)
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 61.1
  Model A wins : 5286 (52.9%)
  Model B wins : 4714 (47.1%)
  A win rate   : 52.86%
  95% CI       : [51.88%, 53.84%]
  Significance : p<0.001 (z=5.72) - highly significant
  Win rate last 10 checkpoints: 52.85% ± 0.01%
  Verdict: INCONCLUSIVE.
===========================================

===========================================
  Tournament Results gen2 vs. gen1
===========================================
  Model A : training_net (gen2)
  Model B : training_net (gen1)
  Modus   : (from game)
  Total games  : 2000
  Decisive     : 2000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 61.2
  Model A wins : 1030 (51.5%)
  Model B wins : 970 (48.5%)
  A win rate   : 51.50%
  95% CI       : [49.31%, 53.69%]
  Significance : p>0.10  (z=1.34) - not significant
  Win rate last 10 checkpoints: 51.51% ± 0.03%
  Verdict: INCONCLUSIVE.
===========================================

===========================================
  Tournament Results gen2 vs. wildbg
===========================================
  Model A : training_net (gen2)
  Model B : wildbg
  Modus   : (from game)
  Total games  : 2000
  Decisive     : 2000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 59.1
  Model A wins : 1050 (52.5%)
  Model B wins : 950 (47.5%)
  A win rate   : 52.50%
  95% CI       : [50.31%, 54.68%]
  Significance : p<0.05  (z=2.24) - significant
  Win rate last 10 checkpoints: 52.46% ± 0.02%
  Verdict: INCONCLUSIVE.
===========================================