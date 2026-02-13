---
date: 2026-02-06
type: professor-meeting
meeting_type: scheduled
duration: 45 min
professor: Dr. Pavlo Tymoshchuk
institution: University of North Texas
project: Tracking Control NN Defense
tags:
  - meeting
  - professor
  - guidance
  - compliance
---

# 🎓 Meeting with Dr. Tymoshchuk - Feb. 6

> **Type:** Scheduled (Weekly Sync)
> **Duration:** ~45 minutes (Split due to Zoom timeout)
> **Attendees:** Dr. Pavlo Tymoshchuk, Ablasse (Online), Jeffrey (On-site)

---

## 📋 Pre-Meeting Preparation

### Questions to Ask (Prioritized)
1. **[HIGH]** Confirm Journal Requirements ("Bureaucracy").
2. **[HIGH]** Clarify Week 2 Milestone (Existence & Uniqueness).
3. **[MED]** Technical Model: Confirm "Expression 13" vs HJB.

### Topics to Discuss
- [x] Week 1 Deliverable (Network Description)
- [x] Week 2 Plan (Existence & Uniqueness)
- [x] Week 3 Lookahead (Stability)

---

## 📝 Meeting Notes

### Key Discussion Points

#### Topic 1: Journal Compliance ("Bureaucracy")
**My Question/Topic:** How should I structure the weekly journal entries?
**Professor's Response:**
- **Strict Requirement:** Must **copy and paste the plan row verbatim** into the journal entry.
    - "Work Accomplished": Use **past tense** (e.g., "Description of network has been presented...").
    - "Plans for Next Week": Copy the next row verbatim (e.g., "Investigate stability and convergence...").
- **Two Markers:** Need to show clearly marked entries for "Week 1" and "Week 2".

#### Topic 2: Week 1 Deliverable (Network Description)
**My Question/Topic:** What is the specific deliverable for the network description?
**Professor's Response:**
- Create a **separate Word file**.
- **Content:** Copy equations, variables, parameters from the basic papers (baseline network).
- **Requirement:** Refine/rewrite the descriptions to avoid plagiarism, but keep the mathematical structure identical to the baseline.

#### Topic 3: Week 2 Milestone (Existence & Uniqueness)
**My Question/Topic:** What is the deadline/scope?
**Professor's Response:**
- **Deadline:** Must finish by the end of this week (Feb 9).
- **Scope:** Analyze existence and uniqueness of the correct steady states (for the error dynamics).
- **Technical Guidance:** Use the **discrete-time difference equation** form.

#### Topic 4: Technical Model & Controller
**My Question/Topic:** Which controller formulation should I use?
**Professor's Response:**
- Use **Expression 13** from Reference 1 (European Conference paper).
- Do **NOT** use the general Hamilton-Jacobi-Bellman (HJB) approach (too complex for this applied project).
- **Key Equation:** Tracking Error $E = R - Y$. Ideally, use $\tau = 1$ (normalized time step).

---

### Professor's Recommendations
1. **Focus:** Finish "Existence & Uniqueness" this weekend.
2. **Plan Ahead:** Include "Plan to present functional block diagram" in next week's journal plan, even before the milestone date.
3. **Expo:** Check if UNT Expo allows online participation (Jeffrey checking offline).

### Resources Mentioned
- [ ] **Reference 1 (European Conference Paper)** - Expression 13.
- [ ] **Word File Template** (for separate network description).

---

## 💡 Key Insights Gained

### Technical Clarifications
1. **Controller Structure:** The tracking controller uses a variable structure (Signum function) logic to drive error to zero.
2. **Discrete Time:** simple difference equation $x(k+1) = \dots$ is sufficient; no need for complex differential approximations.

### Strategic Guidance
1. **"Bureaucracy" First:** Ensure the journal matches the plan **exactly**. This is for compliance.
2. **Document Everything:** Keep a separate Word file for the "copied" math to prove we aren't plagiarizing the text.

---

## ✅ Action Items

### Immediate (This Weekend)
- [ ] **Finish Week 2 Milestone:** Existence & Uniqueness Analysis (Due Feb 9).
- [ ] **Create Separate Word File:** Network Description (Rewritten).
- [ ] **Update Journal:** Ensure Week 1 (Past Tense) and Week 2 (Plan) rows are copied verbatim.

### Short-term (Next Week)
- [ ] **Start Stability Analysis:** For Week 3 (Feb 16).
- [ ] **Coordinate with Jeffrey:** On Expo details.

---

## ❓ Follow-up Questions
*Questions that arose during the meeting to ask next time:*
1. Where exactly should the "Separate Word File" be uploaded?
2. Confirm assumed attack model (Additive to input $u$ or state $x$?).

---

## 📊 Project Status Discussed

| Milestone                       | Status      | Feedback |
| ------------------------------- | ----------- | -------- |
| Difference Equation Description | **Done**    | Create separate Word file rewritten |
| Existence & Uniqueness          | **Urgent**  | Finish by Monday (Feb 9) |
| Stability & Convergence         | **Next**    | Assigned for Week 3 |
| Block Diagram                   | **Planned** | Mention in next week's plan |

---

## 📅 Next Meeting
**Planned Date:** Feb. 13 (Friday)
**Topics to Cover:**
- Existence & Uniqueness (Final Review)
- Stability Analysis (Initial results)

---

## 💭 Personal Reflection
*What did I learn? What should I do differently?*
- **Compliance is key:** The professor cares a lot about the *format* of the journal matching the plan. I need to be meticulous with copy-pasting the plan rows.
- **Technical Pivot:** Glad I clarified the HJB vs Expression 13 issue. Saved me weeks of headache.
