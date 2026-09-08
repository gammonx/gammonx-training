## TD(0.95) 100k gen9-3 1.5-ply
- same data as first gen9
- revised NetTrainer.cs configuration. See changelog.
- batch size: 4096
- learning rate 1e-4

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 9        |
| train size   | 5_322_925    |
| val size     | 941_621      |
| train mean   | 0.5041       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.5%         |
| val mean     | 0.5041       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.26579      |
| e1 t-loss    | 0.26225      |
| e1 v-loss    | 0.26187      |
| e42 t-loss   | 0.25645      |
| e42 v-loss   | 0.25846      |
| val gap      | 0.00733      |

### Tournaments

===========================================
  gen9-3 1-ply vs gen7 1-ply
===========================================
  Model A : training_net.td095.gen9-3
  Model B : training_net.td095.gen7
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 57.3
  Model A wins : 2534 (50.7%)
  Model B wins : 2466 (49.3%)
  A win rate   : 50.68%
  95% CI       : [49.29%, 52.06%]
  Significance : p>0.10  (z=0.96) ? not significant
  Win rate last 10 checkpoints: 50.67% ? 0.01%
  Verdict: INCONCLUSIVE.
===========================================

===========================================
  gen9-3 1-ply vs gen9-2 1-ply
===========================================
  Model A : training_net.td095.gen9-3
  Model B : training_net.td095.gen9-2
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.7
  Model A wins : 2455 (49.1%)
  Model B wins : 2545 (50.9%)
  A win rate   : 49.10%
  95% CI       : [47.72%, 50.49%]
  Significance : p>0.10  (z=1.27) ? not significant
  Win rate last 10 checkpoints: 49.08% ? 0.01%
  Verdict: INCONCLUSIVE.
===========================================

## TD(0.95) 100k gen9-2 1.5-ply
- same data as first gen9
- revised NetTrainer.cs configuration. See changelog.
- batch size: 16384
- learning rate 1e-4

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 9        |
| train size   | 5_322_925    |
| val size     | 941_621      |
| train mean   | 0.5041       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.5%         |
| val mean     | 0.5041       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.26579      |
| e1 t-loss    | 0.26329      |
| e1 v-loss    | 0.26321      |
| e49  t-loss  | 0.25696      |
| e49  v-loss  | 0.25880      |
| val gap      | 0.00699      |

### Tournaments

===========================================
  gen9-2 TD(0.95) 1-ply vs wildbg
===========================================
  Model A : training_net.td095.gen9-2
  Model B : wildbg
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.7
  Model A wins : 3985 (39.9%)
  Model B wins : 6015 (60.2%)
  A win rate   : 39.85%
  95% CI       : [38.89%, 40.81%]
  Significance : p<0.001 (z=20.30) ? highly significant
  Win rate last 10 checkpoints: 39.86% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen9-2 TD(0.95) 1-ply vs gen7 1-ply
===========================================
  Model A : training_net.td095.gen9-2
  Model B : training_net.td095.gen7
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 57.1
  Model A wins : 5036 (50.4%)
  Model B wins : 4964 (49.6%)
  A win rate   : 50.36%
  95% CI       : [49.38%, 51.34%]
  Significance : p>0.10  (z=0.72) ? not significant
  Win rate last 10 checkpoints: 50.35% ? 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

===========================================
  gen9-2 TD(0.95) 1-ply vs gen9 1-ply
===========================================
  Model A : training_net.td095.gen9-2
  Model B : training_net.td095.gen9
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 57.2
  Model A wins : 5229 (52.3%)
  Model B wins : 4771 (47.7%)
  A win rate   : 52.29%
  95% CI       : [51.31%, 53.27%]
  Significance : p<0.001 (z=4.58) ? highly significant
  Win rate last 10 checkpoints: 52.29% ? 0.00%
  Verdict: INCONCLUSIVE.
===========================================

## TD(0.95) 100k gen9 1.5-ply
- based on gen7
- enabled added selective 2-ply search policy (1.5-ply)
- see selective 2-ply search and exploration diagnostic md files
- batch size 40960
- learning rate 1e-4

### Trainings Data self play selective 1.5-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen7         |
| sample size  | 75_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.02         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 75_000       |
| discarded    | 0            |
| samples      | 4_804_744    |
| avg turns    | 64.1         |
| avg pred var | 0.09662      |
| duration     | 00:04:13:29  |

### Trainings Data wildbg selective 1.5-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen7         |
| sample size  | 25_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.02         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 25_000       |
| discarded    | 0            |
| samples      | 1_459_802    |
| avg turns    | 58.4         |
| avg pred var | 0.09543      |
| duration     | 00:00:58:17  |

### Training Model TD(0.95)
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 9        |
| train size   | 5_322_925    |
| val size     | 941_621      |
| train mean   | 0.5041       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.5%         |
| val mean     | 0.5041       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.26579      |
| e1 t-loss    | 0.26515      |
| e1 v-loss    | 0.26151      |
| e100 t-loss  | 0.26347      |
| e100 v-loss  | 0.26450      |
| val gap      | 0.00103      |

### Tournaments

===========================================
  gen9 TD(0.95) 1-ply vs gen7 1-ply
===========================================
  Model A : training_net.td095.gen9
  Model B : training_net.td095.gen7
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 58.1
  Model A wins : 9925 (49.6%)
  Model B wins : 10075 (50.4%)
  A win rate   : 49.63%
  95% CI       : [48.93%, 50.32%]
  Significance : p>0.10  (z=1.06) ? not significant
  Win rate last 10 checkpoints: 49.63% ? 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

===========================================
  gen9 TD(0.95) 1-ply vs wildbg
===========================================
  Model A : training_net.td095.gen9
  Model B : wildbg
  Modus   : (from game)
  Total games  : 10000
  Decisive     : 10000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.0
  Model A wins : 3913 (39.1%)
  Model B wins : 6087 (60.9%)
  A win rate   : 39.13%
  95% CI       : [38.18%, 40.09%]
  Significance : p<0.001 (z=21.74) ? highly significant
  Win rate last 10 checkpoints: 39.12% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================