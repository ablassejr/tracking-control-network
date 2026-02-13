<%*
// ═══════════════════════════════════════════════════════════════════════════
// 📊 PROJECT DASHBOARD (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// Mentor: Dr. Pavlo Tymoshchuk (UNT) | Duration: Jan 26 - Apr 10, 2026
// ═══════════════════════════════════════════════════════════════════════════

const today = tp.date.now("YYYY-MM-DD");
-%>
---
type: dashboard
project: Tracking Control NN Defense
created: <% today %>
tags: [dashboard, overview, project]
cssclass: dashboard
---

# 🎯 **Research Dashboard**
> **Mentors**: Dr. Pavlo Tymoshchuk (UNT)
> **Goal**: Defend Tracking Control NN against Adversarial Attacks (Discrete-Time Affine Nonlinear Systems).
> **Deadline**: **Apr 10, 2026** ( Poster & Final Report )

---

## 📅 **Milestone Timeline**

```dataviewjs
// Dynamic Timeline Visualization
const milestones = [
    { name: "Week 1: Difference Eq Description", due: "2026-02-02", status: "completed" },
    { name: "Week 2: Existence & Uniqueness", due: "2026-02-09", status: "active" },
    { name: "Week 3: Stability & Convergence", due: "2026-02-16", status: "pending" },
    { name: "Week 4-5: Block Diagram Analysis", due: "2026-03-02", status: "pending" },
    { name: "Week 6: Implementation", due: "2026-03-09", status: "pending" },
    { name: "Midterm Report", due: "2026-03-16", status: "pending" },
    { name: "Week 7: Compare Implementations", due: "2026-03-23", status: "pending" },
    { name: "Final Report", due: "2026-04-10", status: "pending" }
];

const today = new Date();
dv.header(3, "📍 Current Focus: " + milestones.find(m => m.status === "active")?.name || "None");

dv.table(["Milestone", "Due Date", "Status", "Days Left"], 
    milestones.map(m => {
        const due = new Date(m.due);
        const diff = Math.ceil((due - today) / (1000 * 60 * 60 * 24));
        const indicator = m.status === "completed" ? "✅" : m.status === "active" ? "🏃" : "⏳";
        return [indicator + " " + m.name, m.due, m.status, diff + " days"];
    })
);
```

---

## 🧠 **Concept Mastery Matrix**
*Track understanding of key theoretical concepts.*

```dataview
TABLE without id file.link as "Concept", priority, understanding_level + "/5 🧠" as "Mastery", status
FROM #concept OR "Research Journal/Concepts Exploration"
SORT priority desc, understanding_level asc
```

---

## 🧪 **Simulation Tracking** (MATLAB Code)
*Overview of experiments in `src/simulations/`.*

- **Fig 2 (CSTR Sliding Mode Control):** `src/simulations/fig2/`
- **Fig 5 (Sinusoidal Tracking):** `src/simulations/fig5/`

```dataview
TABLE without id file.link as "Experiment Log", date, result_summary as "Outcome"
FROM #simulation
SORT date desc
LIMIT 5
```

---

## 📝 **Recent Activity**
*What have I been working on?*

```dataview
LIST 
FROM ""
WHERE file.mtime >= date(today) - dur(3 days) AND file.name != "Project Dashboard"
SORT file.mtime desc
LIMIT 10
```

---

## ⚠️ **Blockers & Questions**
*Items needing Professor or Mentor input.*

```dataview
TASK
FROM "Daily Research Log" OR "Meetings"
WHERE contains(text, "question") OR contains(text, "ask") OR contains(text, "blocker")
WHERE !completed
```
