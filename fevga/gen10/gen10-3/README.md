## TD(0.70) 50k gen10-3 1-ply
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
| lambda       | 0.7          |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 4_675_620    |
| avg turns    | 93.5         |
| avg pred var | 0.10168      |
| duration     | 00:00:19:57  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen10-2      |
| train size   | 3_984_159    |
| val size     | 691_461      |
| train mean   | 0.4989       |
| t-near 0.5   | 11.9%        |
| val mean     | 0.4989       |
| v-near 0.5   | 11.7%        |
| parent v-loss| 0.30094      |
| e1 t-loss    | 0.29795      |
| e1 v-loss    | 0.29777      |
| e40 t-loss   | 0.29610      |
| e40 v-loss   | 0.29653      |
| val gap      | 0.00043      |

### Tournaments

#### gen10-3-run1 vs. gen10-2-run3
  Model A                : training_net.td070.gen10-3-run1
  Model B                : training_net.td10.gen10-2-run3
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 93.2
  A cubeless points/game : +0.3557
  Approx. 95% equity CI  : [+0.3386, +0.3728]
  Model A wins           : 12179
  A gammon wins          : 3559
  A backgammon wins      : 0
  Model B wins           : 7821
  B gammon wins          : 803
  B backgammon wins      : 0
  A win rate             : 60.89%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).