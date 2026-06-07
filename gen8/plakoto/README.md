### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen7         |
| sample size  | 80_000       |
| bootstrap    | 1            |
| completed    | 79_905       |
| discarded    | 95           |
| samples      | 7_538_741    |
| avg turns    | 99.1         |
| avg pred var | 0.13372      |
| duration     | 00:13:17:47  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 8            |
| train size   | 6_407_929    |
| val size     | 1_130_812    |
| train mean   | 0.5167       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.1%         |
| val mean     | 0.5162       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.1%         |
| e1 t-loss    | 0.36629      |
| e1 v-loss    | 0.35289      |
| e193 t-loss  | 0.34570      |
| e193 v-loss  | 0.34444      |
| val gap      | 0.00126      |

### Tournament

#### Tournament Results gen8 vs. gen7
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen8)                   |
| Model B                  | training_net (gen7)                   |
| Modus                    | (from game)                           |
| Total games              | 2000                                  |
| Decisive                 | 2000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 98.4                                  |
| Model A wins             | 1095 (54.7%)                          |
| Model B wins             | 905 (45.3%)                           |
| A win rate               | 54.75%                                |
| 95% CI                   | [52.56%, 56.92%]                      |
| Significance             | p<0.001 (z=4.25) - highly significant |
| Win rate last 10         | 54.79% ± 0.04%                        |
| Verdict                  | A is STRONGER (significant)           |