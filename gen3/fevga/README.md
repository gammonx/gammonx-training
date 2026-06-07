### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen2         |
| sample size  | 20_000       |
| bootstrap    | 1            |
| completed    | 20_000       |
| discarded    | 0            |
| samples      | 1_883_844    |
| avg turns    | 95.9         |
| avg pred var | 0.10992      |
| duration     | 00:03:50:08  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 0-3          |
| train size   | 6_410_020    |
| val size     | 1_131_181    |
| train mean   | 0.5138       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5136       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.39920      |
| e1 v-loss    | 0.38377      |
| e199 t-loss  | 0.37396      |
| e199 v-loss  | 0.37256      |
| val gap      | 0.00140      |

### Tournament

#### Tournament Results gen3 vs. gen2
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen3)                   |
| Model B                  | training_net (gen2)                   |
| Modus                    | (from game)                           |
| Total games              | 1000                                  |
| Decisive                 | 1000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 95.7                                  |
| Model A wins             | 584 (58.4%)                           |
| Model B wins             | 416 (41.6%)                           |
| A win rate               | 58.40%                                |
| 95% CI                   | [55.32%, 61.42%]                      |
| Significance             | p<0.001 (z=5.31) - highly significant |
| Win rate last 10         | 58.40% ± 0.04%                        |
| Verdict                  | A is STRONGER (significant)           |