## TD(0.7) 50k gen13-4 2-ply
- based on gen13-3
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen13-3      |
| sample size  | 50_000       |
| lambda       | 0.7          |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 3_090_523    |
| avg turns    | 61.8         |
| avg pred var | 0.10381      |
| duration     | 00:11:53:08  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen13-3      |
| train size   | 2_625_347    |
| val size     | 465_176      |
| train mean   | 0.5057       |
| t-near 0.5   | 11.1%        |
| val mean     | 0.5056       |
| v-near 0.5   | 11.2%        |
| parent v-loss| 0.22183      |
| e1 t-loss    | 0.22163      |
| e1 v-loss    | 0.22176      |
| e5  t-loss   | 0.22175      |
| e5  v-loss   | 0.22148      |
| val gap      | 0.00027      |

### Training Model run2
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen13-3      |
| train size   | 2_625_347    |
| val size     | 465_176      |
| train mean   | 0.5057       |
| t-near 0.5   | 11.1%        |
| val mean     | 0.5056       |
| v-near 0.5   | 11.2%        |
| parent v-loss| 0.22183      |
| e1 t-loss    | 0.22163      |
| e1 v-loss    | 0.22177      |
| e3  t-loss   | 0.22176      |
| e3  v-loss   | 0.22153      |
| val gap      | 0.00023      |

### Training Model run3
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen13-3      |
| train size   | 2_625_347    |
| val size     | 465_176      |
| train mean   | 0.5057       |
| t-near 0.5   | 11.1%        |
| val mean     | 0.5056       |
| v-near 0.5   | 11.2%        |
| parent v-loss| 0.22183      |
| e1 t-loss    | 0.22163      |
| e1 v-loss    | 0.22178      |
| e5  t-loss   | 0.22175      |
| e5  v-loss   | 0.22148      |
| val gap      | 0.00027      |

### Tournaments

#### gen13-4-run3 vs. wildbg 2-ply
  Model A                : training_net.td070.gen13-4-run3
  Model B                : wildbg
  Modus                  : (from game)
  Total games            : 5000
  Scored games           : 5000
  Decisive               : 5000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 55.6
  A cubeless points/game : +0.0214
  Approx. 95% equity CI  : [-0.0169, +0.0597]
  Model A wins           : 2540
  A gammon wins          : 690
  A backgammon wins      : 32
  Model B wins           : 2460
  B gammon wins          : 673
  B backgammon wins      : 27
  A win rate             : 50.80%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).

#### gen13-4-run3 vs. wildbg 1-ply
  Model A                : training_net.td070.gen13-4-run3
  Model B                : wildbg
  Modus                  : (from game)
  Total games            : 50000
  Scored games           : 50000
  Decisive               : 50000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 55.8
  A cubeless points/game : -0.0865
  Approx. 95% equity CI  : [-0.0987, -0.0743]
  Model A wins           : 23362
  A gammon wins          : 6402
  A backgammon wins      : 348
  Model B wins           : 26638
  B gammon wins          : 7439
  B backgammon wins      : 353
  A win rate             : 46.72%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).

#### gen13-4-run3 vs. gen13-3 1-ply
  Model A                : training_net.td070.gen13-4-run3
  Model B                : training_net.td070.gen13-3
  Modus                  : (from game)
  Total games            : 50000
  Scored games           : 50000
  Decisive               : 50000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.4
  A cubeless points/game : +0.0203
  Approx. 95% equity CI  : [+0.0078, +0.0328]
  Model A wins           : 25267
  A gammon wins          : 7716
  A backgammon wins      : 391
  Model B wins           : 24733
  B gammon wins          : 7179
  B backgammon wins      : 419
  A win rate             : 50.53%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).

#### gen13-4-run1 vs. gen13-4-run2 1-ply
  Model A                : training_net.td070.gen13-4-run1
  Model B                : training_net.td070.gen13-4-run2
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.3
  A cubeless points/game : -0.0147
  Approx. 95% equity CI  : [-0.0344, +0.0050]
  Model A wins           : 9906
  A gammon wins          : 2887
  A backgammon wins      : 158
  Model B wins           : 10094
  B gammon wins          : 2943
  B backgammon wins      : 183
  A win rate             : 49.53%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).

  #### gen13-4-run2 vs. gen13-4-run3
  Model A                : training_net.td070.gen13-4-run2
  Model B                : training_net.td070.gen13-4-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 56.1
  A cubeless points/game : -0.0073
  Approx. 95% equity CI  : [-0.0267, +0.0122]
  Model A wins           : 9905
  A gammon wins          : 2831
  A backgammon wins      : 163
  Model B wins           : 10095
  B gammon wins          : 2830
  B backgammon wins      : 141
  A win rate             : 49.53%
  Verdict: INCONCLUSIVE (insufficient evidence of a difference in point equity).