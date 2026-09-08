## Trainings Data
- 2-ply self play training data
- no score gap ranked exploration

|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen4         |
| sample size  | 30_000       |
| lambda       | 1/0.95/0.90  |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.0          |
| big s gap    | 0.2          |
| big multi    | 1.0          |
| completed    | 29_997       |
| discarded    | 3            |
| samples      | 1_792_547    |
| avg turns    | 59.8         |
| avg pred var | 0.10442      |
| duration     | 00:23:44:09  |

## TD(0.90) 30k gen5
- lr: 1e-4

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen5         |
| train size   | 1_520_067    |
| val size     | 272_480      |
| train mean   | 0.5046       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 7.3%         |
| val mean     | 0.5046       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 7.2%         |
| parent v-loss| 0.25825      |
| e1 t-loss    | 0.25723      |
| e1 v-loss    | 0.25722      |
| e80  t-loss  | 0.25615      |
| e80  v-loss  | 0.25676      |
| val gap      | 0.00061      |

## TD(0.95) 30k gen5
- lr: 1e-4

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen5         |
| train size   | 1_520_067    |
| val size     | 272_480      |
| train mean   | 0.5045       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 4.7%         |
| val mean     | 0.5045       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 4.7%         |
| parent v-loss| 0.25652      |
| e1 t-loss    | 0.25510      |
| e1 v-loss    | 0.25470      |
| e64  t-loss  | 0.25307      |
| e64  v-loss  | 0.25363      |
| val gap      | 0.00056      |

## Monte Carlo 30k gen5
- lr: 1e-4

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen5         |
| train size   | 1_520_067    |
| val size     | 272_480      |
| train mean   | 0.5044       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5044       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.24336      |
| e1 t-loss    | 0.24125      |
| e1 v-loss    | 0.23867      |
| e88  t-loss  | 0.23539      |
| e88  v-loss  | 0.23612      |
| val gap      | 0.00073      |

## Tournaments

===========================================
  gen5 mc vs gen5 td(0.95) 1-ply
===========================================
  Model A : training_net.mc.gen5
  Model B : training_net.td095.gen5
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 60.5
  Model A wins : 2293 (45.9%)
  Model B wins : 2707 (54.1%)
  A win rate   : 45.86%
  95% CI       : [44.48%, 47.24%]
  Significance : p<0.001 (z=5.85) ? highly significant
  Win rate last 10 checkpoints: 45.88% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen5 mc vs gen5 td(0.90) 1-ply
===========================================
  Model A : training_net.mc.gen5
  Model B : training_net.td090.gen5
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 60.7
  Model A wins : 2344 (46.9%)
  Model B wins : 2656 (53.1%)
  A win rate   : 46.88%
  95% CI       : [45.50%, 48.27%]
  Significance : p<0.001 (z=4.41) ? highly significant
  Win rate last 10 checkpoints: 46.89% ? 0.02%
  Verdict: INCONCLUSIVE.
===========================================

===========================================
  gen5 td(0.95) vs gen5 td(0.90) 1-ply
===========================================
  Model A : training_net.td095.gen5
  Model B : training_net.td090.gen5
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 60.0
  Model A wins : 4949 (49.5%)
  Model B wins : 5051 (50.5%)
  A win rate   : 49.49%
  95% CI       : [48.51%, 50.47%]
  Significance : p>0.10  (z=1.02) ? not significant
  Win rate last 10 checkpoints: 49.49% ? 0.01%
  Verdict: EQUIVALENT (within noise).
===========================================

===========================================
  gen5 td(0.95) vs gen5 td(0.90) 2-ply
===========================================
  Model A : training_net.td095.gen5
  Model B : training_net.td090.gen5
  Modus   : (from game)
  Total games  : 8000
  Decisive     : 8000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 54.9
  Model A wins : 4019 (50.2%)
  Model B wins : 3981 (49.8%)
  A win rate   : 50.24%
  95% CI       : [49.14%, 51.33%]
  Significance : p>0.10  (z=0.42) ? not significant
  Win rate last 10 checkpoints: 50.24% ? 0.01%
  Verdict: EQUIVALENT (within noise).
===========================================

===========================================
  gen5 td(0.95) vs wildbg 1-ply
===========================================
  Model A : training_net.td095.gen5
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 57.7
  Model A wins : 1817 (36.3%)
  Model B wins : 3183 (63.7%)
  A win rate   : 36.34%
  95% CI       : [35.02%, 37.68%]
  Significance : p<0.001 (z=19.32) ? highly significant
  Win rate last 10 checkpoints: 36.32% ? 0.02%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen5 td(0.90) vs wildbg 1-ply
===========================================
  Model A : training_net.td090.gen5
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 57.6
  Model A wins : 1803 (36.1%)
  Model B wins : 3197 (63.9%)
  A win rate   : 36.06%
  95% CI       : [34.74%, 37.40%]
  Significance : p<0.001 (z=19.71) ? highly significant
  Win rate last 10 checkpoints: 36.08% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen5 td(0.95) vs gen4 1-ply
===========================================
  Model A : training_net.td095.gen5
  Model B : training_net.td09.gen4
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 58.0
  Model A wins : 5177 (51.8%)
  Model B wins : 4823 (48.2%)
  A win rate   : 51.77%
  95% CI       : [50.79%, 52.75%]
  Significance : p<0.001 (z=3.54) ? highly significant
  Win rate last 10 checkpoints: 51.77% ? 0.00%
  Verdict: INCONCLUSIVE.
===========================================

===========================================
  gen5 td(0.90) vs gen4 1-ply
===========================================
  Model A : training_net.td090.gen5
  Model B : training_net.td09.gen4
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 9991
  Draws        : 0
  Discarded    : 9
  Avg turns    : 57.7
  Model A wins : 5120 (51.2%)
  Model B wins : 4871 (48.8%)
  A win rate   : 51.25%
  95% CI       : [50.27%, 52.23%]
  Significance : p<0.05  (z=2.49) ? significant
  Win rate last 10 checkpoints: 51.26% ? 0.01%
  Verdict: INCONCLUSIVE.
===========================================