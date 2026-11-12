## TD(0.7) 100k gen10-5 1-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- 1-ply training data
- more epochs, stopped at 49

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10-4-070  |
| sample size  | 100_000      |
| lambda       | 0.7          |
| gamma        | 1            |
| completed    | 100_000      |
| discarded    | 0            |
| samples      | 9_745_637    |
| avg turns    | 97.5         |
| avg pred var | 0.14043      |
| duration     | -            |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen10-4-070  |
| train size   | 8_274_824    |
| val size     | 1_470_813    |
| train mean   | 0.5024       |
| t-near 0.5   | 9.3%         |
| val mean     | 0.5024       |
| v-near 0.5   | 9.2%         |
| parent v-loss| 0.29817      |
| e1 t-loss    | 0.29733      |
| e1 v-loss    | 0.29794      |
| e40 t-loss   | 0.29659      |
| e40 v-loss   | 0.29757      |
| val gap      | 0.00098      |

### Tournaments

#### gen10-5-run1 vs. gen10-4-run1
  Model A                : training_net.td070.gen10-5-run1
  Model B                : training_net.td070.gen10-4-run1
  Modus                  : (from game)
  Total games            : 50000
  Scored games           : 50000
  Decisive               : 49995
  Draws                  : 5
  Discarded              : 0
  Avg turns              : 96.2
  A cubeless points/game : +0.2872
  Approx. 95% equity CI  : [+0.2739, +0.3005]
  Model A wins           : 29692
  A gammon wins          : 14058
  A backgammon wins      : 0
  Model B wins           : 20303
  B gammon wins          : 9088
  B backgammon wins      : 0
  A win rate             : 59.39%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).