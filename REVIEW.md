# Gen12 implementation and training review

## 1. Important training limitation: targets stay tied to one frozen teacher

The current pipeline is offline forward-view TD with supervised fitting:

1. Load a fixed parent network for data generation.
2. Record its prediction at each played afterstate.
3. Build lambda returns from those recorded predictions and terminal results.
4. Train for multiple epochs against those fixed labels.

See [Program.cs:1163](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.Training/Program.cs:1163), [SelfPlayRecorder.cs:59](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.Training/Generator/SelfPlayRecorder.cs:59), [ForwardViewTdCalculator.cs:175](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.Training/Generator/ForwardViewTdCalculator.cs:175), and [NetTrainer.cs:136](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.Training/Train/NetTrainer.cs:136).

This is a legitimate learning scheme, but additional epochs do not perform additional TD backups using the improving candidate. Increasing a frozen generation from 200k to 932k games mostly improves coverage and return estimation for that generation's behavior. It does not provide the same sequence of policy/value improvements as repeatedly refreshing the learner and targets.

**My inference:** this is a plausible contributor to diminishing returns, particularly once the parent is strong. It is not proof that the current model has reached a mathematical fixed point.

**Experiment:** use shorter cycles, initially perhaps 20k-50k new games followed by a short fit, then refresh the teacher/behavior model. Keep a replay mixture and a frozen evaluation panel. Alternatively, refresh bootstrap predictions and rebuild targets periodically on a retained corpus. Record target-network versions explicitly; repeatedly rebuilding labels from unchanged sidecar predictions does not refresh the teacher.

Replay and games against another engine also have a policy interpretation: uncorrected trajectory returns describe the behavior that generated them, including exploratory mistakes. They are not automatically estimates of optimal play. Mixing opponents can improve coverage, but should be evaluated as a controlled experiment.

## 2. Evaluation can hide useful improvements

### Playing objective and tournament objective differ

The Default evaluator ranks by expected points, including gammon/backgammon bonuses ([GameEquityModel.cs:130](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.NN/Models/GameEquityModel.cs:130)). The tournament records winner counts, not the points won ([TournamentRunner.cs:29](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.Training/TournamentRunner.cs:29)). A model can improve expected points while barely changing its win rate, or trade a little win probability for more gammons.

Record signed cubeless points per game and its confidence interval alongside win rate. Evaluate cube/match play separately if that is a deployment objective. Use a fixed external opponent configuration and saved benchmark positions, rather than only predecessor-versus-candidate games.

Tesauro's original discussion distinguishes move-ranking accuracy from absolute value accuracy; that is directly relevant to selecting checkpoints by average BCE. See [Temporal Difference Learning and TD-Gammon](https://bkgm.com/articles/tesauro/tdl.html), the section on absolute versus relative accuracy.

Add a frozen candidate-move benchmark with stronger-search or rollout references. Track chosen-move equity regret, sizable mistakes, and results by contact/race/bearoff phase. Retain BCE for calibration diagnostics, but do not assume the lowest BCE checkpoint is the strongest player. Cross-lambda BCE values also have different target distributions and entropy, so they are not directly comparable measures of strength.

### The promotion threshold demands a substantial margin

[TournamentRunner.cs:467](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.Training/TournamentRunner.cs:467) calls A stronger only when its lower 95% bound exceeds **52%**, rather than 50%. At 20,000 independent games this requires approximately a 52.7% observed win rate. That may be an intentional promotion policy, but it rejects many real smaller improvements.

For example, gen11 scored 52.64% against gen10 in 10,000 games and was called inconclusive by this rule, despite the result being statistically significant against 50%. Separate evidence of improvement from a chosen minimum promotion margin. The test implemented is a one-sample binomial normal approximation against 0.5; the repository overview's description as a two-proportion test is inaccurate.

The gen12 comparisons near 49.7%-50.3% do support the absence of a large win-rate gain in those pairings. They do not establish equivalence in point equity or rule out small gains. Near 50%, 20,000 independent games give roughly a +/-0.69 percentage-point 95% margin. Detecting a true +0.5 percentage-point win-rate difference with approximately 80% power takes roughly 78,000 independent games under a standard normal approximation.

Alternate colors as currently implemented. Add reproducible dice streams and consider paired/duplicate games for variance reduction, analyzing results at the pair level. The standard deviation of the last ten cumulative win-rate updates is not an uncertainty estimate: neighboring cumulative values are almost identical by construction.

- The network is trained on afterstates, from the player-who-just-moved perspective. Not providing a separate side-to-move input is consistent for that use. But [BaseFeatureEvalServiceImpl.cs:73](C:/Source/gammonx-server/src/GammonX/GammonX.Mars.NN/Services/BaseFeatureEvalServiceImpl.cs:73) directly evaluates a pre-roll cube decision from the prospective mover's perspective. Audit that timing convention separately; one solution is to evaluate the preceding mover's afterstate perspective and invert the distribution. Adding cube/match inputs should follow a clearly defined target and deployment objective.
