## TD(0.85) 300k gen2
- lr: 1.5e-3f

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen1         |
| sample size  | 300_000      |
| lambda       | 0.85         |
| gamma        | 1            |
| small s gap  | 0.02         |
| big s gap    | 0.2          |
| completed    | 300_000      |
| discarded    | 0            |
| samples      | 17_494_702   |
| avg turns    | 58.3         |
| avg pred var | 0.11353      |
| duration     | 00:03:53:05  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 2        |
| train size   | 14_870_498   |
| val size     | 2_624_204    |
| train mean   | 0.5039       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 7.7%         |
| val mean     | 0.5039       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 7.7%         |
| parent v-loss| 0.23078      |
| e1 t-loss    | 0.23220      |
| e1 v-loss    | 0.22915      |
| e96  t-loss  | 0.22872      |
| e96  v-loss  | 0.22894      |
| val gap      | 0.00022      |

### Tournaments

===========================================
  gen2 vs. wildbg
===========================================
  Model A : training_net.gen2
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.4
  Model A wins : 1680 (33.6%)
  Model B wins : 3320 (66.4%)
  A win rate   : 33.60%
  95% CI       : [32.30%, 34.92%]
  Significance : p<0.001 (z=23.19) ? highly significant
  Win rate last 10 checkpoints: 33.62% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen2 vs. gen1
===========================================
  Model A : training_net.gen2
  Model B : training_net.gen1
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.2
  Model A wins : 2625 (52.5%)
  Model B wins : 2375 (47.5%)
  A win rate   : 52.50%
  95% CI       : [51.11%, 53.88%]
  Significance : p<0.001 (z=3.54) ? highly significant
  Win rate last 10 checkpoints: 52.52% ? 0.01%
  Verdict: INCONCLUSIVE.
===========================================