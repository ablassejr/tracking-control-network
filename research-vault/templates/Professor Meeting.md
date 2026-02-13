<%*
// ═══════════════════════════════════════════════════════════════════════════
// 👨‍🏫 PROFESSOR MEETING (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// Mentor: Dr. Pavlo Tymoshchuk (UNT)
// ═══════════════════════════════════════════════════════════════════════════

const date = tp.date.now("YYYY-MM-DD");
const time = tp.date.now("HH:mm");

// Prompt for meeting focus
const focus = await tp.system.prompt("Meeting Focus (e.g., Week 2 Sync):");

// Rename file
const filename = `Meeting - ${date} - ${focus.replace(/[^a-zA-Z0-9\s-]/g, '').trim()}`;
await tp.file.rename(filename);
-%>
---
tags: [meeting, mentor, weekly-sync]
date: <% date %>
time: "<% time %>"
attendees: [Dr. Pavlo Tymoshchuk, Jeffrey Bowman, Ablasse Kingcaid-Ouedraogo]
focus: "<% focus %>"
status: active
---

# 👨‍🏫 Meeting: <% focus %>

> [!info] Logistics
> **Date:** <% date %>
> **Attendees:** @Dr. Pavlo Tymoshchuk, @Jeffrey Bowman, @Ablasse Kingcaid-Ouedraogo
> **Zoom:** [Zoom Link Here]
> **Recording:** `[Link to recording if applicable]`

---

## 🎯 Agenda & Objectives
1. **Week 1 Review:** Status of Difference Equations?
2. **Week 2 Milestone:** Review Existence & Uniqueness draft.
3. **Blockers:** Discuss simulation issues (FIG2).
4. **Project Title:** Confirm final wording.

---

## 📝 Discussion Log
*<% time %> - Meeting Start.*

### 1. Topic 1: Difference Equations
- **Dr. Pavlo:** Suggests using...
- **Me:** Clarified that...

### 2. Topic 2: Existence & Uniqueness
- Key insight: The system must be stable in the absence of attacks (nominal case).
- Reference: `[Tymoshchuk 2024, Eq. 13]`

### 3. Topic 3: ...
- ...

---

## ✅ Action Items
> [!todo] Assigned Tasks
> - [ ] **Me:** Finalize proof for Existence & Uniqueness (Due: <% tp.date.now("YYYY-MM-DD", 7) %>)
> - [ ] **Me:** Update simulation with new parameters.
> - [ ] **Jeffrey:** ...
> - [ ] **Dr. Pavlo:** Will send...

---

## 🧠 Key Takeaways & Decisions
> [!summary] Summary
> - Confirmed that **Signum function** is robust enough for bounded disturbances.
> - Agreed to use **MATLAB** exclusively (no C++ for now).
> - Next deadline is rigid: **Feb 9**.

---

## ❓ Questions for Next Time
- [ ] How do we model the adversarial signal $a(k)$ explicitly?
- [ ] Should we use a pure Lyapunov function or HJB?

---

[[<% tp.date.now("YYYY-MM-DD", -7) %>|⬅️ Previous Meeting]] | [[<% tp.date.now("YYYY-MM-DD", 7) %>|➡️ Next Meeting]]
