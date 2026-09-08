## TD(0.9) 50k gen4
- lr: 1e-4

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen3         |
| sample size  | 50_000       |
| lambda       | 0.9          |
| gamma        | 1            |
| small s gap  | 0.02         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 2_909_680    |
| avg turns    | 58.2         |
| avg pred var | 0.10992      |
| duration     | 00:00:52:33  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen4         |
| train size   | 2_473_230    |
| val size     | 436_450      |
| train mean   | 0.5038       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 6.7%         |
| val mean     | 0.5038       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 6.7%         |
| parent v-loss| 0.24945      |
| e1 t-loss    | 0.24913      |
| e1 v-loss    | 0.24836      |
| e99  t-loss  | 0.24758      |
| e99  v-loss  | 0.24785      |
| val gap      | 0.00027      |

### Tournaments

===========================================
  gen4 vs. wildbg
===========================================
  Model A : training_net.td09.gen4
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.9
  Model A wins : 1745 (34.9%)
  Model B wins : 3255 (65.1%)
  A win rate   : 34.90%
  95% CI       : [33.59%, 36.23%]
  Significance : p<0.001 (z=21.35) ? highly significant
  Win rate last 10 checkpoints: 34.93% ? 0.02%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen4 vs. gen3
===========================================
  Model A : training_net.td09.gen4
  Model B : training_net.td08.gen3
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.1
  Model A wins : 5013 (50.1%)
  Model B wins : 4987 (49.9%)
  A win rate   : 50.13%
  95% CI       : [49.15%, 51.11%]
  Significance : p>0.10  (z=0.26) ? not significant
  Win rate last 10 checkpoints: 50.13% ? 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

===========================================
  gen4 vs. gen2
===========================================
  Model A : training_net.td09.gen4
  Model B : training_net.gen2
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.8
  Model A wins : 5100 (51.0%)
  Model B wins : 4900 (49.0%)
  A win rate   : 51.00%
  95% CI       : [50.02%, 51.98%]
  Significance : p<0.05  (z=2.00) ? significant
  Win rate last 10 checkpoints: 51.00% ? 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================