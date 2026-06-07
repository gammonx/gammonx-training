### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen4         |
| sample size  | 20_000       |
| bootstrap    | 0.85         |
| completed    | 19_965       |
| discarded    | 34           |
| samples      | 1_880_431    |
| avg turns    | 98.3         |
| avg pred var | 0.13475      |
| duration     | 00:03:13:28  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 5            |
| train size   | 1_598_366    |
| val size     | 282_065      |
| train mean   | 0.5276       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 8.4%         |
| val mean     | 0.5292       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 8.4%         |
| e1 t-loss    | 0.46425      |
| e1 v-loss    | 0.43705      |
| e190 t-loss  | 0.42472      |
| e190 v-loss  | 0.42319      |
| val gap      | 0.00153      |

### Tournament

#### Tournament Results gen5 vs. gen4
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen5)                   |
| Model B                  | training_net (gen4)                   |
| Modus                    | (from game)                           |
| Total games              | 1000                                  |
| Decisive                 | 1000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 97.2                                  |
| Model A wins             | 574 (57.4%)                           |
| Model B wins             | 426 (42.6%)                           |
| A win rate               | 57.40%                                |
| 95% CI                   | [54.31%, 60.43%]                      |
| Significance             | p<0.001 (z=4.68) - highly significant |
| Win rate last 10         | 57.54% ± 0.10%                        |
| Verdict                  | A is STRONGER (significant)           |