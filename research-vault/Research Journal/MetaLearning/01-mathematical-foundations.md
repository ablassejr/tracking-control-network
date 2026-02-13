# Metalearning Step 1: Mathematical Foundations

> **Purpose:** Demonstrate understanding of the core mathematics needed to understand the theoretical framework of the tracking control NN.
>
> **When complete:** You can confidently read the paper's equations and trace each step of the derivations.

---

## 1.1 Difference Equations

### Concept Check

**Q1: Basic Form & Solutions**
Write the general form of a first-order difference equation. Then, given x(k+1) = 2x(k) + 1 with x(0) = 0, solve for x(1), x(2), x(3), and x(4) by hand.

```
Your answer:


```

**Q2: Variable Structure Systems**
In your own words, explain what makes a system "variable structure." Why does the signum function sgn(e) create variable structure behavior in the tracking control NN?

```
Your answer:
A system that is of variable structure is a system that's equations change based
on other values in the system.
```

**Q3: Euler Approximation (Discretization)**
Given the continuous-time ODE dx/dt = f(x), derive the Euler approximation that produces the discrete-time form x(k+1) = x(k) + tau \* f(x(k)). What role does tau play, and what happens if tau is too large?

```
Your answer:


```

**Q4: Connecting to the Paper**
The paper's core equation is x(k+1) = x(k) + tau[f(x(k)) + g(x(k))u(k)]. Identify which part comes from the Euler approximation of a continuous-time system, and write out what the original continuous-time ODE would look like.

```
Your answer:


```

---

## 1.2 Linear Algebra

### Concept Check

**Q5: Matrix Operations**
Given A = [[2, 1], [0, 3]] and B = [[1, 0], [2, 1]], compute AB, A^T, and A^(-1). Show your work.

```
Your answer:


```

**Q6: Eigenvalues & Stability**
Compute the eigenvalues of A = [[2, 1], [0, 3]]. For a discrete-time linear system x(k+1) = Ax(k), what condition on the eigenvalues guarantees stability? Is this system stable?

```
Your answer:


```

**Q7: Diagonal Matrices**
The paper uses beta = diag(beta_1, ..., beta_n) as the learning rate parameter matrix. Explain what a diagonal matrix is, and why using a diagonal matrix for beta means each state variable has its own independent learning rate.

```
Your answer:


```

---

## 1.3 Optimization & Gradient

### Concept Check

**Q8: Gradient Descent**
Explain the gradient descent update rule delta_e = -nabla C(e) in plain language. Why does moving in the negative gradient direction minimize the cost?

```
Your answer:


```

**Q9: Cost Function Design**
The paper uses C(x) = |e| where e is the tracking error. Why is absolute value a valid cost function? What property does it have at e = 0? How does this connect to the signum function (hint: d|e|/de = sgn(e))?

```
Your answer:


```

**Q10: Convexity**
Define what it means for a cost function to be convex. Why does convexity guarantee a unique global minimum? Is C(x) = |e| convex?

```
Your answer:


```

---

## Self-Assessment Checklist

- [ ] I can solve difference equations iteratively given initial conditions
- [ ] I can explain why the signum function creates variable structure
- [ ] I can derive the Euler approximation from a continuous ODE
- [ ] I can perform basic matrix operations (multiply, transpose, inverse)
- [ ] I can compute eigenvalues and relate them to system stability
- [ ] I can explain gradient descent and why the cost function C = |e| is chosen
- [ ] I can connect all of the above to the paper's system model equation

---

## Notes / Questions for Professor Tymoshchuk

```
Write any questions or confusions here:


```
