---
week: Feb 2 - Feb 9
week_start: 2026-02-02
week_end: 2026-02-09
type: weekly-review
project: Tracking Control NN Defense
tags:
  - weekly
  - review
  - progress
---

# 📊 Weekly Review: Feb 2 - Feb 9

> **Period:** Feb 2 - Feb 9, 2026
> **Theme:** "Getting Organized & Week 2 Milestone (Existence & Uniqueness)"

---

## 🎯 Weekly Goals (Set at Start)

### Primary Goals
- [x] **Week 1 Milestone:** Describe Tracking Control NN (difference equation / variable structure).
- [x] **Week 2 Milestone:** Analyze Existence & Uniqueness of steady states (Drafting in progress).
- [x] **Infrastructure:** Establish specific research logging and reporting workflow.

### Secondary Goals
- [x] Clarify implementation tooling (MATLAB vs Octave).
- [x] Automate literature search (Paper Search MCP).

---

## ✅ Accomplishments

### Major Achievements
1.  **Project Scope Locked:** Confirmed objective is "controlling inter-vehicle distance" and novelty is "adding simulated noise" (Feb 6 Meeting).
2.  **Research OS Built:** Established a dual-track logging system (Official OneNote for compliance + Obsidian for personal derivation) with a robust set of templates (`Proof`, `Experiment`, `Daily Log`) and a `Project Dashboard`.
3.  **Technical Advance (Existence & Uniqueness):** Shifted focus from general HJB approach to a tractable "Expression 13" formulation (Ref [1]) to prove existence of correct steady states using the error dynamics $E = R - Y$.
4.  **Reporting Standardized:** Created a reusable 2-4 page **Progress Report Skeleton** to streamline weekly updates.

### Minor Progress
-   **Tooling:** Refactored LaTeX equation annotations to use pure TikZ for better stability.
-   **Literature:** Installed `paper-search-mcp` to automate finding arXiv papers.
-   **Compliance:** Updated official CAHSI OneNote journal to match "plan language" requirements while avoiding plagiarism.

### Unexpected Wins
-   **MATLAB Pivot:** Decided to align with mentor and papers by using MATLAB (instead of Octave/C++), reducing friction in replicating baseline results.

---

## 📈 Progress by Category

### 📚 Learning & Understanding
| Topic | Status | Notes |
|-------|--------|-------|
| **Affine Discrete-Time Systems** | 🟡 | Needed for proper system definition; reading Ref [3]. |
| **Variable Structure Control** | 🟢 | Understood connection to "Signum" function in the controller. |
| **Lyapunov Stability** | 🟡 | Reviewing "radial unboundedness" for next week's proof. |

### 💻 Implementation
| Component | Language | Status | Notes |
|-----------|----------|--------|-------|
| **Simulation Framework** | MATLAB | 🟡 | Moved code to `src/simulations/`; structure ready. |
| **Noise Generator** | MATLAB | 🔴 | Need to select specific pseudo-random generator (Next Week). |

### ✍️ Writing & Documentation
| Document | Progress | Notes |
|----------|----------|-------|
| **Week 1 Journal** | 100% | Completed in OneNote (Variable Structure desc). |
| **Week 2 Journal** | 80% | "Existence & Uniqueness" drafted; needs final polish. |
| **Progress Report** | 50% | Skeleton created; content being filled. |

### 🤝 Collaboration
- **Professor Tymoshchuk (Feb 6):** Confirmed specific "copy/paste" requirement for journal plan lines; clarifying "separate file" for network description.
- **Jeffrey Bowman:** Assigned to analyze "convergence time" while I handle "stability".

---

## 📊 Metrics

### Quantitative Progress
| Metric | This Week | Total |
|--------|-----------|-------|
| Papers Parsed | 5 | 5 |
| Templates Created | 8 | 8 |
| Experiments Run | 0 | 0 |
| Hours (Research) | ~15h | ~15h |

---

## 📅 Milestone Tracking

### Current Milestone
**Name:** Week 2: Existence & Uniqueness
**Due Date:** 2026-02-09
**Progress:** 80% complete (Drafting analysis of steady states)

### Upcoming Deadlines
| Deadline | Task | Days Left |
|----------|------|-----------|
| 2026-02-16 | **Stability & Convergence Analysis** | 9 |
| 2026-03-02 | Functional Block Diagram | 23 |

---

## ❌ What Didn't Get Done
*And why:*

1.  **Noise Generator Implementation:**
    - **Reason:** Focus shifted to "Existence & Uniqueness" proof and infrastructure setup.
    - **Carry forward?** Yes, needed for simulation.

2.  **Block Diagram Tool Selection:**
    - **Reason:** De-prioritized for immediate proof deadline.
    - **Carry forward?** Yes (Action Item for next week).

---

## 🧠 Key Learnings This Week

### Technical Insights
1.  **Variable Structure is Key:** The controller's "Signum" term is essential for robustness against bounded disturbances (like our adversarial attacks).
2.  **Avoid General HJB:** The Hamilton-Jacobi-Bellman equation is too complex for this specific discrete-time affine system; using the specific "Expression 13" from the reference paper is the tractable path.

### Process Improvements
1.  **Dual-Track Logging:** Maintaining a "Bureaucratic" journal (OneNote, strict phrasing) separate from a "Thinking" journal (Obsidian, messy derivations) is the only way to stay sane and compliant.

### From Professor Feedback
1.  **"Copy the Plan":** For the official journal, verify that I am doing *exactly* what the plan says, using the *exact* language (e.g., "describe tracking control NN").

---

## ❓ Open Questions

### Technical
1.  **Adversarial Model:** Is the attack $a(k)$ additive to the input $u(k)$ or the state $x(k)$? (Need to confirm for Stability proof).

### Strategic
1.  **Separate Description File:** Where exactly should the "copied network description" Word file be uploaded? (Ask Pavlo).

---

## 🚧 Blockers & Challenges

### Current Blockers
- **Blocker:** Journal Compliance vs Plagiarism.
  - **Impact:** Slows down documentation.
  - **Plan to resolve:** Use the "Quote + Rewrite" strategy in the separate Word file.

---

## 🎯 Next Week's Plan

### Primary Goals
1.  **Complete Week 2 Milestone:** Finalize "Existence & Uniqueness" proof/write-up (Due Feb 9).
2.  **Start Week 3 Milestone:** Begin "Stability & Convergence" analysis (Global stability).
3.  **Implementation:** Select and code the **Noise Generator** in MATLAB.

### Tasks
- [ ] **Monday:** Submit Week 2 Journal/Report.
- [ ] **Tuesday:** Read References on "Global Asymptotic Stability" for discrete affine systems.
- [ ] **Wednesday:** Draft Stability Proof (Lyapunov Candidate).
- [ ] **Thursday:** Implement Noise Generator in `fig2/` simulation.
- [ ] **Friday:** Weekly Meeting with Dr. Pavlo.

### Professor Meeting Prep
- **Questions to ask:**
  1. Confirm Attack Model formulation ($x(k+1) = f(x) + g(x)(u + a)$?).
  2. Review "Stability" approach.

---

## 📊 Weekly Rating
- **Productivity:** ⭐⭐⭐⭐⭐ (5/5) - Massive infrastructure setup.
- **Learning:** ⭐⭐⭐⭐ (4/5) - Good conceptual progress, still some math gaps.
- **Satisfaction:** ⭐⭐⭐⭐⭐ (5/5) - System feels clean and organized now.
