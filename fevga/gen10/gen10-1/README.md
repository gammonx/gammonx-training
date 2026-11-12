## TD(1.0) 50k gen10-1 1-ply
- based on linear play/weights
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- 1-ply training data
- more epochs, stopped at 49

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | linear model |
| sample size  | 50_000       |
| lambda       | 1            |
| gamma        | 1            |
| completed    | 50_000       |
| discarded    | 0            |
| samples      | 4_871_965    |
| avg turns    | 97.4         |
| avg pred var | 0.00255      |
| duration     | 00:00:12:27  |

### Training Model run1
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | linear model |
| train size   | 4_145_796    |
| val size     | 726_169      |
| train mean   | 0.5028       |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5028       |
| v-near 0.5   | 0.0%         |
| parent v-loss| -            |
| e1 t-loss    | 0.38967      |
| e1 v-loss    | 0.30391      |
| e49 t-loss   | 0.26577      |
| e49 v-loss   | 0.27039      |
| val gap      | 0.00462      |

### Tournaments

#### gen10-1-run1 vs. gen9 1-ply
  Model A                : training_net.td10.gen10-1-run1
  Model B                : training_net.td10.gen9
  Modus                  : (from game)
  Total games            : 50000
  Scored games           : 50000
  Decisive               : 50000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 95.2
  A cubeless points/game : -0.2155
  Approx. 95% equity CI  : [-0.2301, -0.2010]
  Model A wins           : 21385
  A gammon wins          : 13264
  A backgammon wins      : 0
  Model B wins           : 28615
  B gammon wins          : 16811
  B backgammon wins      : 0
  A win rate             : 42.77%
  Verdict: B is STRONGER (negative point equity for A; approximate 95% CI excludes zero).