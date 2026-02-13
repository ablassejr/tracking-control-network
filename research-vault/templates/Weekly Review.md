<%*
// ═══════════════════════════════════════════════════════════════════════════
// 📅 WEEKLY REVIEW (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// Mentor: Dr. Pavlo Tymoshchuk (UNT)
// ═══════════════════════════════════════════════════════════════════════════

const week = await tp.system.prompt("Week Name (e.g., 'Feb 9 - Feb 16'):");
const lastWeek = await tp.system.prompt("Previous Week (e.g., 'Feb 2 - Feb 9'):");

// Rename file
const filename = `Weekly - ${week.replace(/[^a-zA-Z0-9\s-]/g, '').trim()}`;
await tp.file.rename(filename);
-%>
---
tags: [review, reflection, weekly-log]
week: "<% week %>"
type: review
status: active
---

# 📅 Weekly Review: <% week %>

> [!abstract] Week Quality
> **Score:** 5/5
> **Focus:** Existence & Uniqueness Proof

[[<% lastWeek %>|⬅️ Previous Week]]

---

## ✅ Accomplishments
*What did I get done?*
- [x] Finished **Proof Derivation** for Existence.
- [x] Updated **Simulation Experiment** (`fig2`).
- [x] Read **Paper [3]** and summarized it.

```dataview
TABLE without id file.link as "Log", date
FROM #daily-log
WHERE date >= date(today) - dur(7 days)
```

---

## 🛑 Challenges
*What went wrong?*
> [!failure] Stuck Points
> - Code chattering is still high.
> - Struggling with **Lyapunov function** choice.

---

## 📈 Metric Review
- **Papers Read:** `$= dv.pages("#paper").filter(p => p.status == "read").length`
- **Experiments Run:** `$= dv.pages("#simulation").filter(p => p.date >= dv.date(today)-dv.duration("7 days")).length`

---

## 🎯 Plan for Next Week
*What is the ONE Big Thing for next week?*
- **Stability Analysis** (Deadline: Feb 16)
- **Fix MATLAB Chattering**

---

## 🧠 Lessons Leaned
> [!tip] Insight
> - Start proofs from `error dynamics` first.
> - Don't ignore `beta` parameter tuning.
