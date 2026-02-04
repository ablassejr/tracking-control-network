<%*
// Paper/Literature Note Template
// For academic paper notes and literature review
const title = await tp.system.prompt("Paper title:");
const authors = await tp.system.prompt("Authors (comma separated):");
const year = await tp.system.prompt("Publication year:");
const venue = await tp.system.prompt("Journal/Conference:");
const doi = await tp.system.prompt("DOI or URL (optional):", "");

// Relevance to project
const relevanceOptions = ["Core (directly related)", "Supporting (provides background)", "Peripheral (tangentially related)", "Methodology (techniques to use)"];
const relevance = await tp.system.suggester(relevanceOptions, relevanceOptions, false, "How relevant to your project?");

// Paper category
const categoryOptions = [
    "Optimal Control",
    "Neural Networks for Control", 
    "Lyapunov Stability",
    "Discrete-Time Systems",
    "Adversarial Attacks",
    "Defense Mechanisms",
    "Tracking Control",
    "HJB Equation",
    "Sliding Mode Control",
    "Implementation/Simulation",
    "Other"
];
const category = await tp.system.suggester(categoryOptions, categoryOptions, false, "Paper category:");
_%>
---
title: "<% title %>"
authors: [<% authors.split(',').map(a => '"' + a.trim() + '"').join(', ') %>]
year: <% year %>
venue: "<% venue %>"
doi: "<% doi %>"
date_read: <% tp.date.now("YYYY-MM-DD") %>
type: paper-note
category: <% category %>
relevance: <% relevance %>
rating: 
tags: [paper, literature, <% category.toLowerCase().replace(/ /g, '-') %>]
---

# 📄 <% title %>

> **Authors:** <% authors %>
> **Year:** <% year %>
> **Venue:** <% venue %>
<% doi ? `> **DOI:** [${doi}](https://doi.org/${doi})` : "" %>

---

## 📋 Quick Reference

| Aspect | Details |
|--------|---------|
| **Relevance** | <% relevance %> |
| **Category** | <% category %> |
| **Key Contribution** | |
| **Methodology** | |

---

## 🎯 Main Contributions
1. 
2. 
3. 

---

## 📖 Summary

### Problem Addressed


### Proposed Approach


### Key Results


---

## 🔬 Technical Details

### System Model
```
(Insert key equations here)
```

### Assumptions
- 

### Theorems/Lemmas
1. **Theorem 1:** 
   - Statement:
   - Significance:

### Algorithm/Method
```
(Pseudocode or method description)
```

---

## 🔗 Connection to My Project

### Directly Applicable Concepts
- 

### Techniques I Can Use
- 

### Differences from My Approach
- 

### Questions This Paper Raises
1. 

---

## 📊 Comparison with Other Papers

| Aspect | This Paper | [[Other Paper]] |
|--------|------------|-----------------|
| Method | | |
| Results | | |
| Limitations | | |

---

## 💭 Critical Analysis

### Strengths
- 

### Limitations
- 

### Potential Improvements
- 

---

## 📝 Key Equations

### Equation 1: 
$$

$$
> Interpretation:

### Equation 2:
$$

$$
> Interpretation:

---

## 🗣️ Notable Quotes
> "..." (p. )

---

## ❓ Questions for Professor
1. 

---

## 📚 References to Follow Up
- [ ] 
- [ ] 

---

## 🏷️ Keywords
`keywords::`

---

## 📎 Attachments
- [[]] (PDF link if stored locally)
