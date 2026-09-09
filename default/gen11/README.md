## TD(0.95) 800k gen11 1.5-ply
- batch size 16_384
- learning rate 1e-4
- 68k replay game sample from gen10
- selective 2-ply candidate count 3 for wildbg games
- selective 2-ply candidate count 5 for self play games

### Trainings Data self play selective 1.5-ply (1)
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10        |
| sample size  | 264_000      |
| lambda       | 1            |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 264_000      |
| discarded    | 0            |
| samples      | 16_216_917   |
| avg turns    | 61.4         |
| avg pred var | 0.10440      |
| duration     | 00:07:04:46  |

### Trainings Data self play selective 1.5-ply (2)
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10        |
| sample size  | 264_000      |
| lambda       | 1            |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | 264_000      |
| discarded    | 0            |
| samples      | 16_216_917   |
| avg turns    | 61.4         |
| avg pred var | 0.10440      |
| duration     | 00:07:04:46  |

### Trainings Data wildbg selective 1.5-ply
|    Metric    |    Value     |
| ------------ | ------------ |
| prior gen    | gen10        |
| sample size  | 204_000      |
| lambda       | 1            |
| gamma        | 1            |
| small s gap  | 0.01         |
| small multi  | 1.5          |
| big s gap    | 0.2          |
| big multi    | 0.5          |
| completed    | ?       |
| discarded    | ?            |
| samples      | ?    |
| avg turns    | ?         |
| avg pred var | ?            |
| duration     | ?  |

### Training Model
|    Metric    |    Value     |
| ------------ | ------------ |
| train data   | gen 0        |
| train size   | ?    |
| val size     | ?      |
| train mean   | ?       |
| train min    | 0            |
| train max    | 1            |
| t-near 0.5   | ?         |
| val mean     | ?       |
| val min      | 0            |
| val max      | 1            |
| v-near 0.5   | ?         |
| parent v-loss| -            |
| e1 t-loss    | ?      |
| e1 v-loss    | ?      |
| e200 t-loss  | ?      |
| e200 v-loss  | ?      |
| val gap      | ?      |

### Tournaments
TBD