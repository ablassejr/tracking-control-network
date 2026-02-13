<%*
// ═══════════════════════════════════════════════════════════════════════════
// 📅 DAILY RESEARCH LOG (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// Mentor: Dr. Pavlo Tymoshchuk (UNT) | Duration: Jan 26 - Apr 10, 2026
// ═══════════════════════════════════════════════════════════════════════════

const date = tp.date.now("YYYY-MM-DD");
const yesterday = tp.date.now("YYYY-MM-DD", -1);
const tomorrow = tp.date.now("YYYY-MM-DD", 1);
const time = tp.date.now("HH:mm");

// Prompt for the "One Big Thing" (Focus of the Day)
const focus = await tp.system.prompt("🎯 What is the ONE critical thing to solve today?");

// 1. Rename file to date
await tp.file.rename(date);

// 2. Move to Daily Logs folder
const targetFolder = "Daily Logs";
if (!tp.file.exists(targetFolder)) { await tp.file.create_folder(targetFolder); }
await tp.file.move(`${targetFolder}/${date}`);
-%>
---
tags: [daily-log, research]
date: <% date %>
type: daily
focus: "<% focus %>"
status: active
---

# 📅 Daily Log: <% date %>

> [!abstract] Today's Focus
> **🎯 <% focus %>**

[[<% yesterday %>|⬅️ Yesterday]] | [[<% tomorrow %>|➡️ Tomorrow]]

---

## ⚡ Active Tasks
```dataview
TASK
FROM "Tasks" OR "Plans"
WHERE !completed AND file.name != this.file.name
GROUP BY file.name
```

## 📝 Rapid Logging
*<% time %>* - Setup daily log.
<% tp.file.cursor(1) %>

---

## 🧠 Conceptual Review
*Any new concepts encountered today?*
- [[Difference Equations Exploration]] (Example)

## 🔬 Simulation Notes
*Did I run any MATLAB code today?*
- **Experiment:** ...
- **Result:** ...
- **Code:** `src/simulations/fig2/...`

---

## 🛑 Blockers & Questions
> [!failure] Current Obstacles
> - ...

> [!question] For Dr. Pavlo
> - ...

---

## 🌅 Evening Review
- [ ] Updated **Project Dashboard**?
- [ ] Committed code to git?
- [ ] Planned tomorrow?

**Mood/Energy:** ⚡⚡⚡⚡⚡ (5/5)
