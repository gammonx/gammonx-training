### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen5 vs. wild|
| sample size  | 160_000      |
| bootstrap    | 1            |
| completed    | 160_000      |
| discarded    | 0            |
| samples      | 8_490_819    |
| avg turns    | 59.2         |
| avg pred var | 0.13662      |
| duration     | 00:10:06:09  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 6            |
| train size   | 7_217_196    |
| val size     | 1_273_623    |
| train mean   | 0.5495       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5488       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.22348      |
| e1 v-loss    | 0.21831      |
| e188 t-loss  | 0.20365      |
| e188 v-loss  | 0.20073      |
| val gap      | 0.00292      |

### Tournament

#### Tournament Results gen6 vs. wildbg
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen6)                   |
| Model B                  | wildbg                                |
| Modus                    | (from game)                           |
| Total games              | 5000                                  |
| Decisive                 | 5000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 58.7                                  |
| Model A wins             | 2612 (52.2%)                          |
| Model B wins             | 2388 (47.8%)                          |
| A win rate               | 52.24%                                |
| 95% CI                   | [50.85%, 53.62%]                      |
| Significance             | p<0.01  (z=3.17) - significant        |
| Win rate last 10         | 52.25% ± 0.01%                        |
| Verdict                  | INCONCLUSIVE                          |

#### Tournament Results gen6 vs. gen5
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen6)                   |
| Model B                  | training_net (gen5)                   |
| Modus                    | (from game)                           |
| Total games              | 5000                                  |
| Decisive                 | 4999                                  |
| Draws                    | 0                                     |
| Discarded                | 1                                     |
| Avg turns                | 68.2                                  |
| Model A wins             | 2147 (42.9%)                          |
| Model B wins             | 2852 (57.1%)                          |
| A win rate               | 42.95%                                |
| 95% CI                   | [41.58%, 44.33%]                      |
| Significance             | p<0.001 (z=9.97) - highly significant |
| Win rate last 10         | 42.97% ± 0.02%                        |
| Verdict                  | B is STRONGER (significant)           |

#### Tournament Results gen6 vs. gen3
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen6)                   |
| Model B                  | training_net (gen3)                   |
| Modus                    | (from game)                           |
| Total games              | 5000                                  |
| Decisive                 | 5000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 66.7                                  |
| Model A wins             | 1901 (38.0%)                          |
| Model B wins             | 3099 (62.0%)                          |
| A win rate               | 38.02%                                |
| 95% CI                   | [36.68%, 39.37%]                      |
| Significance             | p<0.001 (z=16.94) - highly significant |
| Win rate last 10         | 38.02% ± 0.01%                        |
| Verdict                  | B is STRONGER (significant)           |