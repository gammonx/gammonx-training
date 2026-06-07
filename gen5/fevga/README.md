### Trainings Data|
    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen4         |
| sample size  | 20_000       |
| bootstrap    | 0.9          |
| completed    | 20_000       |
| discarded    | 0            |
| samples      | 1_890_883    |
| avg turns    | 96.3         |
| avg pred var | 0.10422      |
| duration     | 00:04:01:23  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 5            |
| train size   | 1_607_250    |
| val size     | 283_633      |
| train mean   | 0.5278       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 10.5%        |
| val mean     | 0.5275       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 10.5%        |
| e1 t-loss    | 0.50484      |
| e1 v-loss    | 0.47920      |
| e22 t-loss   | 0.47100      |
| e22 v-loss   | 0.46982      |
| val gap      | 0.00108      |

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
| Avg turns                | 95.7                                  |
| Model A wins             | 551 (55.1%)                           |
| Model B wins             | 449 (44.9%)                           |
| A win rate               | 55.10%                                |
| 95% CI                   | [52.00%, 58.16%]                      |
| Significance             | p<0.01  (z=3.23) - significant        |
| Win rate last 10         | 55.29% ± 0.10%                        |
| Verdict                  | A is STRONGER (significant)           |