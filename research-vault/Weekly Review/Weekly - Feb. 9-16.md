---
tags: [review, reflection, weekly-log]
week: "Feb 9-16"
type: review
status: active
---

# 📅 Weekly Review: Feb. 9-16

> [!abstract] Week Quality
> **Score:** 3/5
> **Focus:** 
> Finishing week 1 milestone(description of neural network)
> Finishing(Analysis of existence and uniqueness of correct steady states) 
> Starting Existence & Uniqueness Proof

[[Weekly - Feb. 2-9|⬅️ Previous Week]]

---

## ✅ Accomplishments
*What did I get done?*
- [ ] Finished **Proof Derivation** for Existence.
- [ ] Finished description of difference equation
- [ ] Finished analysis of steady states
- [ ] Updated **Simulation Experiment** (`fig2`).
- [ ] Read **Paper [[[1].pdf]]** and summarized it.

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
