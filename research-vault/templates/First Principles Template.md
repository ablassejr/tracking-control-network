<%*
// ═══════════════════════════════════════════════════════════════════════════
// 🧠 FIRST PRINCIPLES LEARNING TEMPLATE (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// Mentor: Dr. Pavlo Tymoshchuk (UNT) | Duration: Jan 26 - Apr 10, 2026
// ═══════════════════════════════════════════════════════════════════════════

// 1. Gather Metadata via Prompt/Suggester
const conceptName = await tp.system.prompt("Concept Name (e.g., 'Lyapunov Stability'):");
const category = await tp.system.suggester(
    [
        "1. Mathematical Foundations",
        "2. Control Theory Fundamentals", 
        "3. Stability Analysis",
        "4. Neural Network Concepts",
        "5. Adversarial Attacks & Defense",
        "6. Implementation Skills",
        "7. Project Timeline & Deliverables"
    ],
    [
        "Mathematical Foundations",
        "Control Theory Fundamentals",
        "Stability Analysis",
        "Neural Network Concepts",
        "Adversarial Attacks & Defense",
        "Implementation Skills",
        "Project Timeline & Deliverables"
    ],
    false,
    "Select Primary Category:"
);

const priority = await tp.system.suggester(
    ["🔴 Critical - Must understand deeply", "🟡 Important - Should understand well", "🟢 Helpful - Good to know"],
    ["Critical", "Important", "Helpful"],
    false,
    "Priority Level:"
);

const learningMethod = await tp.system.suggester(
    ["📖 Self-Study", "👨‍🏫 Ask Professor", "🔬 Both - Study then Discuss"],
    ["Self-Study", "Ask-Professor", "Both"],
    false,
    "Learning Method:"
);

const relatedMilestone = await tp.system.suggester(
    [
        "Week 1: Difference Equation Description",
        "Week 2: Existence & Uniqueness",
        "Week 3: Stability & Convergence",
        "Weeks 4-5: Block Diagram Analysis",
        "Week 6: Implementation",
        "Weeks 7-9: Comparison & Simulation",
        "General / ongoing"
    ],
    ["Week 1", "Week 2", "Week 3", "Week 4-5", "Week 6", "Week 7-9", "General"],
    false,
    "Related Project Milestone:"
);

// 2. Set Filename & Move File
const filename = conceptName.replace(/[^a-zA-Z0-9\s-]/g, '').trim();
await tp.file.rename(filename);

// Optional: Auto-move based on category (Uncomment if folder structure exists)
// const targetFolder = `Research Journal/${category}`;
// if (!tp.file.exists(targetFolder)) { await tp.file.create_folder(targetFolder); }
// await tp.file.move(`${targetFolder}/${filename}`);

-%>
---
aliases: [<% conceptName %>]
tags:
  - concept
  - research/first-principles
  - category/<% category.toLowerCase().replace(/\s+/g, '-') %>
  - priority/<% priority.toLowerCase() %>
  - milestone/<% relatedMilestone.toLowerCase() %>
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
category: "<% category %>"
priority: "<% priority %>"
learning_method: "<% learningMethod %>"
milestone: "<% relatedMilestone %>"
understanding_level: 0
status: "not-started"
---

# 🧠 <% conceptName %>

> [!info] Quick Summary
> **Category:** [[<% category %>]]
> **Priority:** <% priority === "Critical" ? "🔴 Critical" : priority === "Important" ? "🟡 Important" : "🟢 Helpful" %>
> **Method:** <% learningMethod === "Self-Study" ? "📖 Self-Study" : "👨‍🏫 Ask Professor" %>
> **Milestone:** [[<% relatedMilestone %>]]
> **Understanding:** `$= dv.current().understanding_level`/5 ⬜⬜⬜⬜⬜

---

## 🎯 The "Why" (First Principles)
> [!question] Core Question
> Why is **<% conceptName %>** fundamental to *defending tracking control NNs*?

<% tp.file.cursor(1) %>

---

## 📐 Formal Definition & Intuition

### Mathematical Formulation
$$
% Insert key equation here
$$

### Intuitive Explanation (The "Feynman Technique")
> [!tip] In Plain English
> Explain this concept as if teaching it to a first-year student. Avoid jargon initially.
> ...

---

## 🔗 Connection to Project Equations
Reference **Tymoshchuk 2024** or **Jedh 2023** equations here.

- **System Eq:** $x(k+1) = x(k) + \tau(f(x(k)) + g(x(k))u(k))$
- **How <% conceptName %> applies:**
  - ...

---

## 🧪 Verification & Examples

### Worked Example 1
**Problem:** ...
**Solution:** ...

### Simulation Connection (MATLAB/Octave)
How do we implement this?
```matlab
% conceptual implementation
```

---

## ❓ Questions & Gaps
- [ ] Question 1?
- [ ] Question 2?

> [!todo] Action Items
> - [ ] Verify definition in *Khalil - Nonlinear Systems*
> - [ ] Implement simple test case in `src/simulations/scratchpad`

---

## 📚 References
```dataview
TABLE without id file.link as "Related Notes", priority
FROM #concept
WHERE contains(file.outlinks, this.file.link) OR contains(file.inlinks, this.file.link)
SORT priority asc
```
