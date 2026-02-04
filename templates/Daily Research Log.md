<%*
// Daily Research Log Template
// For: Defending Tracking Control NN Against Adversarial Attacks
const today = tp.date.now("YYYY-MM-DD");
const dayOfWeek = tp.date.now("dddd");
const weekNum = tp.date.now("W");

// Calculate project progress
const projectStart = moment("2026-01-26");
const projectEnd = moment("2026-04-10");
const todayMoment = moment(today);
const totalDays = projectEnd.diff(projectStart, 'days');
const daysElapsed = todayMoment.diff(projectStart, 'days');
const progressPercent = Math.max(0, Math.min(100, Math.round((daysElapsed / totalDays) * 100)));

// Determine current milestone based on date
let currentMilestone = "Pre-project";
if (todayMoment.isBefore(moment("2026-02-02"))) currentMilestone = "Week 1: Difference Equation Description";
else if (todayMoment.isBefore(moment("2026-02-09"))) currentMilestone = "Week 2: Existence & Uniqueness Analysis";
else if (todayMoment.isBefore(moment("2026-02-16"))) currentMilestone = "Week 3: Stability & Convergence";
else if (todayMoment.isBefore(moment("2026-03-02"))) currentMilestone = "Weeks 4-5: Block Diagram Analysis";
else if (todayMoment.isBefore(moment("2026-03-09"))) currentMilestone = "Week 6: Implementation";
else if (todayMoment.isBefore(moment("2026-03-16"))) currentMilestone = "Midterm Report";
else if (todayMoment.isBefore(moment("2026-04-10"))) currentMilestone = "Weeks 7-10: Comparison & Final";
else currentMilestone = "Post-project";
_%>
---
date: <% today %>
day: <% dayOfWeek %>
week: <% weekNum %>
type: daily-log
project: Tracking Control NN Defense
milestone: <% currentMilestone %>
progress: <% progressPercent %>%
tags: [daily, research-log]
---

# 📅 Research Log - <% tp.date.now("MMMM D, YYYY") %>

> **Current Milestone:** <% currentMilestone %>
> **Project Progress:** <% progressPercent %>% complete

---

## 🎯 Today's Focus
<%*
const focus = await tp.system.prompt("What is your main focus today?");
_%>
<% focus %>

---

## 📚 What I Learned

### Key Concepts
- 

### Connections to Project
- 

### Mathematical Insights
- 

---

## 💻 Work Completed

### Reading/Study
- [ ] 

### Implementation
- [ ] 

### Writing/Documentation
- [ ] 

---

## ❓ Questions That Arose

### For Self-Study
1. 

### For Professor (Dr. Tymoshchuk)
1. 

---

## 🔗 Related Notes
- [[]]

---

## 📊 Time Tracking
| Activity | Time Spent |
|----------|------------|
| Reading | |
| Coding | |
| Writing | |
| Meetings | |
| **Total** | |

---

## 📝 Tomorrow's Plan
1. 
2. 
3. 

---

## 💡 Insights & Reflections
> 

---

## 🏷️ Topics Touched Today
```dataview
LIST
WHERE file.day = date("<% today %>") AND type = "concept"
```
