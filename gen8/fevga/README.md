### Trainings Data
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen7         |
| sample size  | 80_000       |
| bootstrap    | 1            |
| completed    | 80_000       |
| discarded    | 0            |
| samples      | 7_531_798    |
| avg turns    | 95.4         |
| avg pred var | 0.11733      |
| duration     | 00:21:15:29  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | 8            |
| train size   | 6_402_028    |
| val size     | 1_129_770    |
| train mean   | 0.5058       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 0.0%         |
| val mean     | 0.5084       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 0.0%         |
| e1 t-loss    | 0.43813      |
| e1 v-loss    | 0.42692      |
| e200 t-loss  | 0.41636      |
| e200 v-loss  | 0.41496      |
| val gap      | 0.00140      |

### Tournament

#### Tournament Results gen8 vs. gen7
|          Metric          |              Value                    |
| ------------------------ | ------------------------------------- |
| Model A                  | training_net (gen8)                   |
| Model B                  | training_net (gen7)                   |
| Modus                    | (from game)                           |
| Total games              | 1000                                  |
| Decisive                 | 1000                                  |
| Draws                    | 0                                     |
| Discarded                | 0                                     |
| Avg turns                | 96.4                                  |
| Model A wins             | 635 (63.5%)                           |
| Model B wins             | 365 (36.5%)                           |
| A win rate               | 63.50%                                |
| 95% CI                   | [60.47%, 66.43%]                      |
| Significance             | p<0.001 (z=8.54) - highly significant |
| Win rate last 10         | 63.43% ± 0.07%                        |
| Verdict                  | A is STRONGER (significant)           |