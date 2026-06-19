### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen2         |
| sample size  | 160_000      |
| bootstrap    | 1            |
| completed    | 159_991      |
| discarded    | 9            |
| samples      | 9_521_692    |
| avg turns    | 66.7         |
| avg pred var | 0.11691      |
| duration     | 00:15:35:36  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 3            |
| train size   | 8_093_438    |
| val size     | 1_428_254    |
| train mean   | 0.5342       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5336       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.25014      |
| e1 v-loss    | 0.23838      |
| e188 t-loss  | 0.23695      |
| e188 v-loss  | 0.23476      |
| val gap      | 0.00219      |

### Tournament

#### Tournament Results gen3 vs. gen2
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen3)                   |
| Model B                  | training_net (gen2)                   |
| Modus                    | (from game)                           |
| Total games              | 10000                                 |
| Decisive                 | 10000                                 |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 62.3                                  |
| Model A wins             | 4815 (48.1%)                          |
| Model B wins             | 5185 (51.8%)                          |
| A win rate               | 48.15%                                |
| 95% CI                   | [47.17%, 49.13%]                      |
| Significance             | p<0.001 (z=3.70) - highly significant |
| Win rate last 10         | 48.15% ± 0.01%                        |
| Verdict                  | INCONCLUSIVE                          |