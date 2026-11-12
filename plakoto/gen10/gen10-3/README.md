## TD(1.0) 50k gen10-3 1-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- 1-ply training data

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10-2      |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 4_948_297    |
| avg turns    | 99.0         |
| avg pred var | 0.13605      |
| duration     | 00:00:13:51  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-2     |
| train size   | 4_198_838    |
| val size     | 749_459      |
| train mean   | 0.5027       |
| t-near 0.5   | 0.1%         |
| val mean     | 0.5027       |
| v-near 0.5   | 0.1%         |
| parent v-loss| 0.32443      |
| e1 t-loss    | 0.31243      |
| e1 v-loss    | 0.31505      |
| e11 t-loss   | 0.30562      |
| e11 v-loss   | 0.31336      |
| val gap      | 0.00774      |

### Training Model run2
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-2     |
| train size   | 4_198_838    |
| val size     | 749_459      |
| train mean   | 0.5027       |
| t-near 0.5   | 0.1%         |
| val mean     | 0.5027       |
| v-near 0.5   | 0.1%         |
| parent v-loss| 0.32443      |
| e1 t-loss    | 0.31249      |
| e1 v-loss    | 0.31478      |
| e9  t-loss   | 0.30625      |
| e9  v-loss   | 0.31337      |
| val gap      | 0.00712      |

### Training Model run3
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-2     |
| train size   | 4_198_838    |
| val size     | 749_459      |
| train mean   | 0.5027       |
| t-near 0.5   | 0.1%         |
| val mean     | 0.5027       |
| v-near 0.5   | 0.1%         |
| parent v-loss| 0.32443      |
| e1 t-loss    | 0.31236      |
| e1 v-loss    | 0.31488      |
| e7  t-loss   | 0.30696      |
| e7  v-loss   | 0.31339      |
| val gap      | 0.00643      |

### Tournaments

#### gen10-3-run2 vs. gen9 1-ply
  Model A                : training_net.td10.gen10-3-run2
  Model B                : training_net.td10.gen9
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19990
  Draws                  : 10
  Discarded              : 0
  Avg turns              : 97.9
  A cubeless points/game : +0.3454
  Approx. 95% equity CI  : [+0.3239, +0.3669]
  Model A wins           : 11269
  A gammon wins          : 7295
  A backgammon wins      : 0
  Model B wins           : 8721
  B gammon wins          : 2935
  B backgammon wins      : 0
  A win rate             : 56.37%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

#### gen10-3-run2 vs. gen10-2-run1 1-ply
  Model A                : training_net.td10.gen10-3-run2
  Model B                : training_net.td10.gen10-2-run1
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19992
  Draws                  : 8
  Discarded              : 0
  Avg turns              : 97.6
  A cubeless points/game : +0.4318
  Approx. 95% equity CI  : [+0.4106, +0.4529]
  Model A wins           : 12542
  A gammon wins          : 6859
  A backgammon wins      : 0
  Model B wins           : 7450
  B gammon wins          : 3316
  B backgammon wins      : 0
  A win rate             : 62.74%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

#### gen10-3-run2 vs. gen10-3-run3 1-ply
  Model A                : training_net.td10.gen10-3-run2
  Model B                : training_net.td10.gen10-3-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19997
  Draws                  : 3
  Discarded              : 0
  Avg turns              : 97.6
  A cubeless points/game : +0.0547
  Approx. 95% equity CI  : [+0.0328, +0.0765]
  Model A wins           : 10287
  A gammon wins          : 5236
  A backgammon wins      : 0
  Model B wins           : 9710
  B gammon wins          : 4720
  B backgammon wins      : 0
  A win rate             : 51.44%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

#### gen10-3-run1 vs. gen10-3-run2 1-ply
  Model A                : training_net.td10.gen10-3-run1
  Model B                : training_net.td10.gen10-3-run2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19993
  Draws                  : 7
  Discarded              : 0
  Avg turns              : 97.6
  A cubeless points/game : -0.0299
  Approx. 95% equity CI  : [-0.0516, -0.0081]
  Model A wins           : 9866
  A gammon wins          : 4733
  A backgammon wins      : 0
  Model B wins           : 10127
  B gammon wins          : 5069
  B backgammon wins      : 0
  A win rate             : 49.35%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).