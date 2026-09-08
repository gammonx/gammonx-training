### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen8         |
| sample size  | 80_000       |
| bootstrap    | 1            |
| completed    | 80_000       |
| discarded    | 0            |
| samples      | 7_551_680    |
| avg turns    | 96.3         |
| avg pred var | 0.10780      |
| duration     | 00:14:15:36  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 9            |
| train size   | 6_418_928    |
| val size     | 1_132_752    |
| train mean   | 0.5112       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5118       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.43163      |
| e1 v-loss    | 0.41740      |
| e22 t-loss   | 0.40867      |
| e22 v-loss   | 0.40762      |
| val gap      | 0.00105      |

### Tournament

#### Tournament Results gen9 vs. gen8
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen9)                   |
| Model B                  | training_net (gen8)                   |
| Modus                    | (from game)                           |
| Total games              | 1000                                  |
| Decisive                 | 1000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 96.6                                  |
| Model A wins             | 621 (62.1%)                           |
| Model B wins             | 379 (37.9%)                           |
| A win rate               | 62.10%                                |
| 95% CI                   | [59.05%, 65.06%]                      |
| Significance             | p<0.001 (z=7.65) - highly significant |
| Win rate last 10         | 62.02% ± 0.05%                        |
| Verdict                  | A is STRONGER (significant)           |