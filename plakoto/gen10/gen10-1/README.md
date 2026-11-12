## TD(1.0) 50k gen10-1 1-ply
- based on linear play/weights
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- 1-ply training data

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | linear model |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 4_860_870    |
| avg turns    | 97.2         |
| avg pred var | 0.00255      |
| duration     | 00:00:02:59  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | linear model |
| train size   | 4_126_786    |
| val size     | 734_084      |
| train mean   | 0.5027       |
| t-near 0.5   | 1.0%         |
| val mean     | 0.5027       |
| v-near 0.5   | 1.0%         |
| parent v-loss| -            |
| e1 t-loss    | 0.44159      |
| e1 v-loss    | 0.33653      |
| e25 t-loss   | 0.28976      |
| e25 v-loss   | 0.29505      |
| val gap      | 0.00529      |

### Training Model run2
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | linear model |
| train size   | 4_126_786    |
| val size     | 734_084      |
| train mean   | 0.5027       |
| t-near 0.5   | 1.0%         |
| val mean     | 0.5027       |
| v-near 0.5   | 1.0%         |
| parent v-loss| -            |
| e1 t-loss    | 0.43589      |
| e1 v-loss    | 0.33338      |
| e32 t-loss   | 0.28884      |
| e32 v-loss   | 0.29547      |
| val gap      | 0.00663      |

### Training Model run3
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | linear model |
| train size   | 4_126_786    |
| val size     | 734_084      |
| train mean   | 0.5027       |
| t-near 0.5   | 1.0%         |
| val mean     | 0.5027       |
| v-near 0.5   | 1.0%         |
| parent v-loss| -            |
| e1 t-loss    | 0.43902      |
| e1 v-loss    | 0.33403      |
| e30 t-loss   | 0.28931      |
| e30 v-loss   | 0.29528      |
| val gap      | 0.00597      |

### Tournaments

### gen10-run3 vs. gen9 1-ply
  Model A                : training_net.td10.gen10-run3
  Model B                : training_net.td10.gen9
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19993
  Draws                  : 7
  Discarded              : 0
  Avg turns              : 99.9
  A cubeless points/game : -0.5079
  Approx. 95% equity CI  : [-0.5287, -0.4871]
  Model A wins           : 6474
  A gammon wins          : 3445
  A backgammon wins      : 0
  Model B wins           : 13519
  B gammon wins          : 6558
  B backgammon wins      : 0
  A win rate             : 32.38%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).

#### gen10-run1 vs. gen10-run2 1-ply
  Model A                : training_net.td10.gen10-run1
  Model B                : training_net.td10.gen10-run2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19997
  Draws                  : 3
  Discarded              : 0
  Avg turns              : 101.5
  A cubeless points/game : +0.0230
  Approx. 95% equity CI  : [+0.0007, +0.0452]
  Model A wins           : 10122
  A gammon wins          : 5349
  A backgammon wins      : 0
  Model B wins           : 9875
  B gammon wins          : 5137
  B backgammon wins      : 0
  A win rate             : 50.62%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

#### gen10-run1 vs. gen10-run3 1-ply
  Model A                : training_net.td10.gen10-run1
  Model B                : training_net.td10.gen10-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19998
  Draws                  : 2
  Discarded              : 0
  Avg turns              : 101.9
  A cubeless points/game : -0.0368
  Approx. 95% equity CI  : [-0.0590, -0.0146]
  Model A wins           : 9838
  A gammon wins          : 4993
  A backgammon wins      : 0
  Model B wins           : 10160
  B gammon wins          : 5407
  B backgammon wins      : 0
  A win rate             : 49.19%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).