## TD(1.0) 50k gen10-2 1-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- 1-ply training data

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10-1      |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 4_808_297    |
| avg turns    | 96.2         |
| avg pred var | 0.13040      |
| duration     | 00:00:14:36  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen10-1      |
| train size   | 4_088_826    |
| val size     | 719_471      |
| train mean   | 0.5029       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5029       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.36663      |
| e1 t-loss    | 0.33473      |
| e1 v-loss    | 0.33264      |
| e31 t-loss   | 0.31914      |
| e31 v-loss   | 0.32641      |
| val gap      | 0.00727      |

### Training Model run2
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen10-1      |
| train size   | 4_088_826    |
| val size     | 719_471      |
| train mean   | 0.5029       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5029       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.36663      |
| e1 t-loss    | 0.33488      |
| e1 v-loss    | 0.33259      |
| e20 t-loss   | 0.32070      |
| e20 v-loss   | 0.32657      |
| val gap      | 0.00587      |

### Training Model run3
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen10-1      |
| train size   | 4_088_826    |
| val size     | 719_471      |
| train mean   | 0.5029       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5029       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.36663      |
| e1 t-loss    | 0.33459      |
| e1 v-loss    | 0.33268      |
| e20 t-loss   | 0.32068      |
| e20 v-loss   | 0.32642      |
| val gap      | 0.00574      |

### Tournaments

#### gen10-2-run3 vs. gen9 1-ply
  Model A                : training_net.td10.gen10-2-run3
  Model B                : training_net.td10.gen9
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 94.0
  A cubeless points/game : +0.5943
  Approx. 95% equity CI  : [+0.5745, +0.6140]
  Model A wins           : 12648
  A gammon wins          : 7938
  A backgammon wins      : 0
  Model B wins           : 7352
  B gammon wins          : 1349
  B backgammon wins      : 0
  A win rate             : 63.24%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

#### gen10-2-run3 vs. gen10-1-run1 1-ply
  Model A                : training_net.td10.gen10-2-run3
  Model B                : training_net.td10.gen10-1-run1
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 95.4
  A cubeless points/game : +1.1408
  Approx. 95% equity CI  : [+1.1232, +1.1583]
  Model A wins           : 16113
  A gammon wins          : 11632
  A backgammon wins      : 0
  Model B wins           : 3887
  B gammon wins          : 1043
  B backgammon wins      : 0
  A win rate             : 80.56%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

#### gen10-2-run2 vs. gen10-2-run3 1-ply
  Model A                : training_net.td10.gen10-2-run2
  Model B                : training_net.td10.gen10-2-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 93.2
  A cubeless points/game : +0.0043
  Approx. 95% equity CI  : [-0.0131, +0.0217]
  Model A wins           : 10034
  A gammon wins          : 1929
  A backgammon wins      : 0
  Model B wins           : 9966
  B gammon wins          : 1911
  B backgammon wins      : 0
  A win rate             : 50.17%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).

#### gen10-2-run1 vs. gen10-2-run2 1-ply
  Model A                : training_net.td10.gen10-2-run1
  Model B                : training_net.td10.gen10-2-run2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 93.4
  A cubeless points/game : -0.0248
  Approx. 95% equity CI  : [-0.0424, -0.0072]
  Model A wins           : 9835
  A gammon wins          : 1982
  A backgammon wins      : 0
  Model B wins           : 10165
  B gammon wins          : 2148
  B backgammon wins      : 0
  A win rate             : 49.18%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).