### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen1 vs. wild|
| sample size  | 80_000       |
| bootstrap    | 1            |
| completed    | 80_000       |
| discarded    | 0            |
| samples      | 4_326_011    |
| avg turns    | 60.5         |
| avg pred var | 0.11471      |
| duration     | 00:03:37:32  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 4            |
| train size   | 3_677_109    |
| val size     | 648_902      |
| train mean   | 0.5512       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5510       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.24011      |
| e1 v-loss    | 0.21379      |
| e199 t-loss  | 0.20632      |
| e199 v-loss  | 0.20375      |
| val gap      | 0.00257      |

### Tournament

#### Tournament Results gen4 vs. wildbg
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen4)                   |
| Model B                  | wildbg                                |
| Modus                    | (from game)                           |
| Total games              | 10000                                 |
| Decisive                 | 10000                                 |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 56.7                                  |
| Model A wins             | 5130 (51.3%)                          |
| Model B wins             | 4870 (48.7%)                          |
| A win rate               | 51.30%                                |
| 95% CI                   | [50.32%, 52.28%]                      |
| Significance             | p<0.01  (z=2.60) - significant        |
| Win rate last 10         | 51.28% ± 0.01%                        |
| Verdict                  | INCONCLUSIVE                          |

#### Tournament Results gen4 vs. gen3
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen4)                   |
| Model B                  | training_net (gen3)                   |
| Modus                    | (from game)                           |
| Total games              | 10000                                 |
| Decisive                 | 10000                                 |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 65.6                                  |
| Model A wins             | 3706 (37.1%)                          |
| Model B wins             | 6294 (62.9%)                          |
| A win rate               | 37.06%                                |
| 95% CI                   | [36.12%, 38.01%]                      |
| Significance             | p<0.001 (z=25.88) - highly significant |
| Win rate last 10         | 37.07% ± 0.01%                        |
| Verdict                  | B is STRONGER (significant)           |