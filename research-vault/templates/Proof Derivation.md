<%*
// ═══════════════════════════════════════════════════════════════════════════
// 📐 PROOF DERIVATION (ENHANCED)
// Research Project: Defending Tracking Control NN Against Adversarial Attacks
// Mentor: Dr. Pavlo Tymoshchuk (UNT)
// ═══════════════════════════════════════════════════════════════════════════

// Prompt for derivation name
const name = await tp.system.prompt("Proof Name (e.g., Stability of Error Dynamics):");

// Rename file
const filename = `Proof - ${name.replace(/[^a-zA-Z0-9\s-]/g, '').trim()}`;
await tp.file.rename(filename);
-%>
---
tags: [proof, derivation, math]
type: formal-proof
status: draft
reviewed: false
---

# 📐 Proof: <% name %>

> [!info] Metadata
> **Subject:** [[Control Theory]]
> **Related Concept:** [[Lyapunov Stability]]
> **Status:** `$= dv.current().status`
> **Verified By:** ...

---

## 🎯 Objective
**Prove:** The tracking error $e(k) \to 0$ as $k \to \infty$ under the proposed control law $u(k)$.

---

## 🏗️ Definitions & Assumptions
Let the system be defined as:
$$
x(k+1) = x(k) + \tau \big( f(x(k)) + g(x(k))u(k) \big) \tag{1}
$$

Define the tracking error as:
$$
e(k) = x(k) - x_d(k) \tag{2}
$$

Assume:
1. $g(x) \neq 0$ for all $x$.
2. The disturbance is bounded: $|d(k)| \le \delta$.

---

## 📝 Step-by-Step Derivation

### Step 1: Error Dynamics
Substitute (1) into (2):
$$
e(k+1) = x(k) + \tau(f + gu) - x_d(k+1)
$$

### Step 2: Control Law selection
Choose $u(k)$ such that:
$$
u(k) = g^{-1}(x) \left[ \frac{1}{\tau}(x_d(k+1) - x(k)) - f(x) - \beta \text{sgn}(e(k)) \right]
$$

### Step 3: Closed-Loop Dynamics
Substituting $u(k)$ back into the error equation:
$$
e(k+1) = e(k) - \tau \beta \text{sgn}(e(k))
\implies e(k+1) \approx (1 - \tau\beta) e(k) \quad \text{(linearized)}
$$

---

## 🔍 Validation (Sanity Check)
- [ ] Dimension check? ($x \in \mathbb{R}^n$, $u \in \mathbb{R}^m$)
- [ ] Limits check? (Does $\tau \to 0$ make sense?)
- [ ] Simulation check? (See [[Simulation Experiment]])

---

## ⚠️ Potential Flaws
> [!failure] Be Honest
> - Is the assumption $g(x) \neq 0$ valid everywhere?
> - What if $\tau$ is too large?

---

## 📚 References
- **Khalil**, *Nonlinear Systems*, p. ...
- **Tymoshchuk**, *Neural Networks for Control*, Eq. ...
