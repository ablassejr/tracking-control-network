# Metalearning Step 3: Stability Analysis

> **Purpose:** Demonstrate understanding of Lyapunov stability, existence/uniqueness of steady states, finite-time convergence, and sliding mode analysis - the theoretical backbone proving the defense mechanism works.
>
> **When complete:** You can independently walk through the paper's stability proofs and explain why the defended tracking control NN is guaranteed to work correctly.

---

## 3.1 Lyapunov Stability Theory

### Concept Check

**Q1: Lyapunov's Second Method**
State the two conditions required for Lyapunov stability:
1. Condition on V(x): ?
2. Condition on delta_V(k) = V(k+1) - V(k): ?

In your own words, explain the intuition: why do these two conditions guarantee stability?

```
Your answer:


```

**Q2: Lyapunov Function Construction**
The paper uses W(k) = |x(k)| as the Lyapunov candidate function. Verify that it satisfies the first condition (positive definite): Is W(x) > 0 for x != 0 and W(0) = 0?

```
Your answer:


```

**Q3: Global Asymptotic Stability**
Define global asymptotic stability. What is the difference between:
- Stability (trajectories stay close)
- Asymptotic stability (trajectories converge)
- Global asymptotic stability (converge from ANY initial condition)

Why is *global* stability important for this project's defense guarantees?

```
Your answer:


```

**Q4: Radial Unboundedness**
What does V(x) -> infinity as ||x|| -> infinity mean? Why is this condition needed for *global* (not just local) stability?

```
Your answer:


```

---

## 3.2 Existence & Uniqueness of Steady States

### Concept Check

**Q5: Equilibrium Analysis**
At a steady state, x(k+1) = x(k), so the change is zero. Write the equilibrium condition from the tracking equation:
(x(k+1) - x(k)) / tau = h(x) * S(x) = 0

What are the two ways this product can equal zero? Which corresponds to the correct steady state?

```
Your answer:


```

**Q6: Why Uniqueness Matters**
Suppose the system had multiple steady states. Explain in your own words why this would be problematic for:
(a) Normal operation (tracking a reference)
(b) Operation under adversarial attack

```
Your answer:


```

**Q7: Connecting to Defense**
If an adversary perturbs the system, the steady state analysis guarantees the system will still converge to the *correct* steady state (not a false one). Explain why having a unique steady state is the foundation of the defense mechanism.

```
Your answer:


```

---

## 3.3 Finite-Time Convergence

### Concept Check

**Q8: Lemma 2 Statement**
State Lemma 2 in your own words: trajectories converge to a delta-neighborhood of the steady state in at most m steps, where m <= (x(1) - delta) / sigma + 1, and sigma = tau * h(delta).

What do each of these quantities represent?
- delta: ?
- sigma: ?
- m: ?

```
Your answer:


```

**Q9: Convergence Bound Derivation**
The proof uses W(x(m)) <= W(x(1)) - sigma * (m-1). Explain the logic:
- Why does W decrease by at least sigma each step?
- How does setting W(x(m)) >= 0 give you the upper bound on m?

```
Your answer:


```

**Q10: Invariant Set Property**
Once the trajectory enters the delta-neighborhood, it stays there (the set Phi is invariant). Why is this property important? What would happen without it?

```
Your answer:


```

---

## 3.4 Sliding Mode Analysis

### Concept Check

**Q11: Sliding Mode Conditions**
State the two sliding mode conditions:
- delta_x(k) > 0 when x(k) -> -0
- delta_x(k) < 0 when x(k) -> +0

Draw a simple diagram or describe in words what this means: the trajectory oscillates around x = 0.

```
Your answer:


```

**Q12: Chattering Phenomenon**
What is chattering? Why does it occur in discrete-time systems with signum switching? Is chattering a problem or a feature in this context?

```
Your answer:


```

**Q13: Full Stability Story**
Put it all together. Trace the complete stability narrative:
1. System starts at arbitrary initial condition x(0)
2. [What happens next? Fill in each phase until steady state]

```
Your answer:


```

---

## Self-Assessment Checklist

- [ ] I can state Lyapunov's second method and verify a candidate function
- [ ] I can explain global asymptotic stability and radial unboundedness
- [ ] I can derive the equilibrium condition and explain uniqueness
- [ ] I can state the finite-time convergence bound and explain the proof logic
- [ ] I can describe sliding mode behavior and chattering
- [ ] I can tell the complete stability story from initial condition to steady state

---

## Notes / Questions for Professor Tymoshchuk

```
Write any questions or confusions here:


```
