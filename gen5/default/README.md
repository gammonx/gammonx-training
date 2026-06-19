### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen4 vs. wild|
| sample size  | 160_000      |
| bootstrap    | 1            |
| completed    | 159_999      |
| discarded    | 1            |
| samples      | 8_409_099    |
| avg turns    | 58.4         |
| avg pred var | 0.13025      |
| duration     | 00:07:54:39  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 5            |
| train size   | 7_147_734    |
| val size     | 1_261_365    |
| train mean   | 0.5478       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5468       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.22219      |
| e1 v-loss    | 0.21304      |
| e184 t-loss  | 0.20214      |
| e184 v-loss  | 0.19917      |
| val gap      | 0.00297      |

### Tournament

#### Tournament Results gen5 vs. wildbg
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen5)                   |
| Model B                  | wildbg                                |
| Modus                    | (from game)                           |
| Total games              | 2000                                  |
| Decisive                 | 2000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 59.5                                  |
| Model A wins             | 1031 (51.5%)                          |
| Model B wins             | 969 (48.4%)                           |
| A win rate               | 51.55%                                |
| 95% CI                   | [49.36%, 53.74%]                      |
| Significance             | p>0.10  (z=1.39) - not significant    |
| Win rate last 10         | 51.52% ± 0.03%                        |
| Verdict                  | INCONCLUSIVE                          |

#### Tournament Results gen5 vs. gen4
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen5)                   |
| Model B                  | training_net (gen4)                   |
| Modus                    | (from game)                           |
| Total games              | 2000                                  |
| Decisive                 | 2000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 66.9                                  |
| Model A wins             | 1225 (61.3%)                          |
| Model B wins             | 775 (38.8%)                           |
| A win rate               | 61.25%                                |
| 95% CI                   | [59.10%, 63.36%]                      |
| Significance             | p<0.001 (z=10.06) - highly significant |
| Win rate last 10         | 61.23% ± 0.02%                        |
| Verdict                  | A is STRONGER (significant)           |

#### Tournament Results gen5 vs. gen3
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen5)                   |
| Model B                  | training_net (gen3)                   |
| Modus                    | (from game)                           |
| Total games              | 2000                                  |
| Decisive                 | 2000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 62.5                                  |
| Model A wins             | 834 (41.7%)                           |
| Model B wins             | 1166 (58.3%)                          |
| A win rate               | 41.70%                                |
| 95% CI                   | [39.56%, 43.87%]                      |
| Significance             | p<0.001 (z=7.42) - highly significant |
| Win rate last 10         | 41.75% ± 0.02%                        |
| Verdict                  | B is STRONGER (significant)           |