## TD(0.70) 100k gen10-5 1-ply
- batch size 16_384
- learning rate 1e-4
- no exploration
- no selective 2-ply
- 1-ply training data

### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10-4      |
| sample size  | 100_000      |
| lambda       | 0.7          |
| gamma        | 1            |
| completed    | 100_000      |
| discarded    | 0            |
| samples      | 9_340_352    |
| avg turns    | 93.4         |
| avg pred var | 0.09882      |
| duration     | 00:00:37:23  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen14-4      |
| train size   | 7_930_755    |
| val size     | 1_409_597    |
| train mean   | 0.5024       |
| t-near 0.5   | 12.0%        |
| val mean     | 0.5024       |
| v-near 0.5   | 11.9%        |
| parent v-loss| 0.26514      |
| e1 t-loss    | 0.26420      |
| e1 v-loss    | 0.26469      |
| e25 t-loss   | 0.26390      |
| e25 v-loss   | 0.26450      |
| val gap      | 0.00060      |

### Tournaments

#### gen10-5-run1 vs. gen10-4-run1 1-ply
  Model A                : training_net.td070.gen10-5-run1
  Model B                : training_net.td070.gen10-4-run1
  Modus                  : (from game)
  Total games            : 20000
  Scored games           : 20000
  Decisive               : 20000
  Draws                  : 0
  Discarded              : 0
  Avg turns              : 93.8
  A cubeless points/game : +0.3111
  Approx. 95% equity CI  : [+0.2947, +0.3275]
  Model A wins           : 12612
  A gammon wins          : 2144
  A backgammon wins      : 0
  Model B wins           : 7388
  B gammon wins          : 1146
  B backgammon wins      : 0
  A win rate             : 63.06%
  Verdict: A is STRONGER (positive point equity; approximate 95% CI excludes zero).