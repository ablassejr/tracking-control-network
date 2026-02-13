<%*
// ═══════════════════════════════════════════════════════════════════════════
// 🧠 CONCEPT NOTE (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// Mentor: Dr. Pavlo Tymoshchuk (UNT)
// ═══════════════════════════════════════════════════════════════════════════

const conceptName = await tp.system.prompt("Concept Name (e.g., 'Affine Systems'):");
const category = await tp.system.suggester(
    ["Math", "Control", "NN", "Attacks", "Impl"],
    ["Math", "Control", "NN", "Attack", "Code"],
    false,
    "Category:"
);

// Rename file
const filename = conceptName.replace(/[^a-zA-Z0-9\s-]/g, '').trim();
await tp.file.rename(filename);
-%>
---
aliases: [<% conceptName %>]
tags: [concept, learning]
created: <% tp.date.now("YYYY-MM-DD") %>
category: "<% category %>"
understanding_level: 0
status: "not-started"
---

# 🧠 Concept: <% conceptName %>

> [!info] Quick Summary
> **Category:** [[<% category %>]]
> **Understanding:** `$= dv.current().understanding_level`/5 🧠

---

## 🎯 The "Why"
Why do we need **<% conceptName %>**?
<% tp.file.cursor(1) %>

---

## 📐 Definition
> [!abstract] Formal Definition
> ...

### My Interpretation
> [!tip] In Simple Terms
> ...

---

## 🔗 Connections
- Related to: [[Difference Equations]]?
- Found in: [[PDF - [1].pdf]] (pg. ...)

---

## ❓ Questions
- [ ] What is an *affine* system specifically?
- [ ] Is `f(x) + g(x)u` always affine in `u`?

---

## 📚 References
```dataview
TABLE without id file.link as "Related Notes"
FROM #concept
WHERE contains(file.outlinks, this.file.link)
```
