## TD(0.95) 100k gen6
- low score gap ranked exploration
- 15k replay game data in addition

### Trainings Data self play 1-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen6         |
| sample size  | 60_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.1          |
| big multi    | 0.5          |
| completed    | 60_000       |
| discarded    | 0            |
| samples      | 3_936_350    |
| avg turns    | 65.6         |
| avg pred var | 0.10328      |
| duration     | 00:01:20:59  |

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
| completed    | 25_000       |
| discarded    | 0            |
| samples      | 1_476_840    |
| avg turns    | 59.1         |
| avg pred var | 0.10072      |
| duration     | 00:01:27:35  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 6        |
| train size   | 5_351_681    |
| val size     | 957_452      |
| train mean   | 0.5041       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.2%         |
| val mean     | 0.5041       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.3%         |
| parent v-loss| 0.26808      |
| e1 t-loss    | 0.26698      |
| e1 v-loss    | 0.26719      |
| e100 t-loss  | 0.26564      |
| e100 v-loss  | 0.26622      |
| val gap      | 0.00058      |

### Tournaments

===========================================
  gen6 vs. wildbg 1-ply
===========================================
  Model A : training_net.td095.gen6
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.1
  Model A wins : 1957 (39.1%)
  Model B wins : 3043 (60.9%)
  A win rate   : 39.14%
  95% CI       : [37.80%, 40.50%]
  Significance : p<0.001 (z=15.36) ? highly significant
  Win rate last 10 checkpoints: 39.11% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen6 vs. wildbg 2-ply
===========================================
  Model A : training_net.td095.gen6
  Model B : wildbg
  Modus   : (from game)
  Total games  : 8000
  Decisive     : 8000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.0
  Model A wins : 3599 (45.0%)
  Model B wins : 4401 (55.0%)
  A win rate   : 44.99%
  95% CI       : [43.90%, 46.08%]
  Significance : p<0.001 (z=8.97) ? highly significant
  Win rate last 10 checkpoints: 44.99% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen6 vs gen 5 td(0.95) 1-ply
===========================================
  Model A : training_net.td095.gen6
  Model B : training_net.td095.gen5
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 58.9
  Model A wins : 2747 (54.9%)
  Model B wins : 2253 (45.1%)
  A win rate   : 54.94%
  95% CI       : [53.56%, 56.31%]
  Significance : p<0.001 (z=6.99) ? highly significant
  Win rate last 10 checkpoints: 54.95% ? 0.01%
  Verdict: A is STRONGER (significant).
===========================================

===========================================
  gen6 vs gen 4 1-ply
===========================================
  Model A : training_net.td095.gen6
  Model B : training_net.td09.gen4
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 57.5
  Model A wins : 2781 (55.6%)
  Model B wins : 2219 (44.4%)
  A win rate   : 55.62%
  95% CI       : [54.24%, 56.99%]
  Significance : p<0.001 (z=7.95) ? highly significant
  Win rate last 10 checkpoints: 55.64% ? 0.01%
  Verdict: A is STRONGER (significant).
===========================================