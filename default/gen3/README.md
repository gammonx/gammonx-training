## TD(0.8) 600k gen3
- lr: 1e-4

### Trainings Data self play 350k
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen2         |
| sample size  | 350_000      |
| lambda       | 0.8          |
| gamma        | 1            |
| small s gap  | 0.04         |
| small multi  | 3.0          |
| big s gap    | 0.25         |
| big multi    | 0.85         |
| completed    | 349_998      |
| discarded    | 2            |
| samples      | 20_938_550   |
| avg turns    | 59.8         |
| avg pred var | 0.12416      |
| duration     | 00:10:00:00  |
### Trainings Data self play 150k
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen2         |
| sample size  | 150_000      |
| lambda       | 0.8          |
| gamma        | 1            |
| small s gap  | 0.06         |
| small multi  | 2.5          |
| big s gap    | 0.3          |
| big multi    | 0.75         |
| completed    | 149_999      |
| discarded    | 1            |
| samples      | 8_928_772    |
| avg turns    | 59.5         |
| avg pred var | 0.12148      |
| duration     |   |
### Trainings Data wildbg 100k
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen2         |
| sample size  | 100_000      |
| lambda       | 0.8          |
| gamma        | 1            |
| small s gap  | 0.02         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 100_000      |
| discarded    | 0            |
| samples      | 5_837_322    |
| avg turns    | 58.4         |
| avg pred var | 0.11316      |
| duration     | 00:04:20:17  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 3        |
| train size   | 30_348_957   |
| val size     | 5_355_687    |
| train mean   | 0.5039       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | 6.9%         |
| val mean     | 0.5039       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | 6.9%         |
| parent v-loss| 0.24294      |
| e1 t-loss    | 0.24127      |
| e1 v-loss    | 0.24111      |
| e98  t-loss  | 0.24087      |
| e98  v-loss  | 0.24095      |
| val gap      | 0.00008      |

### Tournaments

===========================================
  gen3 vs. wildbg
===========================================
  Model A : training_net.gen3
  Model B : wildbg
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.8
  Model A wins : 1717 (34.3%)
  Model B wins : 3283 (65.7%)
  A win rate   : 34.34%
  95% CI       : [33.04%, 35.67%]
  Significance : p<0.001 (z=22.15) ? highly significant
  Win rate last 10 checkpoints: 34.36% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================

===========================================
  gen3 vs. gen2
===========================================
  Model A : training_net.gen3
  Model B : training_net.gen2
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 55.4
  Model A wins : 2506 (50.1%)
  Model B wins : 2494 (49.9%)
  A win rate   : 50.12%
  95% CI       : [48.73%, 51.51%]
  Significance : p>0.10  (z=0.17) ? not significant
  Win rate last 10 checkpoints: 50.15% ? 0.02%
  Verdict: EQUIVALENT (within noise).
===========================================

===========================================
  gen3 vs. legacy gen16 TD(0.8) 800k
===========================================
  Model A : training_net.td08.gen3
  Model B : training_net.td09.800k
  Modus   : (from game)
  Total games  : 5000
  Decisive     : 5000
  Draws        : 0
  Discarded    : 0
  Avg turns    : 56.3
  Model A wins : 2272 (45.4%)
  Model B wins : 2728 (54.6%)
  A win rate   : 45.44%
  95% CI       : [44.06%, 46.82%]
  Significance : p<0.001 (z=6.45) ? highly significant
  Win rate last 10 checkpoints: 45.44% ? 0.01%
  Verdict: B is STRONGER (significant).
===========================================