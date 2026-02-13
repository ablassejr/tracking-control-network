# Metalearning Step 2: Control Theory Fundamentals

> **Purpose:** Demonstrate understanding of the control systems concepts specific to this project - discrete-time dynamics, affine nonlinear systems, tracking control, and optimal control via HJB.
>
> **When complete:** You can explain the full control pipeline from system model to optimal control law, and why each design choice was made.

---

## 2.1 Discrete-Time Dynamic Systems

### Concept Check

**Q1: State-Space Representation**
Write the paper's system model x(k+1) = x(k) + tau[f(x(k)) + g(x(k))u(k)] and identify each term:
- What is x(k) and what does it represent physically?
- What is u(k) and what does it represent?
- What is the difference between f(x) and g(x)?
- What is tau?

```
Your answer:


```

**Q2: Time Step Selection**
The paper requires 0 < tau < 2|x(k)| / h(x(k)) for stability. Explain in your own words why tau cannot be arbitrary. What happens physically if tau is too large? What happens if tau is too small?

```
Your answer:


```

**Q3: Worked Example**
Consider a scalar system (n=1) with f(x) = -x, g(x) = 1, tau = 0.1. Starting from x(0) = 5 with constant input u(k) = 0, compute x(1), x(2), x(3). Is the state converging?

```
Your answer:


```

---

## 2.2 Affine Nonlinear Systems

### Concept Check

**Q4: Affine-in-the-Input**
The continuous-time form is dx/dt = f(x) + g(x)u. Explain precisely what "affine in the input" means. Why is the control input u appearing *linearly* important for solving the control problem, even though f(x) and g(x) can be arbitrarily nonlinear?

```
Your answer:


```

**Q5: Affine vs Linear**
Distinguish between:
- A **linear** system: dx/dt = Ax + Bu
- An **affine** system: dx/dt = f(x) + g(x)u
- A general **nonlinear** system: dx/dt = F(x, u)

Why can't the paper's methods apply to the general nonlinear case?

```
Your answer:


```

**Q6: Controllability**
The paper requires g(x) != 0. Explain what would happen if g(x) = 0 for some state x. Why would the system be "uncontrollable" at that point?

```
Your answer:


```

---

## 2.3 Tracking Control Problem

### Concept Check

**Q7: Tracking Error**
Define the tracking error e(k) = x(k) - r(k). In the ACC (Adaptive Cruise Control) context, what does x(k) represent and what does r(k) represent? What does e(k) = 0 mean physically?

```
Your answer:


```

**Q8: Control Law Derivation**
The paper derives the control law:
u(k) = g^(-1)(x(k)) * [-beta * sgn(x(k) - r(k)) + delta_r(k) - f(x(k))]

Break this equation apart term by term:
- What does g^(-1)(x(k)) do?
- What does -beta * sgn(x(k) - r(k)) do?
- What does delta_r(k) contribute?
- What does -f(x(k)) accomplish?

```
Your answer:


```

**Q9: Closed-Loop Tracking Equation**
Substituting the control law into the system model yields the tracking equation:
x(k+1) = x(k) - beta * sgn(x(k) - r(k)) + delta_r(k)

Verify this by substituting u(k) into x(k+1) = x(k) + tau[f(x(k)) + g(x(k))u(k)] step by step.

```
Your answer:


```

---

## 2.4 Optimal Control & HJB Equation

### Concept Check

**Q10: Value Function**
Define the value function V(x) in optimal control. What does it represent? Why is it useful?

```
Your answer:


```

**Q11: HJB Equation**
Write out the HJB equation:
Q(x) + V_x^T f(x) - (1/4) V_x^T g(x) R^(-1) g^T(x) V_x = 0

Identify the role of each term:
- Q(x): ?
- V_x^T f(x): ?
- The last term: ?

```
Your answer:


```

**Q12: Analytical vs Numerical**
The paper claims to derive an *analytical* solution to the HJB equation. Why is this significant? What do most other approaches do instead, and what are the downsides?

```
Your answer:


```

---

## Self-Assessment Checklist

- [ ] I can write and interpret the discrete-time system model equation
- [ ] I can explain why the system is "affine in the input" and why that matters
- [ ] I can define tracking error and explain the tracking control objective
- [ ] I can break down the control law u(k) term by term
- [ ] I can derive the closed-loop tracking equation by substitution
- [ ] I can state the HJB equation and explain each term's role
- [ ] I can explain why an analytical HJB solution is a significant contribution

---

## Notes / Questions for Professor Tymoshchuk

```
Write any questions or confusions here:


```
