<%*
// Research Journal Template
// Implements the REU Research Journal structure with variable week entries

// Prompt for project metadata
const projectTitle = await tp.system.prompt("Project Title:", "Defending Tracking Control NN Against Adversarial Attacks");
const startDate = await tp.system.prompt("Start Date (YYYY-MM-DD):", tp.date.now("YYYY-MM-DD"));
const endDate = await tp.system.prompt("End Date (YYYY-MM-DD):", moment(startDate).add(12, 'weeks').format("YYYY-MM-DD"));
const numWeeks = parseInt(await tp.system.prompt("Number of weeks to generate:", "12"));

// Generate week entry function
function generateWeekEntry(weekNum) {
    return `
## Week ${weekNum} Entry

**Entry Date:**

### Work Accomplished
-

### Problems Encountered
-

### What I Learned
-

### Resources Needed
-

### Professional Development Activities
-

### Plans for Next Week
-

### Faculty Feedback
>

---
`;
}

// Build the week entries
let weekEntries = "";
for (let i = 1; i <= numWeeks; i++) {
    weekEntries += generateWeekEntry(i);
}
_%>
---
title: Research Journal - <% projectTitle %>
type: research-journal
project: <% projectTitle %>
start_date: <% startDate %>
end_date: <% endDate %>
total_weeks: <% numWeeks %>
tags: [research, journal, REU]
created: <% tp.date.now("YYYY-MM-DD") %>
---

# Research Journal

> **Directions:** Students are required to maintain a research journal. Mentors are required to provide constructive review of mentee's research journal.

## Project Information

| Field | Value |
|-------|-------|
| **Project Title** | <% projectTitle %> |
| **Start Date** | <% startDate %> |
| **End Date** | <% endDate %> |
| **Total Weeks** | <% numWeeks %> |

---

# Weekly Entries
<% weekEntries %>

---

## Summary Statistics

```dataview
TABLE WITHOUT ID
    sum(rows.hours_worked) as "Total Hours",
    length(rows) as "Entries Completed"
FROM "Research Journal"
WHERE project = this.project
GROUP BY project
```

## Related Notes
- [[Project Dashboard]]
- [[]]
