# Paper Corrections Log

## March 25, 2026 Meeting Review

| # | Category | Comment | Status | File(s) Addressed |
|---|----------|---------|--------|-------------------|
| 1 | Formatting | Remove extra empty space before/after equations | Done | error.tex, closed-loop.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex |
| 2 | Formatting | Number main equations only; don't number "where" expressions | Done | error.tex, closed-loop.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex |
| 3 | Formatting | Start "where" from first position, remove colons | Done | error.tex, closed-loop.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex |
| 4 | Formatting | Add period after tracking error expression | Done | error.tex (period added after final expression) |
| 5 | References | Replace "figure" with "Fig." | Previously done | All chapter files (completed in earlier session) |
| 6 | References | Replace word equation references with numbered format | Previously done | All chapter files (autoref converted to eqref in earlier session) |
| 7 | Template | Remove template/title footnote artifacts | Done | Main.tex (article class, theorem definitions uncommented) |
| 8 | Template | Consider Springer one-column template | Previously done | Main.tex (switched to article class in earlier session) |
| 9 | Template | Check margins are present | Verified | Main.tex geometry: a4paper, 170x257mm, 20mm margins |
| 10 | Abbreviations | Decode all abbreviations at first mention | Done | intro.tex (NN, CSTR), adversarial-attacks.tex (PGD), clean-system.tex (LAESS) |
| 11 | Figures | Separate small paired figures, place one above another, enlarge | Done | nominal-simulation.tex, perturbed-simulation.tex, defended-simulation.tex |
| 12 | Figures | Increase scaling/font size on figures | Pending | Requires regenerating plots with larger fonts (gnuplot/MATLAB) |
| 13 | Captions | Adjust captions to match reference paper format | Done | nominal-simulation.tex, perturbed-simulation.tex, defended-simulation.tex |
| 14 | Captions | Remove unnecessary wording and implementation details from captions | Done | Same files as above |
| 15 | Captions | Verify correspondence between captions and variable definitions | Done | Removed variable definitions from captions that were already in text |
| 16 | Axes | Change horizontal axis from "time" to (k)/time steps | Done (gnuplot) | cstr_state_tracking.gp, cstr_state_tracking_attacked.gp, cstr_control_input.gp, cstr_tracking_error.gp |
| 17 | Axes | Consistent units and markings across graphics | Pending | Requires plot regeneration |
| 18 | Colors | Verify same blue for same graph in both figure parts | Pending | Requires visual inspection after plot regeneration |
| 19 | Colors | Replace one red color in comparative plots for clarity | Pending | Requires MATLAB/gnuplot color changes and regeneration |
| 20 | Diagrams | Center the yellow block in block diagram | Pending | Requires SVG editing (Draw.io) |
| 21 | Diagrams | Use straight lines where possible | Pending | Requires SVG editing (Draw.io) |
| 22 | Diagrams | Add dots at intersections where connections exist | Pending | Requires SVG editing (Draw.io) |
| 23 | Diagrams | Connections have only one direction | Pending | Requires SVG editing (Draw.io) |
| 24 | Diagrams | Adjust proportional spacing in block diagrams | Pending | Requires SVG editing (Draw.io) |
| 25 | Diagrams | Add noise to reference via summation block (second diagram) | Pending | defended-system.tex + SVG editing |
| 26 | Content | Revise noise signal description per reference papers | Done | adversarial-attacks.tex (formal disturbance definition added, citing [2] Section 4.5) |
| 27 | Content | Add clear variable/marking descriptions at problem statement level | Done | semanticModel.tex (terminology aligned with [1]); voting-scheme.tex (multi-sensor motivation from [1] eq 14 added) |
| 28 | Content | Remove duplicate equations between nominal and attacked sections | Done | perturbed-simulation.tex (removed duplicate dynamics and references) |
| 29 | Content | Simplify table if values are same | Not needed | Runtime table values differ significantly (13-38%), table kept |
| 30 | Content | Update remaining work in migration section | Done | migration.tex (defense tasks marked complete, new remaining items added) |
| 31 | Content | Refine terminology to match reference papers | Done | clean-system.tex (amplification β, numerical differentiation Δ, LAESS per [1]); intro.tex ("signum activation function" per [1]); semanticModel.tex (variable descriptions per [1]); adversarial-attacks.tex ("disturbance" per [2]) |
| 32 | Graphs | Zoomed figure should start from zero to 0.1 | Done (gnuplot) | cstr_control_input.gp (xrange changed to [0:0.1]); caption updated in nominal-simulation.tex |
| 33 | Graphs | Regulate empty space above/below curves | Pending | Requires gnuplot/MATLAB axis limit changes |
| 37 | Content | Replace validation results table with one sentence | Done | migration.tex (table replaced with text using dev_max notation) |
| 38 | Diagrams | Consider removing redundant attacked diagram | Decision needed | Professor said "one diagram is sufficient" — attacked diagram may be redundant with clean diagram |
| 39 | Graphs | X-axis values should show k (0-45000) not seconds (0-45) | Done (gnuplot) | All 5 gnuplot scripts updated: using ($1/0.001):N, xrange [0:45000], xtics 0,5000,45000 |
| 40 | Captions | Match [1]'s exact caption style | Done | Captions simplified to match [1]'s concise style |
| 41 | Citations | Replace \textsubscript{\cite{}} with standard ~\cite{} | Done | 14 instances fixed across 9 files |
| 42 | Math | Fix remaining \text{sgn} in pgd-equation.tex | Done | Changed to \operatorname{sgn} |
| 43 | Math | Remove unnecessary \mathlarger{\tau} in sysModel.tex | Done | Changed to plain \tau |
| 44 | Graphs | Fix defended gnuplot xlabel to "k (time steps)" | Done | cstr_state_tracking_defended.gp updated |
| 34 | Typos | Fix typos in intro.tex | Done | intro.tex: "fundmaental", "reactior", "nonolinear" |
| 35 | Typos | Fix "of of" and "exists" in theorem file | Done | existence-and-uniqueness.tex |
| 36 | Math | Standardize sgn to \operatorname{sgn} | Done | error.tex, closed-loop.tex, control.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex, existence-and-uniqueness.tex, stability-and-convergence.tex |

## Items Requiring External Tools (Not Automated)

These corrections require tools outside the text editor:

- **Plot regeneration**: Items 12, 17, 18, 19, 32, 33 require running gnuplot and/or MATLAB to regenerate figure images
- **SVG diagram editing**: Items 20-25 require editing block diagrams in Draw.io or similar tool
- **X-axis data scale**: Item 39 requires modifying C++ simulation output or gnuplot column expressions to output k values instead of time in seconds
- **Poster work**: Assigned in meeting but separate from paper corrections

## Items Completed in Earlier Sessions

- autoref to eqref/Fig./Table/Theorem conversion (March 27)
- Template switch from svjour3 to article class (March 27)

## March 28, 2026 — Attack Model Architectural Decision

### Decision: Error-Channel Attack Model (not Reference Corruption)

The attack model has been reverted from reference corruption ($\tilde{r}(k) = r(k) + \epsilon(k)$) to additive noise on the error channel post-computation ($\tilde{e}(k) = e(k) + \epsilon(k)$). The $\Delta\epsilon(k)$ term has been removed from the perturbed closed-loop equation.

**Rationale:**

1. **Cascading complexity**: Corrupting the reference signal causes $\Delta\epsilon$ to propagate into $\Delta r(k)$, coupling the attack perturbation to the reference increment in the closed-loop dynamics. This substantially complicates both the mathematical analysis and the simulation implementation.

2. **Graphical representation**: Plotting a corrupted reference signal (reference + Gaussian noise at every timestep) made simulation figures exceedingly difficult to interpret visually, as the reference trajectory became indistinguishable from noise.

3. **Time constraint**: The added complexity of the reference corruption model was not justified given the submission timeline.

4. **Threat model realism**: In a practical scenario (e.g., an attacker spoofing the position of a vehicle relative to another), the more likely attack vector is corruption of the computed error signal rather than direct manipulation of a hardware sensor. The error-channel model better reflects this threat.

### Decision: Sensor Noise Model for Defense

The defense section has been rewritten using $n \geq 3$ sensors with differing measurement precision ($n = 3$ in simulation). Clean sensors have noise variance $\sigma^2_s = 0.5$ and the corrupted sensor has $\sigma^2_a = 2$. This replaces the previous ideal-sensor model where clean channels had zero noise.

**Rationale:** Models real-world sensor dynamics more closely and ensures the system is robust under less than ideal conditions. The clean-channel noise simulates subtle differences in sensor measurement precision.

| # | Change | Status |
|---|--------|--------|
| 45 | Revert attack model from reference corruption to error-channel injection | Done |
| 46 | Remove $\Delta\epsilon(k)$ from perturbed closed-loop equation | Done |
| 47 | Rewrite defense for $n \geq 3$ differing sensors (clean $\sigma^2_s = 0.5$, attacked $\sigma^2_a = 2$) | Done |
| 48 | Update attacked simulation: $\sigma^2_a = 2$, error-channel only | Done |
| 49 | Update defended simulation: sensor noise model, no $\Delta\epsilon$ | Done |

## March 28, 2026 — C++ Simulation Reversion & Defense Terminology Update

### Reversion: Error-Channel Attack in C++ Simulations

The C++ simulation code had been refactored to implement the attack by corrupting the reference matrix pre-loop (`referenceMatrix(1,i) += ε(i)`) and calling the clean `systemFunction`, absorbing `Δε` into `deltaReference`. This was reverted back to an explicit `attackedSystemFunction` with additive noise on the error channel post-computation: `sgn(e₂ + ε)`, clean `deltaReference`, no `Δε` term.

**Rationale:**

1. **Cascading complexity**: Corrupting the reference signal causes `Δε(k) = ε(k) - ε(k-1)` to propagate into `Δr(k)`, coupling the attack perturbation to the reference increment in the closed-loop dynamics. This substantially complicates both the mathematical analysis and the simulation implementation.

2. **Graphical representation**: Plotting a corrupted reference signal (reference + Gaussian noise at every timestep) made simulation figures exceedingly difficult to interpret, as the reference trajectory became indistinguishable from noise.

3. **Time constraint**: The added complexity of the reference corruption model was not justified given the submission timeline.

4. **Threat model realism**: In a practical scenario (e.g., an attacker spoofing the position of a vehicle relative to another), the more likely attack vector is corruption of the computed error signal rather than direct manipulation of a hardware sensor. The error-channel model better reflects this threat.

### Terminology: "Sensors" → "Parallel Processing Units"

The defense section terminology has been updated from "sensors" to "parallel processing units" throughout the paper (voting-scheme.tex, voting-theorem.tex, defended-simulation.tex, defended-system.tex, defense.tex). Since the attack targets the error computation (not a physical sensor), the redundancy is in having $n \geq 3$ independent processing units each computing the error, with the voting scheme excluding the corrupted unit.

| # | Change | Status |
|---|--------|--------|
| 50 | Revert C++ attacked simulations from reference corruption to error-channel `attackedSystemFunction` | Done |
| 51 | Remove `Δε` and `deltaR2_hat` from defended C++ dynamics — clean `deltaReference` only | Done |
| 52 | Update defense terminology from "sensors" to "parallel processing units" across paper | Done |
| 53 | Update defended C++ simulation: error-channel noise model with `σ²_s = 0.01`, `σ²_a = 1` | Done |
