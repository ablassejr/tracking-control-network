<%*
// ═══════════════════════════════════════════════════════════════════════════
// 📚 PAPER NOTE (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// ═══════════════════════════════════════════════════════════════════════════

// Prompt for paper details
const title = await tp.system.prompt("Paper Title:");
const author = await tp.system.prompt("First Author (e.g., Tymoshchuk):");
const year = await tp.system.prompt("Year:");
const citeKey = `${author}${year}`;

// Rename file
const filename = `@${citeKey} - ${title.replace(/[^a-zA-Z0-9\s-]/g, '').trim()}`;
await tp.file.rename(filename);
-%>
---
tags: [literature, paper, ref/<% citeKey %>]
title: "<% title %>"
authors: "<% author %> et al."
year: <% year %>
cite_key: "<% citeKey %>"
status: unread
relevance: medium
---

# 📚 <% title %>

> [!info] Metadata
> **Authors:** <% author %> et al. (<% year %>)
> **Cite Key:** `[[@<% citeKey %>]]`
> **Relevance:** `$= dv.current().relevance`
> **Status:** `$= dv.current().status`
> **PDF:** `[[Resources/PDF - [<% citeKey %>].pdf|Open PDF]]` (Check Resources folder)

---

## 🎯 Core Contribution
*What is the ONE main idea or innovation in this paper?*
> <% tp.file.cursor(1) %>

---

## 🔑 Key Concepts & Definitions
- **Concept 1:** ...
- **Definition 2:** ...

---

## 🧪 Methodology
*How did they solve the problem?*
- **System Model:** `x(k+1) = ...`
- **Control Law:** `u(k) = ...`
- **Defense Mechanism:** ...

---

## 📊 Results
*What did they achieve?*
- **Metric:** ...
- **Improvement:** ...

---

## 🧠 Critical Analysis (My Thoughts)
> [!question] Strengths
> - ...

> [!failure] Weaknesses / Gaps
> - ...

> [!tip] Connection to My Project
> - This paper justifies the use of **Signum function** in my controller.
> - I can use their **Theorem 2** for my stability proof.

---

## 📝 Extracted Quotes / Figures
* "Quote..." (p. 4)
* ![[Figure 1.png]]

---

## 🔗 References
```dataview
TABLE without id file.link as "Related Concepts", priority
FROM #concept
WHERE contains(file.outlinks, this.file.link)
```
