## TD(1.0) 50k gen13-1 2-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen12-6      |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_107_081    |
| avg turns    | -            |
| avg pred var | -            |
| duration     | -            |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 12       |
| train size   | 2_646_948    |
| val size     | 460_133      |
| train mean   | 0.5042       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5041       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.22321      |
| e1 t-loss    | 0.22433      |
| e1 v-loss    | 0.22130      |
| e2  t-loss   | -            |
| e2  v-loss   | -            |
| val gap      | -            |

### gen13-1 vs. gen12-6 1-ply
  Model A                : training_net.td10.gen13-1
  Model B                : training_net.td10.gen12-6
  Modus                  : (from game)
  Total games            : 10000
  Scored games           : 10000
  Decisive               : 10000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.0
  A cubeless points/game : +0.0336
  Approx. 95% equity CI  : [+0.0056, +0.0616]
  Model A wins           : 5082
  A gammon wins          : 1642
  A backgammon wins      : 62
  Model B wins           : 4918
  B gammon wins          : 1434
  B backgammon wins      : 80
  A win rate             : 50.82%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

## TD(0.95) 50k gen13-2 2-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- rebuild TD-targets

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen12-6      |
| sample size  | 50_000       |
| lambda       | 0.95         |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_107_081    |
| avg turns    | -            |
| avg pred var | -            |
| duration     | -            |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 12       |
| train size   | 2_646_948    |
| val size     | 460_133      |
| train mean   | 0.5044       |
| t-near 0.5   | 5.5%         |
| val mean     | 0.5045       |
| v-near 0.5   | 5.5%         |
| parent v-loss| 0.22346      |
| e1 t-loss    | 0.22459      |
| e1 v-loss    | 0.22259      |
| e3  t-loss   | 0.22249      |
| e3  v-loss   | 0.22249      |
| val gap      | 0.00000      |

### gen13-1 vs. gen13-2 1-ply
  Model A                : training_net.td10.gen13-1
  Model B                : training_net.td10.gen13-2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.6
  A cubeless points/game : -0.0460
  Approx. 95% equity CI  : [-0.0657, -0.0263]
  Model A wins           : 9708
  A gammon wins          : 2861
  A backgammon wins      : 149
  Model B wins           : 10292
  B gammon wins          : 3189
  B backgammon wins      : 153
  A win rate             : 48.54%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).

## TD(0.7) 50k gen13-3 2-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- rebuild TD-targets

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen12-6      |
| sample size  | 50_000       |
| lambda       | 0.70         |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_107_081    |
| avg turns    | -            |
| avg pred var | -            |
| duration     | -            |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 12       |
| train size   | 2_646_948    |
| val size     | 460_133      |
| train mean   | 0.5060       |
| t-near 0.5   | 11.0%        |
| val mean     | 0.5060       |
| v-near 0.5   | 11.1%        |
| parent v-loss| 0.21959      |
| e1 t-loss    | 0.22041      |
| e1 v-loss    | 0.21928      |
| e16 t-loss   | 0.22000      |
| e16 v-loss   | 0.21916      |
| val gap      | 0.00084      |


### gen13-1 vs. gen13-2 1-ply
  Model A                : training_net.td070.gen13-3
  Model B                : training_net.td095.gen13-2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.5
  A cubeless points/game : +0.0175
  Approx. 95% equity CI  : [-0.0023, +0.0373]
  Model A wins           : 10191
  A gammon wins          : 3028
  A backgammon wins      : 161
  Model B wins           : 9809
  B gammon wins          : 3062
  B backgammon wins      : 160
  A win rate             : 50.95%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).

  ### gen13-1 vs. gen13-2 2-ply
  Model A                : training_net.td070.gen13-3
  Model B                : training_net.td095.gen13-2
  Modus                  : (from game)
  Total games            : 5000
  Scored games           : 5000
  Decisive               : 5000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 55.2
  A cubeless points/game : +0.0170
  Approx. 95% equity CI  : [-0.0215, +0.0555]
  Model A wins           : 2516
  A gammon wins          : 731
  A backgammon wins      : 24
  Model B wins           : 2484
  B gammon wins          : 656
  B backgammon wins      : 35
  A win rate             : 50.32%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).
===========================================