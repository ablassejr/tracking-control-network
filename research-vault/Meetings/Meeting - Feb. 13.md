---
date: 2026-02-13
type: professor-meeting
meeting_type: scheduled
duration: 83 min
professor: Dr. Pavlo Tymoshchuk
institution: University of North Texas
project: Tracking Control NN Defense
tags:
  - meeting
  - professor
  - guidance
  - simulation
  - collaboration
---

# 🎓 Meeting with Dr. Tymoshchuk - Feb. 13

> **Type:** Scheduled (Weekly Sync)
> **Duration:** ~83 minutes (Split due to Zoom timeout)
> **Attendees:** Dr. Pavlo Tymoshchuk, Ablasse (Online), Jeffrey Bowman (Online)

---

## 📋 Pre-Meeting Preparation

### Questions to Ask (Prioritized)
1. **[HIGH]** Clarify research objective — what is the paper actually trying to prove?
2. **[HIGH]** Which method to use for simulating adversarial attacks (noise injection)?
3. **[MED]** How to represent the learning rate parameter in 1D vs 2D cases.
4. **[MED]** Confirm block diagram approach and graphical editor.

### Topics to Discuss
- [x] Clarify paper objective and research direction
- [x] Attack simulation methods (where to inject noise/switch)
- [x] Implementation language decision (C++/Python/MATLAB)
- [x] Block diagram requirements
- [x] Collaboration plan with Jeffrey
- [x] Expo logistics (UNT R&D Expo, April 25)

---

## 📝 Meeting Notes

### Key Discussion Points

#### Topic 1: Implementation Language Decision
**Context:** Jeffrey's hardware (FPGA) implementation was ruled infeasible within the semester timeline by both Dr. Mosquera and Edgard.
**Decision:**
- Both Ablasse and Jeffrey will implement in **MATLAB and C++** (no Python).
- MATLAB simulations first, then replicate in C++ for performance comparison.
- Dr. Tymoshchuk referenced Joshua Fong's finding from the previous semester that C++ is faster than MATLAB.
- Python was discussed but ultimately dropped — comparison will be MATLAB vs C++.
- Ablasse and Jeffrey can **collaborate on C++ implementation** since Jeffrey's equation is Ablasse's equation with reference = 0.

#### Topic 2: Collaboration Structure (Ablasse & Jeffrey)
**Key Insight:** Jeffrey's project (optimal control, reference = 0) and Ablasse's project (tracking control, reference $\neq$ 0) share the same underlying equations.
- Jeffrey's system: continuous-time, but must be discretized for software simulation — resulting in essentially the same system as Ablasse's, just without the adversarial noise.
- **Dr. Tymoshchuk:** "You both could simulate it in MATLAB... and then compare it. All he has to do is add noise."
- Must use **different block diagrams, different colors, different graphical editors** to avoid plagiarism.
- Jeffrey will email his block diagram as reference; Ablasse will create his own using a different tool (Mermaid or similar).

#### Topic 3: Attack Simulation — Where to Inject Noise
**My Question:** How do I simulate the adversarial attacks? Where does the noise go?
**Dr. Tymoshchuk's Response:**
- Start with **pseudo-random noise** added to input signals or controller elements.
- Use a **switch** mechanism: a threshold that, when exceeded, triggers a response (e.g., hold previous value, cold braking).
- The key tasks are:
  1. **Where to put the switch** — identify which part of the controller receives the noise.
  2. **Where to add the noise** — to input, control signal, or other part of the controller.
  3. **What threshold to set** — and how to react when the signal exceeds it.
- **First step:** Add pseudo-random noise, observe behavior, then generalize.
- Referenced Paper [3]: current mitigation measures are primitive (cold braking); even simple improvements are publishable.

#### Topic 4: Research Objective Clarification
**My Confusion:** I spent the week trying to understand what the paper is even proving — the optimal control equation already drives error to zero, so what's left?
**Resolution:**
- The optimal control **assumes** certain conditions (no attacks, clean signals).
- My objective: figure out how to **simulate attacks**, then verify whether the optimal control **still converges** under those conditions.
- If it doesn't converge, the tracking control correction provides a window before escalating to cold braking.
- The paper compares: Paper [3]'s binary approach (detect → emergency brake) vs. the proposed continuous tracking control correction (detect → correct → escalate only if needed).

#### Topic 5: Learning Rate Parameter
**My Question:** In a 1D case, is the diagonal learning rate matrix just a scalar constant?
**Dr. Tymoshchuk's Response:**
- Yes. In a 1D case, the learning parameter is just a **constant** (scalar).
- In a 2D case (like the MATLAB example with two state variables), it becomes a diagonal matrix.
- The learning parameter is implicitly normalized to 1 in the current MATLAB code.
- **Experiment:** Change this parameter and observe how convergence time increases/decreases — this helps understand the theory.

#### Topic 6: MATLAB Simulations & Next Steps
**Dr. Tymoshchuk's Directive:**
- Open the MATLAB code he sent, **run the simulations**, and reproduce results similar to the paper's figures.
- Then **replicate in C++** and compare elapsed time.
- Modify parameters (gains, learning rate) to observe effects on convergence time.
- **Avoid plagiarism:** First run with same parameters to verify, then change parameters to generate original results.

#### Topic 7: Expo Logistics
- **UNT R&D Expo:** April 25, on UNT campus (Dallas area).
- Jeffrey is already registered for a separate April expo at his institution.
- There's also a **mini-conference on Feb 28** (K150 or Union at UNT), but Dr. Tymoshchuk acknowledged it's too early for serious materials.
- Jeffrey is checking if remote participation is possible for the April expo.

---

### Professor's Recommendations
1. **Analyze the basic papers** — extract information about attack simulation methods.
2. **Run MATLAB simulations** — reproduce paper results, then modify parameters.
3. **Collaborate with Jeffrey** on C++ implementation (shared equation structure).
4. **Present and analyze block diagram** of tracking controller next week.
5. **Use different graphical editors** from Jeffrey to avoid plagiarism.

### Resources Mentioned
- [x] MATLAB code files (fig2a, fig2b, fig2c, etc.) — already sent by Dr. Tymoshchuk.
- [ ] Jeffrey's block diagram (Lucidchart) — to be emailed.
- [x] Paper [3] — cold braking mitigation, attack simulation reference.

---

## 💡 Key Insights Gained

### Technical Clarifications
1. **Discretization:** Jeffrey's continuous-time system, when discretized for software simulation, becomes essentially the same as Ablasse's discrete-time system — just without adversarial noise.
2. **Learning Rate:** In 1D, the diagonal matrix reduces to a scalar constant. Changing it directly affects convergence time.
3. **Attack Simulation:** Start simple — pseudo-random noise with a switch/threshold mechanism. Generalize later.
4. **Convergence Time:** Visible in the MATLAB plots as the transition from transient mode to steady state (e.g., ~2 artificial seconds in the example).

### Strategic Guidance
1. **Collaboration is encouraged:** Work with Jeffrey on shared C++ code, but ensure distinct presentation (different diagrams, colors, editors).
2. **Incremental approach:** First reproduce MATLAB results, then C++, then add noise, then analyze.
3. **Paper [3] is the baseline:** The research contribution is improving upon cold braking with continuous error correction.

---

## ✅ Action Items

### Immediate (This Weekend)
- [ ] **Run MATLAB simulations:** Launch the code Dr. Tymoshchuk sent, reproduce paper figures.
- [ ] **Modify parameters:** Change learning rate/gains and observe convergence time effects.
- [ ] **Connect with Jeffrey:** Set up Discord server for collaboration, get his block diagram.

### Short-term (Next Week)
- [ ] **Present block diagram:** Functional block diagram of tracking controller (using Mermaid or different editor from Jeffrey's Lucidchart).
- [ ] **Start C++ implementation:** Translate MATLAB code to C++, compare elapsed time.
- [ ] **Analyze attack injection:** Determine where to add noise in the controller (input, control signal, etc.) based on Paper [3] and other literature.
- [ ] **Update research journal:** Document plan for next week per Dr. Tymoshchuk's format requirements.

### Jeffrey's Tasks
- [ ] **Email block diagram** to Ablasse.
- [ ] **Implement Python version** of MATLAB simulations (later changed to C++ collaboration).
- [ ] **Check remote participation** for April expo.

---

## ❓ Follow-up Questions
*Questions that arose during the meeting to ask next time:*
1. After adding noise: what specific threshold value should trigger the switch/fallback?
2. Should the noise be added to the sensor input $x(k)$ or to the control signal $u(k)$?
3. How to handle the case where $x(k)$ is the spoofed reading vs. an independent estimate?

---

## 📊 Project Status Discussed

| Milestone                        | Status         | Feedback |
| -------------------------------- | -------------- | -------- |
| Network Description              | **Done**       | Previously completed |
| Existence & Uniqueness           | **Done**       | Previously completed |
| MATLAB Simulations               | **In Progress**| Run provided code, reproduce results |
| Block Diagram                    | **Next Week**  | Present and analyze functional block diagram |
| Attack Simulation Method         | **In Progress**| Analyze papers, determine noise injection approach |
| C++ Implementation               | **Planned**    | Collaborate with Jeffrey after MATLAB works |

---

## 📅 Next Meeting
**Planned Date:** Feb. 20 (Thursday)
**Topics to Cover:**
- Block diagram presentation and review
- MATLAB simulation results with modified parameters
- C++ implementation progress
- Attack simulation method decision

---

## 💭 Personal Reflection
*What did I learn? What should I do differently?*
- **Clarity came late:** I spent the whole week confused about the research objective. The key insight is that the optimal control assumes clean conditions — my job is to test it under attack and show the tracking control correction provides a better response than cold braking.
- **Collaboration is a lifesaver:** Jeffrey's equation is literally mine with reference = 0. Working together on C++ will save significant time.
- **Math anxiety is normal:** Jeffrey confirmed he feels the same way ("It looks like Greek to me"). My friend's advice applies — "high school math, not high school applications."
- **Focus on incremental progress:** Don't try to solve everything at once. Run MATLAB first, then C++, then add noise. Step by step.
- **The block diagram is within reach:** Jeffrey said it's "really easy" — take the paper's framework and retrofit it. Once I understand the system, this shouldn't take long.
