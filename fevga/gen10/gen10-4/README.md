## TD(0.70) 50k gen10-4 1-ply
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
| lambda       | 0.7          |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 4_655_321    |
| avg turns    | 93.1         |
| avg pred var | 0.09899      |
| duration     | 00:00:17:17  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen10-3      |
| train size   | 3_962_761    |
| val size     | 692_560      |
| train mean   | 0.5026       |
| t-near 0.5   | 11.9%        |
| val mean     | 0.5026       |
| v-near 0.5   | 12.3%        |
| parent v-loss| 0.27681      |
| e1 t-loss    | 0.27530      |
| e1 v-loss    | 0.27631      |
| e32 t-loss   | 0.27480      |
| e32 v-loss   | 0.27607      |
| val gap      | 0.00127      |

### Tournaments

#### gen10-4-run1 vs. gen10-3-run1 1-ply
  Model A                : training_net.td070.gen10-4-run1
  Model B                : training_net.td070.gen10-3-run1
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 93.4
  A cubeless points/game : +0.2558
  Approx. 95% equity CI  : [+0.2393, +0.2723]
  Model A wins           : 11941
  A gammon wins          : 2230
  A backgammon wins      : 0
  Model B wins           : 8059
  B gammon wins          : 996
  B backgammon wins      : 0
  A win rate             : 59.70%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).