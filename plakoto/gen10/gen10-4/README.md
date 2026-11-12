## TD(1.0) 50k gen10-4 1-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- 1-ply training data

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10-3      |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 4_936_938    |
| avg turns    | 98.7         |
| avg pred var | 0.14235      |
| duration     | 00:00:17:07  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-3     |
| train size   | 4_194_195    |
| val size     | 742_743      |
| train mean   | 0.5027       |
| t-near 0.5   | 0.1%         |
| val mean     | 0.5027       |
| v-near 0.5   | 0.1%         |
| parent v-loss| 0.30940      |
| e1 t-loss    | 0.30859      |
| e1 v-loss    | 0.30756      |
| e07 t-loss   | 0.30485      |
| e07 v-loss   | 0.30704      |
| val gap      | 0.00219      |

## TD(0.7) 50k gen10-4 1-ply
- rebuilt TD targets from TD(1.0) 50k gen10-4
- more epochs, stopped at 49

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-3     |
| train size   | 4_194_195    |
| val size     | 742_743      |
| train mean   | 0.5017       |
| t-near 0.5   | 8.6%         |
| val mean     | 0.5017       |
| v-near 0.5   | 8.6%         |
| parent v-loss| 0.30612      |
| e1 t-loss    | 0.30661      |
| e1 v-loss    | 0.30538      |
| e49 t-loss   | 0.30454      |
| e49 v-loss   | 0.30419      |
| val gap      | 0.00035      |

## Tournaments

### td070.gen10-4-run1 vs. td10.gen10-3-run2 1-ply
  Model A                : training_net.td070.gen10-4-run1
  Model B                : training_net.td10.gen10-3-run2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19994
  Draws                  : 6
  Discarded              : 0
  Avg turns              : 96.5
  A cubeless points/game : +0.4937
  Approx. 95% equity CI  : [+0.4728, +0.5145]
  Model A wins           : 12998
  A gammon wins          : 6967
  A backgammon wins      : 0
  Model B wins           : 6996
  B gammon wins          : 3096
  B backgammon wins      : 0
  A win rate             : 65.01%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

## td070.gen10-4-run1 vs. gen9 1-ply
  Model A                : training_net.td070.gen10-4-run1
  Model B                : training_net.td10.gen9
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19999
  Draws                  : 1
  Discarded              : 0
  Avg turns              : 96.7
  A cubeless points/game : +0.7638
  Approx. 95% equity CI  : [+0.7435, +0.7841]
  Model A wins           : 13706
  A gammon wins          : 9720
  A backgammon wins      : 0
  Model B wins           : 6293
  B gammon wins          : 1857
  B backgammon wins      : 0
  A win rate             : 68.53%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

### td10.gen10-4-run1 vs. td070.gen10-4-run1 1-ply
  Model A                : training_net.td10.gen10-4-run1
  Model B                : training_net.td070.gen10-4-run1
  Modus                  : (from game)
  Total games            : 50000
  Scored games           : 50000
  Decisive               : 49989
  Draws                  : 11
  Discarded              : 0
  Avg turns              : 96.9
  A cubeless points/game : -0.2793
  Approx. 95% equity CI  : [-0.2929, -0.2658]
  Model A wins           : 20843
  A gammon wins          : 9340
  A backgammon wins      : 0
  Model B wins           : 29146
  B gammon wins          : 15004
  B backgammon wins      : 0
  A win rate             : 41.70%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).