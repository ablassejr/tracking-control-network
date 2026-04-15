# Paper Corrections Log

## March 25, 2026 Meeting Review

- [x] 1. **Formatting** — Remove extra empty space before/after equations. *(error.tex, closed-loop.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex)*
- [x] 2. **Formatting** — Number main equations only; don't number "where" expressions. *(error.tex, closed-loop.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex)*
- [x] 3. **Formatting** — Start "where" from first position, remove colons. *(error.tex, closed-loop.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex)*
- [x] 4. **Formatting** — Add period after tracking error expression. *(error.tex)*
- [x] 5. **References** — Replace "figure" with "Fig." *(All chapter files)*
- [x] 6. **References** — Replace word equation references with numbered format. *(All chapter files — autoref converted to eqref)*
- [x] 7. **Template** — Remove template/title footnote artifacts. *(Main.tex)*
- [x] 8. **Template** — Consider Springer one-column template. *(Main.tex — switched to article class)*
- [x] 9. **Template** — Check margins are present. *(Main.tex geometry: a4paper, 170x257mm, 20mm margins)*
- [x] 10. **Abbreviations** — Decode all abbreviations at first mention. *(intro.tex, adversarial-attacks.tex, clean-system.tex)*
- [x] 11. **Figures** — Separate small paired figures, place one above another, enlarge. *(nominal-simulation.tex, perturbed-simulation.tex, defended-simulation.tex)*
- [ ] 12. **Figures** — Increase scaling/font size on figures. *(Pending — requires regenerating plots with larger fonts)*
- [x] 13. **Captions** — Adjust captions to match reference paper format. *(nominal-simulation.tex, perturbed-simulation.tex, defended-simulation.tex)*
- [x] 14. **Captions** — Remove unnecessary wording and implementation details from captions. *(Same files as above)*
- [x] 15. **Captions** — Verify correspondence between captions and variable definitions. *(Removed variable definitions from captions already in text)*
- [x] 16. **Axes** — Change horizontal axis from "time" to (k)/time steps. *(cstr_state_tracking.gp, cstr_state_tracking_attacked.gp, cstr_control_input.gp, cstr_tracking_error.gp)*
- [x] 17. **Axes** — Consistent units and markings across graphics. *(Pending — requires plot regeneration)* ✅ 2026-04-06
- [x] 18. **Colors** — Verify same blue for same graph in both figure parts. *(Pending — requires visual inspection after plot regeneration)* ✅ 2026-04-06
- [x] 19. **Colors** — Replace one red color in comparative plots for clarity. *(Pending — requires MATLAB/gnuplot color changes)* ✅ 2026-04-06
- [x] 20. **Diagrams** — Center the yellow block in block diagram. *(Pending — requires SVG editing)* ✅ 2026-04-06
- [x] 21. **Diagrams** — Use straight lines where possible. *(Pending — requires SVG editing)* ✅ 2026-04-06
- [x] 22. **Diagrams** — Add dots at intersections where connections exist. *(Pending — requires SVG editing)* ✅ 2026-04-06
- [x] 23. **Diagrams** — Connections have only one direction. *(Pending — requires SVG editing)* ✅ 2026-04-06
- [x] 24. **Diagrams** — Adjust proportional spacing in block diagrams. *(Pending — requires SVG editing)* ✅ 2026-04-06
- [x] 25. **Diagrams** — Add noise to reference via summation block (second diagram). *(Pending — defended-system.tex + SVG editing)* ✅ 2026-04-06
- [x] 26. **Content** — Revise noise signal description per reference papers. *(adversarial-attacks.tex — formal disturbance definition added, citing [2] Section 4.5)*
- [x] 27. **Content** — Add clear variable/marking descriptions at problem statement level. *(semanticModel.tex, voting-scheme.tex)*
- [x] 28. **Content** — Remove duplicate equations between nominal and attacked sections. *(perturbed-simulation.tex)*
- [x] 29. **Content** — Simplify table if values are same. *(Not needed — runtime table values differ significantly, table kept)*
- [x] 30. **Content** — Update remaining work in migration section. *(migration.tex)*
- [x] 31. **Content** — Refine terminology to match reference papers. *(clean-system.tex, intro.tex, semanticModel.tex, adversarial-attacks.tex)*
- [x] 32. **Graphs** — Zoomed figure should start from zero to 0.1. *(cstr_control_input.gp, nominal-simulation.tex)*
- [ ] 33. **Graphs** — Regulate empty space above/below curves. *(Pending — requires gnuplot/MATLAB axis limit changes)*
- [x] 34. **Typos** — Fix typos in intro.tex. *("fundmaental", "reactior", "nonolinear")*
- [x] 35. **Typos** — Fix "of of" and "exists" in theorem file. *(existence-and-uniqueness.tex)*
- [x] 36. **Math** — Standardize sgn to `\operatorname{sgn}`. *(error.tex, closed-loop.tex, control.tex, modified-tracking.tex, perturbed-closed-loop-equation.tex, existence-and-uniqueness.tex, stability-and-convergence.tex)*
- [x] 37. **Content** — Replace validation results table with one sentence. *(migration.tex)*
- [x] 38. **Diagrams** — Consider removing redundant attacked diagram. *(Decision needed — professor said "one diagram is sufficient")* ✅ 2026-04-06
- [x] 39. **Graphs** — X-axis values should show k (0–45000) not seconds (0–45). *(All 5 gnuplot scripts updated)*
- [x] 40. **Captions** — Match [1]'s exact caption style. *(Captions simplified)*
- [x] 41. **Citations** — Replace `\textsubscript{\cite{}}` with standard `~\cite{}`. *(14 instances fixed across 9 files)*
- [x] 42. **Math** — Fix remaining `\text{sgn}` in pgd-equation.tex. *(Changed to `\operatorname{sgn}`)*
- [x] 43. **Math** — Remove unnecessary `\mathlarger{\tau}` in sysModel.tex. *(Changed to plain `\tau`)*
- [x] 44. **Graphs** — Fix defended gnuplot xlabel to "k  ". *(cstr_state_tracking_defended.gp updated)*


## April 6, 2026 — Review Corrections

- [x] 1. Decrease number of words in 1st and 2nd lines of the title and increase the number in 3rd line to be proportional. ✅ 2026-04-06
- [x] 2. Present words in "Keywords" part in singular form. ✅ 2026-04-06
- [x] 3. Verify punctuation additionally. ✅ 2026-04-06
- [x] 4. Justify "where" and "such" words to the left. ✅ 2026-04-07
- [x] 5. Add punctuation (commas, periods). ✅ 2026-04-06
- [x] 6. References — Replace "Figure {{x}}" with "Fig. {{x}}". ✅ 2026-04-06
- [x] 7. Justify the paragraph before Fig. 11. ✅ 2026-04-07
- [x] 8. Adjust size of the figures to have font size in the figures close to one of the main texts of the paper. ✅ 2026-04-07
- [x] 9. Remove "nominal" term. ✅ 2026-04-07
- [x] 10. Make same size of dots at intersections. ✅ 2026-04-07
- [x] 11. Verify in published papers how connections are marked — in line or outside the lines — and adjust your markings of connections accordingly. ✅ 2026-04-07
	- Research confirmed: IEEE/control systems convention places labels **adjacent to** (above/beside) connection lines, never on them (Ogata, Nise, IEEE Std 315-1975)
	- Applied 12px vertical / 15px horizontal offsets to all labeled edges across 5 drawio pages (clean-system, attacked-system, defended-system, and their No Color variants)
	- Horizontal edges (e(k), Δr(k), −β sgn(ê)): labels nudged above; Vertical edges (x(k), f(x(k)), g(x(k)), u(k)): labels nudged to the side
- [x] 12. Ensure that spacing is proportional between nodes. ✅ 2026-04-07
- [x] 13. Adjust the abstract and main text considering results obtained and "Research Project Overview". ✅ 2026-04-07
	- Abstract rewritten: added CSTR testbed, convergence theorem claim, machine epsilon validation
	- Fixed terminology: "redundant sensor voting scheme" → "parallel processing units with minimum-variance pairwise voting scheme"
	- Keywords updated: "sensor voting scheme" → "voting scheme defense, parallel processing unit"
	- Introduction: replaced vague final paragraph with explicit numbered contributions list (items 1–3)
	- voting-theorem.tex: "sensors 1 and 2" → "PPUs 1 and 2" (last remaining "sensor" reference in body)
- [x] 14. Improve description of (2) – (5) considering similar description in provided papers. ✅ 2026-04-07
	- uncontrolled.tex: "Otherwise, if" phrasing aligned with [1]
	- control.tex: added cost function C(x) and optimal value function C*(x) motivation before control law, matching [1] eqs. (3)–(6); defined β as diagonal matrix of learning rate parameters; defined Δr(k) inline
	- closed-loop.tex: enriched with "tracking equation" terminology and operational interpretation (how x(k), Δx(k), u(k) are computed step-by-step), matching [1] page 3
	- error.tex: identified signum as activation function per [10]; added NN interpretation paragraph explaining supervised learning and why the controller constitutes a tracking control NN, matching [1] page 3
- [x] 15. Describe functional block-diagram using separated paragraph. ✅ 2026-04-07
- [-] 16. Correct functional block-diagram considering provided paper. - Confused.
- [x] 17. Use same color to mark connections in the functional block-diagram. ✅ 2026-04-07
- [x] 18. Remove CSTR related description and "extends" term from the introduction. ✅ 2026-04-07
	- Removed CSTR paragraph ("A Continuous Stirred-Tank Reactor...") from introduction
	- Removed "virtual CSTR analog designed in MATLAB" from method description paragraph
	- Replaced "builds upon" with direct contribution statement
- [x] 19. To mark variables in the example, use terms from provided paper (e.g., instead of conversion and temperature). ✅ 2026-04-07
	- Replaced "Conversion $x_1$" → "State $x_1$" and "Temperature $x_2$" → "State $x_2$" in all figure captions (unperturbed, attacked, defended, migration sections)
	- Replaced "Conversion/Temperature tracking error" → "Tracking error" in error figure captions
	- Updated gnuplot plot titles from "Conversion"/"Temperature" to "State x_1"/"State x_2" in 3 scripts and regenerated all plots
- [x] 20. Add noise simulating attack as additional input to the switch block in the functional block-diagram. ✅ 2026-04-07
- [x] 21. Remove "time steps" marking from the figures. ✅ 2026-04-06
- [x] 22. Write captions of the figures on the same terms as those used in the provided paper. ✅ 2026-04-07
	- Captions now use "Trajectory of state $x_i(t)$ and reference $r_i(t)$" format, matching [1]'s "state variable" terminology
- [x] 23. Replace PGD statement with citation-only reference. ✅ 2026-04-10
	- Changed to: "The projected gradient descent (PGD) method of defense of neural networks against adversarial attacks is described in [7]."
- [-] 24. Leave only Fig. 1 - Left Fig. 1 for reference and Fig. 2 because it is what the paper is about. — *See April 8 corrections D1–D4.*
- [-] 25. Simulate intrusions by perturbations of signum function only like it is done in [1]. — *See April 8 corrections: defense restructured to rounding of signal function; code changes deferred.*

## April 8, 2026 — Meeting Corrections

### Implemented (LaTeX text changes)

- [x] 1. **Abstract** — Remove CSTR, remove numerical values (537×, 477×, ≈10⁻¹⁵), use qualitative language only. ✅ 2026-04-10
- [x] 2. **Abstract** — Replace convergence theorem claim with rounding-based defense description. ✅ 2026-04-10
- [x] 3. **Abstract** — Add 1–2 sentences describing rounding defense (|ε| < ½ → correct rounding). ✅ 2026-04-10
- [x] 4. **Keywords** — Remove "Gaussian noise", "voting scheme defense", "parallel processing unit"; add "signal function", "rounding defense". ✅ 2026-04-10
- [x] 5. **PGD reference** — Changed to citation-only: "is described in [7]". ✅ 2026-04-10
- [x] 6. **CSTR description** — Added CSTR definition paragraph before simulation example (was removed from intro). ✅ 2026-04-10
- [x] 7. **Remove "horizon"/"zoomed"** — Removed from all captions and descriptions. ✅ 2026-04-10
- [x] 8. **Remove redundant axis labels** — Simplified body text that repeated ordinate axis markings. ✅ 2026-04-10
- [x] 9. **"Defense mechanism" → "Rounding of signal function"** — Section title, intro contribution, all references updated. ✅ 2026-04-10
- [x] 10. **Consolidate structure** — Separated theory from simulations. New structure: Intro → Attacks → Defense → Simulation Example → C++ Implementation. ✅ 2026-04-10
- [x] 11. **Replace voting theorem/proof** — Replaced with rounding expression (eq. for ŝ(k) with if-else cases). ✅ 2026-04-10
- [x] 12. **Migration section** — Removed all duplicate MATLAB/C++ side-by-side figures. Stated equivalence in text. ✅ 2026-04-10
- [x] 13. **Abbreviations** — Verified: NN decoded in abstract + intro, CSTR decoded before first use in simulation, PGD decoded in attacks section. ✅ 2026-04-10
- [x] 14. **Notation** — Fixed "≈.22" in braces to conventional "$2.22 \times 10^{-16}$". ✅ 2026-04-10

### Batch 3 — Appendix conversion + noise model alignment (2026-04-15)

#### Appendix conversion
- [x] 15. **C++ section → Appendix A** — Moved `\input{chapters/migration/migration.tex}` after `\bibliography` with `\appendix` declaration in `Main.tex`. ✅ 2026-04-15
- [x] 16. **Cross-references to appendix** — Added `(Appendix~\ref{sec:cpp-implementation})` to abstract and intro contribution item 3. ✅ 2026-04-15
- [x] 17. **Migration prose** — Changed "simulation sections above" → "simulation sections of the main text" in `migration.tex`. ✅ 2026-04-15

#### Noise model: input → output perturbation (consistent with reference [2])
- [x] 18. **Attack equation** — `modified-tracking.tex`: changed `\operatorname{sgn}(\tilde{e}(k))` with `\tilde{e}(k)=e(k)+\epsilon(k)` to `\operatorname{sgn}(e(k))+\epsilon(k)`. Removed intermediate variable `\tilde{e}`. ✅ 2026-04-15
- [x] 19. **Noise description** — `modified-tracking.tex`: changed "distributed as the standard Gaussian distribution with mean $0$ across $2$ standard deviations" → "a random noise with normal distribution, zero mean and standard deviation $\sigma$". ✅ 2026-04-15
- [x] 20. **Perturbed closed-loop** — `perturbed-closed-loop-equation.tex`: changed `\beta\operatorname{sgn}(e(k)+\epsilon(k))` → `\beta(\operatorname{sgn}(e(k))+\epsilon(k))`. ✅ 2026-04-15
- [x] 21. **Attack prose** — `adversarial-attacks.tex`: "injected into the signal function" → "on the output of the signal function"; "affect the activation function" → "affect the output of the activation function". ✅ 2026-04-15
- [x] 22. **C++ attacked simulation** — `cstr_dynamics.cpp` `attackedSystemFunction`: `sgn(e2 + noise)` → `sgn(e2) + noise`. ✅ 2026-04-15
- [x] 23. **C++ defended simulation** — `cstr_dynamics.cpp` `defendedSystemFunction`: replaced TMR voting scheme (3 error channels, pairwise variance) with rounding defense (`s_noisy = sgn(e2) + noise`, threshold ±0.5). ✅ 2026-04-15
- [x] 24. **Defended σ** — `cstr_dynamics.cpp`: changed defended noise from `σ=2` to `σ=0.3` so rounding defense condition `|ε|<1/2` holds ~90% of timesteps. ✅ 2026-04-15
- [x] 25. **MATLAB attacked simulation** — `cstr_state_tracking_attacked.m`: computed clean `S(i)=sgn(e)` first, then `S_noisy(i)=S(i)+epsilon`; used `S_noisy` in control and state update; removed `deltaEpsilon` term. ✅ 2026-04-15
- [x] 26. **Defended simulation prose** — `defended-simulation.tex`: changed `σ=2` → `σ=0.3`; added probabilistic justification; softened "reduce to" → "closely approximate"; "recover" → "recover near-unperturbed". ✅ 2026-04-15
- [x] 27. **Regenerated figures** — Rebuilt C++ simulations and regenerated `cxxplot_attacked_time_vs_{x1_r1,x2_r2}.png` and `cxxplot_defended_time_vs_{x1_r1,x2_r2}.png` via gnuplot. ✅ 2026-04-15

### Deferred (requires diagram editor, code changes, or manual work)

See `DEFERRED_TASKS.md` for full list including:
- D1–D5: Block diagram restructuring (Draw.io)
- ~~C1–C4: Code changes (noise on sgn, rounding defense, regenerate figures)~~ → Completed in Batch 3
- P1–P3: Poster work
- A1–A4: Administrative/journal tasks
- S1–S3: Structural decisions
