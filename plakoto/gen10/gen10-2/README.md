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
| samples      | 5_119_826    |
| avg turns    | 102.4        |
| avg pred var | 0.13713      |
| duration     | 00:00:14:18  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-1     |
| train size   | 4_343_585    |
| val size     | 776_241      |
| train mean   | 0.5025       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5026       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.35451      |
| e1 t-loss    | 0.32784      |
| e1 v-loss    | 0.32089      |
| e20 t-loss   | 0.31251      |
| e20 v-loss   | 0.31445      |
| val gap      | 0.00194      |

### Training Model run2
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-1     |
| train size   | 4_343_585    |
| val size     | 776_241      |
| train mean   | 0.5025       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5026       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.35451      |
| e1 t-loss    | 0.32789      |
| e1 v-loss    | 0.32070      |
| e19 t-loss   | 0.31266      |
| e19 v-loss   | 0.31450      |
| val gap      | 0.00184      |

### Training Model run3
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 10-1     |
| train size   | 4_343_585    |
| val size     | 776_241      |
| train mean   | 0.5025       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5026       |
| v-near 0.5   | 0.0%         |
| parent v-loss| 0.35451      |
| e1 t-loss    | 0.32755      |
| e1 v-loss    | 0.32081      |
| e19 t-loss   | 0.31275      |
| e19 v-loss   | 0.31438      |
| val gap      | 0.00163      |

### Tournaments

#### gen10-2-run1 vs. gen9 1-ply
  Model A                : training_net.td10.gen10-2-run1
  Model B                : training_net.td10.gen9
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19992
  Draws                  : 8
  Discarded              : 0
  Avg turns              : 98.3
  A cubeless points/game : -0.0231
  Approx. 95% equity CI  : [-0.0448, -0.0013]
  Model A wins           : 9019
  A gammon wins          : 5597
  A backgammon wins      : 0
  Model B wins           : 10973
  B gammon wins          : 4104
  B backgammon wins      : 0
  A win rate             : 45.11%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).

#### gen10-2-run1 vs. gen10-1-run3 1-ply
  Model A                : training_net.td10.gen10-2-run1
  Model B                : training_net.td10.gen10-1-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19996
  Draws                  : 4
  Discarded              : 0
  Avg turns              : 99.5
  A cubeless points/game : +0.7555
  Approx. 95% equity CI  : [+0.7350, +0.7759]
  Model A wins           : 14037
  A gammon wins          : 9342
  A backgammon wins      : 0
  Model B wins           : 5959
  B gammon wins          : 2311
  B backgammon wins      : 0
  A win rate             : 70.20%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero)

#### gen10-2-run1 vs. gen10-2-run2 1-ply
  Model A                : training_net.td10.gen10-2-run1
  Model B                : training_net.td10.gen10-2-run2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19997
  Draws                  : 3
  Discarded              : 0
  Avg turns              : 98.1
  A cubeless points/game : +0.0042
  Approx. 95% equity CI  : [-0.0179, +0.0263]
  Model A wins           : 10035
  A gammon wins          : 5153
  A backgammon wins      : 0
  Model B wins           : 9962
  B gammon wins          : 5142
  B backgammon wins      : 0
  A win rate             : 50.18%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).

#### gen10-2-run1 vs. gen10-2-run3 1-ply
  Model A                : training_net.td10.gen10-2-run1
  Model B                : training_net.td10.gen10-2-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 19993
  Draws                  : 7
  Discarded              : 0
  Avg turns              : 97.9
  A cubeless points/game : +0.0050
  Approx. 95% equity CI  : [-0.0170, +0.0269]
  Model A wins           : 10032
  A gammon wins          : 5050
  A backgammon wins      : 0
  Model B wins           : 9961
  B gammon wins          : 5022
  B backgammon wins      : 0
  A win rate             : 50.18%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).