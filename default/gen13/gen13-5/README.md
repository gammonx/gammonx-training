## TD(0.7) 100k gen13-4 5-ply
- based on gen13-3
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen13-4      |
| sample size  | 100_000      |
| lambda       | 0.7          |
| gamma        | 1            |
| completed    | 100_000      |
| discarded    | 0            |
| samples      | 6_202_169    |
| avg turns    | 62.0         |
| avg pred var | 0.10367      |
| duration     | 00:23:36:58  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen gen13-4  |
| train size   | 5_278_694    |
| val size     | 923_475      |
| train mean   | 0.5054       |
| t-near 0.5   | 11.2%        |
| val mean     | 0.5054       |
| v-near 0.5   | 11.2%        |
| parent v-loss| 0.22276      |
| e1 t-loss    | 0.22323      |
| e1 v-loss    | 0.22271      |
| e9  t-loss   | 0.22308      |
| e9  v-loss   | 0.22266      |
| val gap      | 0.00042      |

### Training Model run2
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen gen13-4  |
| train size   | 5_278_694    |
| val size     | 923_475      |
| train mean   | 0.5054       |
| t-near 0.5   | 11.2%        |
| val mean     | 0.5054       |
| v-near 0.5   | 11.2%        |
| parent v-loss| 0.22276      |
| e1 t-loss    | 0.22323      |
| e1 v-loss    | 0.22272      |
| e11 t-loss   | 0.22307      |
| e11 v-loss   | 0.22266      |
| val gap      | 0.00041      |

### Training Model run3
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen gen13-4  |
| train size   | 5_278_694    |
| val size     | 923_475      |
| train mean   | 0.5054       |
| t-near 0.5   | 11.2%        |
| val mean     | 0.5054       |
| v-near 0.5   | 11.2%        |
| parent v-loss| 0.22276      |
| e1 t-loss    | 0.22323      |
| e1 v-loss    | 0.22269      |
| e12 t-loss   | 0.22306      |
| e12 v-loss   | 0.22266      |
| val gap      | 0.00040      |

### Tournaments

#### gen13-5-run1 vs. gen13-4-run3 1-ply
  Model A                : training_net.td070.gen13-5-run1
  Model B                : training_net.td070.gen13-4-run3
  Modus                  : (from game)
  Total games            : 50000
  Scored games           : 50000
  Decisive               : 50000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.3
  A cubeless points/game : -0.0008
  Approx. 95% equity CI  : [-0.0132, +0.0116]
  Model A wins           : 24931
  A gammon wins          : 7296
  A backgammon wins      : 420
  Model B wins           : 25069
  B gammon wins          : 7140
  B backgammon wins      : 449
  A win rate             : 49.86%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).

#### gen13-5-run1 vs. gen13-5-run2 1-ply
  Model A                : training_net.td070.gen13-5-run1
  Model B                : training_net.td070.gen13-5-run2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 55.9
  A cubeless points/game : +0.0163
  Approx. 95% equity CI  : [-0.0033, +0.0358]
  Model A wins           : 10125
  A gammon wins          : 2948
  A backgammon wins      : 146
  Model B wins           : 9875
  B gammon wins          : 2855
  B backgammon wins      : 155
  A win rate             : 50.62%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).

  #### gen13-5-run1 vs. gen13-5-run3 1-ply
  Model A                : training_net.td070.gen13-5-run1
  Model B                : training_net.td070.gen13-5-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.3
  A cubeless points/game : +0.0204
  Approx. 95% equity CI  : [+0.0006, +0.0402]
  Model A wins           : 10175
  A gammon wins          : 3007
  A backgammon wins      : 183
  Model B wins           : 9825
  B gammon wins          : 3013
  B backgammon wins      : 151
  A win rate             : 50.88%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).