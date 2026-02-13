---
date: 2026-01-30
type: professor-meeting
meeting_type: scheduled
duration: 60 min
professor: Dr. Pavlo Tymoshchuk
institution: University of North Texas
project: Tracking Control NN Defense
tags:
  - meeting
  - professor
  - guidance
---

# 🎓 Meeting with Dr. Tymoshchuk - January 30, 2026

> **Type:** scheduled
> **Duration:** 60 minutes
> **Location:** Zoom (Personal Link used due to UNT access issues)

---

## 📋 Pre-Meeting Preparation

### Questions to Ask (Prioritized)
1. **[HIGH]** What precisely are we measuring/controlling? 
2. **[HIGH]** How do I differentiate my work (novelty)?
3. **[MED]** Recommended software tools?

### Topics to Discuss
- [x] Project Title
- [x] Deliverables Timeline
- [x] Access Issues

---

## 📝 Meeting Notes

### Key Discussion Points

#### Topic 1: Project Scope & Objective
**My Question/Topic:** What are we measuring?
**Professor's Response:**
- We are ensuring "controlling distance" (car-following scenario).
- The objective is to drive the tracking error (distance between cars) to zero.
**Action Items:**
- [x] Define system model as "controlling inter-vehicle distance".

#### Topic 2: Novelty & Contribution
**My Question/Topic:** What is my unique contribution?
**Professor's Response:**
- Incorporate **simulated noise** into the model.
- This adds realism and framing for robustness alongside adversarial attacks.
**Action Items:**
- [ ] Research pseudo-random noise generators.

#### Topic 3: Software & Tools
**My Question/Topic:** What software should I use?
**Professor's Response:**
- Recommended **GNU Octave** as a MATLAB alternative (initially).
**Action Items:**
- [x] Research Octave + Neovim workflow (later pivoted to MATLAB).
- [ ] Determine software for functional block diagrams.

#### Topic 4: Project Title & Timeline
**My Question/Topic:** Formal Title?
**Professor's Response:**
- Title: **"An Analysis and Simulation of Defending Tracking Control Neural Network for Known Affine Discrete-Time Nonlinear Systems Against Adversarial Attacks"**
- **Deadlines:**
    - 2/2: Description (Difference Eq)
    - 2/9: Existence & Uniqueness
    - 2/16: Stability & Convergence
    - 3/2: Block Diagram
    - 3/16: Midterm Report

---

### Professor's Recommendations
1. **Reading Strategy:** Focus on **PDF [3]** and the simpler blocks in the **Optimal Control PPT**. Don't try to model everything at once.
2. **System Form:** Focus on Affine Discrete-Time Nonlinear Systems.

### Resources Mentioned
- [ ] **PDF [3]** (Baseline theory)
- [ ] **Optimal Control PPT** (Simpler blocks)

---

## 💡 Key Insights Gained

### Technical Clarifications
1. **Tracking Error:** The core metric is $E = R - Y$.
2. **Noise vs Attacks:** Noise is the "extra" feature I am adding to the standard attack defense model.

### Strategic Guidance
1. **Focus on Simpler Blocks:** Build the understanding component by component.

---

## ✅ Action Items

### Immediate (This Week)
- [x] Finalize Project Title.
- [x] Draft Week 1 Journal (Description of NN).

### Short-term (Before Next Meeting)
- [ ] Research Noise Generators.
- [ ] Decide on Block Diagram Tool.

---

## ❓ Follow-up Questions
*Questions that arose during the meeting to ask next time:*
1. What defines an "affine" system exactly?
2. Is the attack additive to input or state?

---

## 📊 Project Status Discussed

| Milestone                       | Status      | Feedback |
| ------------------------------- | ----------- | -------- |
| Difference Equation Description | In Progress | **Focus on PDF [3]** |
| Existence & Uniqueness          | Upcoming    | Due Feb 9 |
| Stability & Convergence         | Upcoming    | Due Feb 16 |

---

## 📅 Next Meeting
**Planned Date:** Feb. 6
**Topics to Cover:**
- Review Week 1 Deliverable (Description)
- Plan Week 2 (Existence & Uniqueness)

---

## 💭 Personal Reflection
- **Logistics:** Zoom access was messy. Need to use a reliable link next time.
- **Preparation:** Need to read the baseline papers deeper before the next sync.
