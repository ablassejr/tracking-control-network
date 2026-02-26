---
date: 2026-02-20
type: professor-meeting
meeting_type: scheduled
duration: 74 min
professor: Dr. Pavlo Tymoshchuk
institution: University of North Texas
project: Tracking Control NN Defense
tags:
  - meeting
  - professor
  - guidance
  - simulation
  - performance
  - adversarial-attacks
  - block-diagram
---

# Meeting with Dr. Tymoshchuk - Feb. 20

> **Type:** Scheduled (Weekly Sync)
> **Duration:** ~74 minutes (Split due to Zoom timeout at ~31 min)
> **Attendees:** Dr. Pavlo Tymoshchuk (on-site), Ablasse (online), Jeffrey Bowman (on-site)
> **Referenced:** Joshua Fong (former CAHSI student, connected via email for C++ support)

---

## Meeting Notes

### Key Discussion Points

#### Topic 1: Ablasse's Block Diagram Presentation
**Context:** Ablasse presented an animated block diagram of the tracking control system.
- Dr. Tymoshchuk praised the animation as a "very nice toy" for conference presentations, referencing a previous student who showed similar live visualizations at a Louisiana conference.
- For the **poster/paper**, the diagram must be **static** and drawn in a graphical editor.
- The diagram currently lacks the **attack injection** and **defense** components — these must be added.
- Dr. Tymoshchuk noted the diagram had a **black background** — requested white for the paper draft.

#### Topic 2: Ablasse's Attack Method — Projected Gradient Descent (PGD)
**Context:** Ablasse identified PGD as his chosen attack method from the paper "Safety Filtering for Systems with Perception Models Subject to Adversarial Attacks" (Rober et al.).
- Dr. Tymoshchuk asked how the attack is simulated in the paper — whether random, constant, or neural-network-generated.
- Ablasse explained it uses a neural network, and the perturbations are **dynamic, not random**.
- **Dr. Tymoshchuk's directive:** Simplify the attack simulation. Don't use a neural-network-based PGD; instead use **high-school-level functions**:
  - Pseudo-random noise
  - Piecewise linear/constant signals
  - Random numbers (available in MATLAB, Python, C)
- This level of complexity is **sufficient for the CAHSI undergraduate project scope**.
- Add the attack as **additive noise** to either the **state variable** $x(k)$ or the **control signal** $u(k)$.
- **Additive noise** is simpler; **multiplicative noise** is "terrible" — avoid it.
- Install a **threshold/switch mechanism**: if the attack signal exceeds a threshold, switch off the additional input or transfer to autonomous mode.

#### Topic 3: Tau ($\tau$) vs Beta ($\beta$) Clarification
- Ablasse's block diagram included a block labeled $T$ ($\tau$) that does not appear in the reference paper.
- Dr. Tymoshchuk clarified: $T$ represents $\beta$ (the learning rate / time step). In the diagonal case, it has two values ($\beta_1, \beta_2$) which can optionally be equal.
- **Key principle:** "Diagram is decoration. The main thing is equations." Diagrams must exactly reflect the equations.

#### Topic 4: Equations > Diagrams — Code Translation Approach
- Dr. Tymoshchuk emphasized: **don't struggle with the equations directly** — instead, translate the MATLAB code to C++ line-by-line.
- Connected both students with **Joshua Fong** (previous CAHSI student) via email for C++ translation guidance.
- Joshua attended Dr. Tymoshchuk's office the previous day; he can explain in "student wording."
- **Pedagogical philosophy:** "Begin from practice" — map code first, then understand the equations from the code behavior.

#### Topic 5: Jeffrey's MATLAB vs Python Performance Study
**Context:** Jeffrey ran the MATLAB simulation with varying numbers of iterations and compared runtime to Python.
- **Key finding:** With 20 iterations averaged, MATLAB appeared faster (0.003s avg vs Python).
- **But with a single iteration:** Python was faster (0.006s vs MATLAB's 0.02s) — nearly an order of magnitude.
- Jeffrey attributed this to **NumPy pre-allocated matrices** in his Python code vs MATLAB's dynamic allocation in the for-loop.
- **MATLAB caching effect:** Multiple iterations amortize initialization cost, making per-iteration time appear faster.
- **Numba library** mentioned as a potential Python JIT optimizer.
- Dr. Tymoshchuk's guidance: **Don't chase multi-run averages.** Focus on **single-iteration, reliable results** first. Change one parameter at a time. Describe and move on.

#### Topic 6: Jeffrey's Reference = 0 for Optimal Control
- Jeffrey's MATLAB code still has the reference signal $R$ with sinusoidal values (from Dr. Tymoshchuk's original example).
- For **optimal control**, $R = 0$ and $\dot{R} = 0$.
- Setting reference to zero **widens the stable range** of learning rate parameter variation.
- Dr. Tymoshchuk instructed: **Make a copy of the code**, then change values **one at a time** — reference, initial conditions, learning parameters.
- "If we try to change many things, we can lose understanding."

#### Topic 7: Scheduling — Ablasse Missing Feb 28
- Ablasse will be on a plane on Feb 28 and cannot attend the meeting.
- Dr. Tymoshchuk: "In this case, you should have **double results** after two weeks."
- Communication via email for specific engineering questions (not general/vague).

---

### Professor's Recommendations
1. **Diagrams are decoration; equations are primary.** Build diagrams from equations, not the other way around.
2. **Simplify attack simulation** — use high-school functions (random, piecewise), not neural networks.
3. **Translate MATLAB to C++ via code mapping**, not by deriving equations independently.
4. **Change one variable at a time** when exploring parameter effects.
5. **Single-iteration runs first** — avoid multi-run averaging until single-run behavior is understood.
6. **Contact Joshua Fong** for C++ implementation guidance.

### Resources Mentioned
- [ ] "Safety Filtering for Systems with Perception Models Subject to Adversarial Attacks" (Rober et al.) — to be sent to Dr. Tymoshchuk
- [x] MATLAB code files (fig2a, fig2b, fig2c) — previously provided
- [x] Joshua Fong's email — shared during meeting

---

## Action Items

### Ablasse — This Week (by Feb 27)
- [ ] **Draw static block diagram** in a graphical editor (white background), insert into Word draft, and describe it in the same form as Reference Paper 1
- [ ] **Add attack injection point** to the block diagram (where additive noise enters the system)
- [ ] **Send the Rober et al. safety filtering paper** to Dr. Tymoshchuk via email
- [ ] **Contact Joshua Fong** for C++ translation support

### Ablasse — Next Week (by Mar 6, covers 2 weeks since missing Feb 28)
- [ ] **Implement and simulate** the tracking equation in MATLAB and C++
- [ ] **Add simplified attack simulation** using additive noise (random numbers or piecewise functions) to state or control variable
- [ ] **Prepare midterm report** — Word draft must contain all plan topics (items 1-5) described, simulated, and inserted
- [ ] **Double output expected** since missing Feb 28 meeting
- [ ] **Insert all results** from all previous weeks into the Word draft

### Jeffrey — This Week (by Feb 27)
- [ ] **Focus on single-iteration benchmarks** — one run in MATLAB, one run in Python, compare elapsed times
- [ ] **Vary learning rate parameters** ($\beta_1$, $\beta_2$) one at a time, observe convergence changes
- [ ] **Make a copy of the MATLAB code** and set $R = 0$, $\dot{R} = 0$ for optimal control case
- [ ] **Change parameters one at a time** (reference, initial conditions, learning rate) — not all at once
- [ ] **Insert all results** into Word draft with descriptions
- [ ] **Share results with Joshua** for comparison/validation

### Jeffrey — Next Week (by Mar 6)
- [ ] **Implement Python version** with pre-allocated NumPy matrices, compare to MATLAB single-iteration
- [ ] **Compare MATLAB vs Python results** for matching parameters, describe differences
- [ ] **Prepare midterm report content** — all results documented in Word draft

### Both Students
- [ ] **Contact Joshua Fong** via email with specific technical questions (C++ translation, implementation details)
- [ ] **Use email for async questions** — specific, engineering-focused, not general

---

## Project Status Discussed

| Milestone                        | Ablasse Status     | Jeffrey Status     |
| -------------------------------- | ------------------ | ------------------ |
| Network Description              | **Done**           | **Done**           |
| Existence & Uniqueness           | **Done**           | **Done**           |
| Block Diagram                    | **This Week**      | N/A                |
| MATLAB Simulations               | **Next Week**      | **In Progress**    |
| MATLAB vs Python Benchmarking    | N/A                | **In Progress**    |
| Attack Simulation (Additive)     | **Next Week**      | N/A                |
| C++ Implementation               | **Planned**        | N/A                |
| Reference = 0 (Optimal Control)  | N/A                | **This Week**      |
| Midterm Report                   | **Due ~Mar 6**     | **Due ~Feb 27**    |

---

## Follow-up Questions
1. Where exactly to inject additive noise — $x(k)$ or $u(k)$ — and what magnitude range is reasonable?
2. What threshold value should trigger the switch-off of attack simulation?
3. How does Joshua's C++ code handle the matrix operations from MATLAB?
4. What should the midterm report structure look like beyond "all 5 plan items described"?

---

## Next Meeting
**Planned Date:** Feb. 27 (Thursday)
**Ablasse:** Will NOT attend (traveling). Double output expected by Mar 6.
**Topics to Cover:**
- Jeffrey's single-iteration MATLAB vs Python comparison with $R = 0$
- Jeffrey's learning parameter variation results
- Jeffrey's midterm report progress
