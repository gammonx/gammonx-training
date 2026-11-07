## TD(0.95) 732k gen12-1 1.5-ply
- batch size 16_384
- learning rate 1e-4
- selective 2-ply candidate count 8 for self play games

### Trainings Data self play selective 1.5-ply (1)
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen11        |
| sample size  | 264_000      |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 264_000      |
| discarded    | 0            |
| samples      | 16_379_013   |
| avg turns    | 62.0         |
| avg pred var | 0.10461      |
| duration     | 00:12:56:37  |

### Trainings Data self play selective 1.5-ply (2)
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen11        |
| sample size  | 264_000      |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 264_000      |
| discarded    | 0            |
| samples      | 16_402_777   |
| avg turns    | 62.1         |
| avg pred var | 0.10463      |
| duration     | 00:12:45:34  |

### Trainings Data self play selective 1.5-ply (3)
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen11        |
| sample size  | 204_000      |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 204_000      |
| discarded    | 0            |
| samples      | 12_658_335   |
| avg turns    | 62.1         |
| avg pred var | 0.10457      |
| duration     | 00:09:52:28  |

### Training Model TD(0.95) 732k gen12 1.5-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen12        |
| train size   | 38_612_249   |
| val size     | 6_827_876    |
| train mean   | 0.5042       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.5%         |
| val mean     | 0.5042       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.22895      |
| e1 t-loss    | 0.22862      |
| e1 v-loss    | 0.22857      |
| e10 t-loss   | 0.22845      |
| e10 v-loss   | 0.22851      |
| val gap      | 0.00006      |

### Tournaments

===========================================
  gen12-1 vs. gen11 1-ply
===========================================
  Model A : training_net.td095.gen12-1
  Model B : training_net.td095.gen11
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.5
  Model A wins : 9957 (49.8%)
  Model B wins : 10043 (50.2%)
  A win rate   : 49.79%
  95% CI       : [49.09%, 50.48%]
  Significance : p>0.10  (z=0.61) � not significant
  Win rate last 10 checkpoints: 49.79% � 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

## TD(0.95) 200k gen12-2
- batch size 16_384
- learning rate 1e-4
- +200k full 2-ply self play games

### Trainings Data self play 2ply (1)
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen11        |
| sample size  | 200_000      |
| lambda       | 0.95         |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 200_000      |
| discarded    | 0            |
| samples      | 12_523_106   |
| avg turns    | 62.6         |
| avg pred var | 0.10491      |
| duration     | 03:11:11:24  |

### Training Model TD(0.95) 200k gen12-2 2-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 11       |
| train size   | 10_650_701   |
| val size     | 1_872_405    |
| train mean   | 0.5042       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.4%         |
| val mean     | 0.5042       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.23111      |
| e1 t-loss    | 0.23001      |
| e1 v-loss    | 0.23073      |
| e3 t-loss    | 0.22987      |
| e3 v-loss    | 0.23072      |
| val gap      | 0.00085      |

### Tournaments
===========================================
  gen12-1 vs. gen12-2 1-ply
===========================================
  Model A : training_net.td095.gen12-1
  Model B : training_net.td095.gen12-2
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.1
  Model A wins : 10057 (50.3%)
  Model B wins : 9943 (49.7%)
  A win rate   : 50.29%
  95% CI       : [49.59%, 50.98%]
  Significance : p>0.10  (z=0.81) � not significant
  Win rate last 10 checkpoints: 50.28% � 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

## TD(0.95) 932k gen12-3 mixed-ply
- batch size 16_384
- learning rate 1e-4
- 732k game sample from gen12 above
- +200k full 2-ply self play games

### Training Model gen12-3 mixed-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 11       |
| train size   | 49_262_950   |
| val size     | 8_700_281    |
| train mean   | 0.5042       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.4%         |
| val mean     | 0.5042       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.22942      |
| e1 t-loss    | 0.22892      |
| e1 v-loss    | 0.22905      |
| e24 t-loss   | 0.22866      |
| e24 v-loss   | 0.22890      |
| val gap      | 0.00024      |

### Tournaments
===========================================
  gen12-3 vs. gen12-1 1-ply
===========================================
  Model A : training_net.td095.gen12-3
  Model B : training_net.td095.gen12-1
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.5
  Model A wins : 9940 (49.7%)
  Model B wins : 10060 (50.3%)
  A win rate   : 49.70%
  95% CI       : [49.01%, 50.39%]
  Significance : p>0.10  (z=0.85) � not significant
  Win rate last 10 checkpoints: 49.70% � 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================

## TD(0.95) 932k gen12-4 mixed-ply
- batch size 8192
- learning rate 1e-4
- data from gen12-3

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 11       |
| train size   | 49_262_950   |
| val size     | 8_700_281    |
| train mean   | 0.5042       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 5.4%         |
| val mean     | 0.5042       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.22942      |
| e1 t-loss    | 0.22895      |
| e1 v-loss    | 0.22907      |
| e25 t-loss   | 0.22865      |
| e25 v-loss   | 0.22889      |
| val gap      | 0.00024      |

### Tournaments
===========================================
  gen12-4 vs. gen12-3 1-ply
===========================================
  Model A : training_net.td095.gen12-4
  Model B : training_net.td095.gen12-3
  Modus   : (from game)
  Total games  : 20000
  Decisive     : 20000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.7
  Model A wins : 9955 (49.8%)
  Model B wins : 10045 (50.2%)
  A win rate   : 49.78%
  95% CI       : [49.08%, 50.47%]
  Significance : p>0.10  (z=0.64) � not significant
  Win rate last 10 checkpoints: 49.77% � 0.00%
  Verdict: EQUIVALENT (within noise).
===========================================
