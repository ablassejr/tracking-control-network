<%*
// Professor Meeting Note Template
// For documenting meetings with Dr. Tymoshchuk
const meetingDate = await tp.system.prompt("Meeting date:", tp.date.now("YYYY-MM-DD"));
const meetingType = await tp.system.suggester(
    ["Scheduled Check-in", "Office Hours", "Email Exchange", "Quick Question", "Presentation/Review"],
    ["scheduled", "office-hours", "email", "quick", "presentation"],
    false,
    "Meeting type:"
);
const duration = await tp.system.prompt("Duration (minutes):", "30");
_%>
---
date: <% meetingDate %>
type: professor-meeting
meeting_type: <% meetingType %>
duration: <% duration %> min
professor: Dr. Pavlo Tymoshchuk
institution: University of North Texas
project: Tracking Control NN Defense
tags: [meeting, professor, guidance]
---

# 🎓 Meeting with Dr. Tymoshchuk - <% moment(meetingDate).format("MMMM D, YYYY") %>

> **Type:** <% meetingType %>
> **Duration:** <% duration %> minutes

---

## 📋 Pre-Meeting Preparation

### Questions to Ask (Prioritized)
1. **[HIGH]** 
2. **[HIGH]** 
3. **[MED]** 
4. **[LOW]** 

### Topics to Discuss
- [ ] 
- [ ] 

### Materials to Share/Review
- [ ] 

### Progress to Report
- 

---

## 📝 Meeting Notes

### Key Discussion Points

#### Topic 1: 
**My Question/Topic:**

**Professor's Response:**

**Action Items:**
- [ ] 

---

#### Topic 2:
**My Question/Topic:**

**Professor's Response:**

**Action Items:**
- [ ] 

---

### Professor's Recommendations
1. 
2. 
3. 

### Resources Mentioned
- [ ] (to look up)
- [ ] 

### Warnings/Things to Avoid
- 

---

## 💡 Key Insights Gained

### Technical Clarifications
1. 

### Strategic Guidance
1. 

### Research Direction
1. 

---

## ✅ Action Items

### Immediate (This Week)
- [ ] 
- [ ] 

### Short-term (Before Next Meeting)
- [ ] 
- [ ] 

### Long-term
- [ ] 

---

## ❓ Follow-up Questions
*Questions that arose during the meeting to ask next time:*
1. 
2. 

---

## 📊 Project Status Discussed

| Milestone | Status | Feedback |
|-----------|--------|----------|
| Difference Equation Description | | |
| Existence & Uniqueness | | |
| Stability & Convergence | | |
| Block Diagram | | |
| Implementation | | |

---

## 🔗 Related Notes
- [[]]

---

## 📅 Next Meeting
**Planned Date:** 
**Topics to Cover:**
- 

---

## 📎 Attachments
- [[]] (any documents shared)

---

## 💭 Personal Reflection
*What did I learn? What should I do differently?*

