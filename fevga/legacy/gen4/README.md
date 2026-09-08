### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen3         |
| sample size  | 20_000       |
| bootstrap    | 1            |
| completed    | 20_000       |
| discarded    | 0            |
| samples      | 1_883_591    |
| avg turns    | 95.9         |
| avg pred var | 0.11228      |
| duration     | 00:03:53:11  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 1-4          |
| train size   | 6_413_704    |
| val size     | 1_131_831    |
| train mean   | 0.5109       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5113       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.43303      |
| e1 v-loss    | 0.41781      |
| e22 t-loss   | 0.40842      |
| e22 v-loss   | 0.40709      |
| val gap      | 0.00133      |

### Tournament

#### Tournament Results gen4 vs. gen3
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen4)                   |
| Model B                  | training_net (gen3)                   |
| Modus                    | (from game)                           |
| Total games              | 1000                                  |
| Decisive                 | 1000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 96.1                                  |
| Model A wins             | 609 (60.9%)                           |
| Model B wins             | 391 (39.1%)                           |
| A win rate               | 60.90%                                |
| 95% CI                   | [57.84%, 63.88%]                      |
| Significance             | p<0.001 (z=6.89) - highly significant |
| Win rate last 10         | 60.79% ± 0.06%                        |
| Verdict                  | A is STRONGER (significant)           |