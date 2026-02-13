<%*
// ═══════════════════════════════════════════════════════════════════════════
// 🧪 EXPERIMENT LOG (NEW)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// ═══════════════════════════════════════════════════════════════════════════

const expName = await tp.system.prompt("Experiment Name (e.g., 'Fig 2a - High Noise'):");
const simPath = await tp.system.suggester(
    ["src/simulations/fig2/", "src/simulations/fig5/", "src/simulations/scratchpad/"],
    ["fig2", "fig5", "scratchpad"],
    false,
    "Target Simulation:"
);

const parameterSet = await tp.system.prompt("Key Parameter Changed (e.g., 'beta=0.5'):");

// Rename file
const filename = `Exp - ${expName} - ${tp.date.now("YYYYMMDD")}`;
await tp.file.rename(filename);
-%>
---
tags: [experiment, simulation, matlab]
date: <% tp.date.now("YYYY-MM-DD") %>
simulation: "<% simPath %>"
parameter_focus: "<% parameterSet %>"
result_summary: "pending"
---

# 🧪 Experiment: <% expName %>

> [!info] Configuration
> **Date:** <% tp.date.now("YYYY-MM-DD HH:mm") %>
> **Simulation:** `src/simulations/<% simPath %>`
> **Key Parameter:** `<% parameterSet %>`

---

## ⚙️ Setup & Hypothesis
*What am I testing?*
- **Hypothesis:** Decreasing `beta` will improve tracking but slow convergence.
- **Base Code:** `fig2a.m` (Example)

### Parameters
| Parameter | Value | Notes |
| :--- | :--- | :--- |
| `beta` | | Learning rate |
| `tau` | | Sampling time |
| `adv_attack` | | `None` / `FGM` / `PGD` |

---

## 📊 Results (Output)
*Paste relevant MATLAB console output or describe plot.*

```matlab
% Console Output
>> ...
```

### Observations
- [ ] Tracking Error: Converged? Diverged?
- [ ] Control Effort: Smooth? Chattering?

> [!success] Outcome
> <% tp.file.cursor(1) %>

---

## 🔄 Next Steps
- [ ] Tweak parameter `...`
- [ ] Plot result in report?
