## TD(0.9) 50k gen1
- lr: 1.5e-3f

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen0         |
| sample size  | 50_000       |
| lambda       | 0.9          |
| gamma        | 1            |
| small s gap  | 0.02         |
| big s gap    | 0.2          |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_092_834    |
| avg turns    | 61.9         |
| avg pred var | 0.12338      |
| duration     | 00:00:40:52  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 1        |
| train size   | 2_628_897    |
| val size     | 463_937      |
| train mean   | 0.5033       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 6.1%         |
| val mean     | 0.5034       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 6.3%         |
| parent v-loss| 0.24801      |
| e1 t-loss    | 0.24954      |
| e1 v-loss    | 0.22460      |
| e200 t-loss  | 0.21979      |
| e200 v-loss  | 0.22078      |
| val gap      | 0.00099      |

### Tournaments

===========================================
  gen1 vs. wildbg
===========================================
  Model A : training_net.gen1
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.6
  Model A wins : 1668 (33.4%)
  Model B wins : 3332 (66.6%)
  A win rate   : 33.36%
  95% CI       : [32.07%, 34.68%]
  Significance : p<0.001 (z=23.53) ? highly significant
  Win rate last 10 checkpoints: 33.37% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen1 vs. gen0
===========================================
  Model A : training_net.gen1
  Model B : training_net.gen0
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 57.8
  Model A wins : 2991 (59.8%)
  Model B wins : 2009 (40.2%)
  A win rate   : 59.82%
  95% CI       : [58.45%, 61.17%]
  Significance : p<0.001 (z=13.89) ? highly significant
  Win rate last 10 checkpoints: 59.84% ? 0.01%
  Verdict: A is STRONGER (significant).
===========================================