## Monte Carlo 50k gen0
- lr: 1.5e-3f

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | linear model |
| sample size  | 50_000       |
| lambda       | 1.0          |
| gamma        | 1            |
| small s gap  | 0.04         |
| big s gap    | 0.25         |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 2_858_599    |
| avg turns    | 57.2         |
| avg pred var | -            |
| duration     | 00:00:04:43  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 0        |
| train size   | 2_429_818    |
| val size     | 428_781      |
| train mean   | 0.5046       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5045       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| parent v-loss| -            |
| e1 t-loss    | 0.24335      |
| e1 v-loss    | 0.19023      |
| e96  t-loss  | 0.17173      |
| e96  v-loss  | 0.17406      |
| val gap      | 0.00233      |

### Tournaments

===========================================
  gen0 vs. wildbg
===========================================
  Model A : training_net.gen0
  Model B : wildbg
  Modus   : (from game)
  Total games  : 1000
  Decisive     : 1000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 58.6
  Model A wins : 234 (23.4%)
  Model B wins : 766 (76.6%)
  A win rate   : 23.40%
  95% CI       : [20.88%, 26.12%]
  Significance : p<0.001 (z=16.82) ? highly significant
  Win rate last 10 checkpoints: 23.44% ? 0.04%
  Verdict: B is STRONGER (significant).
===========================================