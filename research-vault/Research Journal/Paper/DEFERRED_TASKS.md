# Deferred Tasks — April 8, 2026 Meeting

Items that require tools beyond LaTeX editing (diagram editor, code changes, MATLAB/C++, poster work, administrative). These were NOT implemented in the current editing pass.

## Diagram Edits (Draw.io / diagrams.net)

- [ ] **D1. Restructure defended block diagram**: Remove the three green summation blocks (redundant), remove the V (voter) block, and feed tracking error directly to the switch S. Reconstruct to avoid large empty space in the center. *(Dr. T: "Remove this V, these three blocks... reconstruct a bit here.")*
- [ ] **D2. Add noise input to the switch block (blue)**: Add noise ε(k) from below to the blue switch S block in the clean/main block diagram. *(Dr. T: "Add this noise from below to this switch.")*
- [ ] **D3. Add rounder to switch block**: The switch S should perform both switching AND rounding operations. If |input| < 0.5, output = 0; if input > +0.5, output = +1; if input < -0.5, output = -1. Label or annotate accordingly.
- [ ] **D4. Consider keeping only ONE block diagram**: Dr. T said the clean diagram with noise added to the switch may be sufficient. Decide whether to remove the separate attacked and defended diagrams.
- [ ] **D5. Double-check all connections**: Verify each block is connected correctly with the previous/next block, matching the basic reference papers.

## Code Changes (MATLAB / C++)

- [x] **C1. Add noise to the signal function (sgn) in code**: Instead of current noise-on-error approach, add noise directly to the signum function output, matching Dr. T's papers. Then the rounding-based defense applies. *(Dr. T: "Add noise to the signal function in the same way as in my papers.")*
- [x] **C2. Implement rounding-based defense in code**: Replace voting scheme code with if-else rounding: if noisy sgn output ∈ (-0.5, 0.5) → 0; if > 0.5 → +1; if < -0.5 → -1.
- [x] **C3. Regenerate simulation figures after code changes**: Re-run both MATLAB and C++ simulations with the new noise/defense model and export new plots.
- [x] **C4. Verify figure font sizes match main text**: All figures should have fonts close to the size of the paper's body text. *(Dr. T: "Check all figures to have size of fonts the same on all figures.")*

## Poster (LaTeX Beamer)

- [ ] **P1. Check CAHSI site for updated poster template**: Dr. T mentioned checking the Miro site / CAHSI bureau for a newer template before doing redundant work.
- [ ] **P2. Add spacing between paragraphs on poster**: Increase fonts slightly and add at least one line of space between paragraphs for readability.
- [ ] **P3. Copy main paper content into poster**: Start shaping the poster from the refined paper sections.

## Administrative / Journal

- [ ] **A1. Fill research journals**: Complete all fields including faculty feedback. Copy/paste Dr. T's commands/feedback, distributing them across the appropriate journal entries.
- [ ] **A2. Indicate diagram tool in journal**: State that Draw.io (diagrams.net) was used to draw block diagrams. Inform Dr. T of this.
- [ ] **A3. Send project overview with red highlighting**: Send the initial project overview to Dr. T with unfulfilled parts highlighted in red.
- [ ] **A4. Fill "Plans for next week" / "Work accomplished"**: Use same statements and terminology as the research project overview.

## Structural Decisions (Need Clarification / Further Thought)

- [ ] **S1. Noise model restructuring**: Current paper adds noise to error channel e(k). Dr. T wants noise added to signum function output instead, matching his papers. This changes the entire defense structure from voting scheme to rounding. **This is a fundamental change — needs careful implementation.**
- [ ] **S2. Remove voting scheme entirely?**: Dr. T said voting "can be done but it's the next step" and "we have still yet two weeks, so it's not sufficient time." He wants the simpler rounding defense only for this paper.
- [ ] **S3. Target page count**: Dr. T said "you can have less than 10 pages if you refine it." Current draft is ~14-15 pages. Consolidation should achieve this.

---

*Generated from transcript of April 8, 2026 meeting with Dr. Tymoshchuk.*
