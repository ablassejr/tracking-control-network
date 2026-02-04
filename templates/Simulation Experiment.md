<%*
// Simulation/Experiment Note Template
// For documenting simulation results and experiments
const expName = await tp.system.prompt("Experiment/Simulation name:");

const typeOptions = [
    "System Validation",
    "Controller Performance",
    "Stability Verification",
    "Attack Simulation",
    "Defense Testing",
    "Parameter Study",
    "Comparison Study",
    "Convergence Analysis",
    "Tracking Performance"
];
const expType = await tp.system.suggester(typeOptions, typeOptions, false, "Experiment type:");

const platformOptions = ["MATLAB", "Python", "C++", "CUDA", "CARLA Simulator", "Multiple"];
const platform = await tp.system.suggester(platformOptions, platformOptions, false, "Platform:");

const statusOptions = ["🔴 Planned", "🟡 Running", "🟢 Complete", "📊 Analyzing", "✅ Documented"];
const status = await tp.system.suggester(statusOptions, statusOptions, false, "Status:");
_%>
---
experiment: "<% expName %>"
type: <% expType %>
platform: <% platform %>
status: <% status %>
date_run: <% tp.date.now("YYYY-MM-DD") %>
type_note: simulation
tags: [simulation, experiment, <% expType.toLowerCase().replace(/ /g, '-') %>]
---

# 🔬 <% expName %>

> **Type:** <% expType %>
> **Platform:** <% platform %>
> **Status:** <% status %>
> **Date:** <% tp.date.now("MMMM D, YYYY") %>

---

## 🎯 Objective
*What question does this experiment answer?*


---

## 📋 Hypothesis
*What do I expect to observe?*


---

## 🏗️ Experimental Setup

### System Under Test
*Description of the system being simulated:*

**System Equation:**
$$
x(k+1) = x(k) + \tau(f(x(k)) + g(x(k))u(k))
$$

### Specific Configuration
| Parameter | Value | Units | Justification |
|-----------|-------|-------|---------------|
| $\tau$ (time step) | | | |
| $\beta$ (learning rate) | | | |
| $n$ (dimension) | | | |
| Simulation time | | | |
| Initial conditions | | | |

### System Functions
```
f(x) = 
g(x) = 
Q(x) = 
R = 
```

---

## 🧪 Test Cases

### Case 1: Nominal Operation
| Parameter | Value |
|-----------|-------|
| | |

### Case 2: Under Attack
| Attack Type | Parameters |
|-------------|------------|
| | |

### Case 3: With Defense
| Defense Mechanism | Parameters |
|-------------------|------------|
| | |

---

## 💻 Code Used

### Main Script
```<% platform.toLowerCase() === "c++" ? "cpp" : platform.toLowerCase() %>
% <% expName %>
% Date: <% tp.date.now("YYYY-MM-DD") %>


```

### Key Parameters
```<% platform.toLowerCase() === "c++" ? "cpp" : platform.toLowerCase() %>

```

---

## 📊 Results

### Numerical Results
| Metric | Expected | Actual | Pass? |
|--------|----------|--------|-------|
| Convergence time | | | |
| Final error | | | |
| Stability | | | |

### Trajectory Plots
![[]] 
*Caption: *

### Control Signal
![[]]
*Caption: *

### Error Dynamics
![[]]
*Caption: *

---

## 📈 Analysis

### Key Observations
1. 
2. 
3. 

### Comparison with Theory
| Theoretical Prediction | Simulation Result | Match? |
|------------------------|-------------------|--------|
| | | |

### Statistical Analysis
| Metric | Value |
|--------|-------|
| Mean error | |
| Max error | |
| Std deviation | |
| Convergence steps | |

---

## 🔄 Parameter Sensitivity

### Sensitivity to τ
| τ value | Convergence | Stability | Notes |
|---------|-------------|-----------|-------|
| | | | |

### Sensitivity to β
| β value | Convergence | Accuracy | Notes |
|---------|-------------|----------|-------|
| | | | |

---

## ⚠️ Failure Cases

### Case:
**Conditions:** 
**Observed Behavior:** 
**Cause:** 
**Implications:** 

---

## 🆚 Comparison with Other Methods

| Method | This Work | Competitor 1 | Competitor 2 |
|--------|-----------|--------------|--------------|
| Convergence time | | | |
| Accuracy | | | |
| Complexity | | | |
| Robustness | | | |

---

## 💡 Insights & Conclusions

### What I Learned
1. 

### Confirms Theory?
- [ ] Yes, results match theoretical predictions
- [ ] Partially - discrepancies in:
- [ ] No - investigate:

### Implications for Project
- 

---

## 🐛 Issues Encountered

### Issue 1:
**Problem:** 
**Solution:** 

---

## 📝 Notes

### Unexpected Results
- 

### Things to Investigate Further
- [ ] 

### Ideas for Future Experiments
- [ ] 

---

## ❓ Questions for Professor
1. 

---

## 📁 Files & Data

### Code Files
- [[]]

### Data Files
- Location: 
- Format: 

### Figures
- [[]]

---

## 📚 References
- Replicates experiment from: 
- Based on theory from: 

---

## ✅ Checklist
- [ ] Experiment objectives defined
- [ ] Setup documented
- [ ] Code tested and working
- [ ] Results recorded
- [ ] Analysis complete
- [ ] Conclusions drawn
- [ ] Files organized
- [ ] Ready for report/presentation
