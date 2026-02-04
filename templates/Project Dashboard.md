<%*
// Project Dashboard Template
// Main overview page for the entire research project
_%>
---
type: dashboard
project: Tracking Control NN Defense
created: <% tp.date.now("YYYY-MM-DD") %>
tags: [dashboard, overview, project]
cssclass: dashboard
---

# 🎯 Research Project Dashboard
## Defending Tracking Control Neural Network for Known Affine Discrete-Time Nonlinear Systems Against Adversarial Attacks

> **Duration:** January 26 - April 10, 2026
> **Mentor:** Dr. Pavlo Tymoshchuk (University of North Texas)
> **Student:** Ablasse Kingcaid-Ouedraogo (Texas A&M University)

---

## 📊 Project Progress

```dataviewjs
const projectStart = new Date("2026-01-26");
const projectEnd = new Date("2026-04-10");
const today = new Date();
const totalDays = (projectEnd - projectStart) / (1000 * 60 * 60 * 24);
const daysElapsed = Math.max(0, (today - projectStart) / (1000 * 60 * 60 * 24));
const progress = Math.min(100, Math.round((daysElapsed / totalDays) * 100));

dv.paragraph(`**Overall Progress:** ${progress}%`);
dv.paragraph(`**Days Elapsed:** ${Math.round(daysElapsed)} / ${totalDays}`);
```

---

## 📅 Milestones

| Week | Dates | Milestone | Status | Deadline |
|------|-------|-----------|--------|----------|
| 1 | Jan 26 - Feb 2 | Difference Equation Description | ⬜ | Feb 2 |
| 2 | Feb 2 - Feb 9 | Existence & Uniqueness Analysis | ⬜ | Feb 9 |
| 3 | Feb 9 - Feb 16 | Stability & Convergence | ⬜ | Feb 16 |
| 4-5 | Feb 16 - Mar 2 | Block Diagram Analysis | ⬜ | Mar 2 |
| 6 | Mar 2 - Mar 9 | Implementation | ⬜ | Mar 9 |
| - | Mar 9 - Mar 16 | **Midterm Report** | ⬜ | Mar 16 |
| 7 | Mar 16 - Mar 23 | Compare Implementations | ⬜ | Mar 23 |
| 8 | Mar 23 - Mar 30 | Compare with Analogs | ⬜ | Mar 30 |
| 9 | Mar 30 - Apr 6 | Simulations | ⬜ | Apr 6 |
| 10 | Apr 6 - Apr 10 | **Final Report & Poster** | ⬜ | Apr 10 |

---

## 📚 Learning Progress

### Concepts by Status
```dataview
TABLE WITHOUT ID
    status as "Status",
    length(rows) as "Count"
FROM #concept
GROUP BY status
```

### Critical Concepts
```dataview
TABLE status, category
FROM #concept
WHERE contains(priority, "Critical")
SORT status ASC
LIMIT 10
```

---

## 💻 Implementation Status

```dataview
TABLE status, language, component
FROM #implementation
SORT status ASC
```

---

## 📄 Papers Read

```dataview
TABLE year, relevance, rating
FROM #paper
SORT year DESC
LIMIT 10
```

---

## 🎓 Professor Meetings

```dataview
TABLE date, meeting_type, duration
FROM #professor-meeting
SORT date DESC
LIMIT 5
```

### Pending Questions for Professor
```dataview
LIST
FROM #concept OR #proof OR #implementation
WHERE contains(file.content, "Questions for Professor") OR contains(file.content, "Ask Professor")
LIMIT 10
```

---

## 📐 Proofs & Derivations

```dataview
TABLE type, status, source
FROM #proof
SORT status ASC
```

---

## 🔬 Simulations & Experiments

```dataview
TABLE type, platform, status
FROM #simulation
SORT date_run DESC
```

---

## 📝 Recent Activity

### Latest Daily Logs
```dataview
TABLE day, milestone, progress
FROM #daily
SORT date DESC
LIMIT 7
```

### Recent Notes
```dataview
LIST
FROM ""
WHERE file.cday >= date(today) - dur(7 days)
SORT file.cday DESC
LIMIT 10
```

---

## 🎯 Quick Actions

### 📝 Create New Notes
- [[Daily Research Log]] - Start today's log
- [[Concept Note]] - Document a new concept
- [[Paper Note]] - Notes on a paper
- [[Professor Meeting]] - Document a meeting
- [[Implementation Log]] - Track code development
- [[Proof Derivation]] - Work through a proof
- [[Simulation Experiment]] - Document an experiment

---

## 📊 Statistics

### Notes by Type
```dataview
TABLE WITHOUT ID
    type as "Type",
    length(rows) as "Count"
FROM ""
WHERE type
GROUP BY type
```

### This Week's Activity
```dataview
LIST
FROM #daily
WHERE date >= date(today) - dur(7 days)
```

---

## 📂 Key Resources

### Project Documents
- [[Research_Project_Overview.pdf]]
- [[Local_REU_Research_Plan.pdf]]
- [[Tymoshchuk 2024 - Tracking Control NN]]
- [[Tymoshchuk 2024 - Neural Computing]]
- [[Jedh 2023 - ACC Security]]

### Reference Materials
- [[Khalil - Nonlinear Systems]]
- [[Ogata - Discrete-Time Control Systems]]
- [[Haykin - Neural Networks]]

---

## 🏷️ Tag Index

### By Category
- #concept - Learning concepts
- #paper - Literature notes
- #implementation - Code development
- #proof - Mathematical proofs
- #simulation - Experiments
- #daily - Daily logs
- #weekly - Weekly reviews
- #professor-meeting - Meeting notes

### By Topic
- #control-theory
- #stability-analysis
- #neural-networks
- #adversarial-attacks
- #lyapunov
- #discrete-time

---

## 💡 Ideas & Insights

*Quick capture for ideas that come up:*

- 

---

## ⚠️ Current Blockers

- [ ] 

---

## 📅 Upcoming Deadlines

```dataview
TABLE deadline as "Due", task as "Task"
FROM ""
WHERE deadline
WHERE deadline >= date(today)
SORT deadline ASC
LIMIT 5
```

---

*Last updated: `= date(today)`*
