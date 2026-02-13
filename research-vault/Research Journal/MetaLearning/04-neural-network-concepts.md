# Metalearning Step 4: Neural Network Concepts

> **Purpose:** Demonstrate understanding of the NN structure used for tracking control. This is NOT a deep learning NN - it is a control-theoretic neural network with specific architectural components.
>
> **When complete:** You can describe every component of the functional block diagram and explain why the architecture is called a "neural network."

---

## 4.1 Basic NN Architecture

### Concept Check

**Q1: Not Deep Learning**
This tracking control NN is fundamentally different from a deep learning neural network. Explain:
- In what sense is it called a "neural network"?
- What plays the role of activation functions?
- What plays the role of weights/learning?
- What acts as the "teacher" signal (supervised learning interpretation)?

```
Your answer:


```

**Q2: Signum Activation Function**
Write the definition of the signum function:
sgn(e) = { ? if e > 0; ? if e = 0; ? if e < 0 }

How does this create "variable structure" behavior? Compare it to smooth activation functions (sigmoid, ReLU) used in deep learning.

```
Your answer:


```

**Q3: Learning Rate Parameter beta**
The parameter beta controls convergence speed. Explain:
- What happens if beta is too large?
- What happens if beta is too small?
- How is this analogous to learning rate in gradient descent?

```
Your answer:


```

**Q4: Supervised Learning Interpretation**
The reference trajectory r(k) acts as the "teacher signal." Explain how the tracking control loop mirrors supervised learning:
- Training data = ?
- Prediction = ?
- Error signal = ?
- Update rule = ?

```
Your answer:


```

---

## 4.2 Functional Block Diagram (Fig. 1)

### Concept Check

**Q5: Component Inventory**
The block diagram contains:
- 3n adders
- n controlled switches (signum)
- n amplifiers (beta)
- n digital differentiators (delta)
- n blocks for f(x)
- n x m blocks for g(x)
- n NN solvers (LAESS)

For a system with n=2 states and m=1 input, calculate the total number of each component.

```
Your answer:


```

**Q6: Key Components**
Match each component to its mathematical function:
| Component | Symbol | What it computes |
|-----------|--------|-----------------|
| Adder (+) | | |
| Sign (S) | | |
| Amplifier (beta) | | |
| Differentiator (delta) | | |

```
Your answer:


```

**Q7: LAESS - Linear Algebraic Equation Solver**
The LAESS solves for u(k) from the control equation. Explain:
- What equation does it solve?
- Why can it be implemented as a sub-network?
- What inputs does it need and what output does it produce?

```
Your answer:


```

**Q8: Signal Flow**
Trace the signal flow through the block diagram for one time step:
1. Input: current state x(k) and reference r(k)
2. [Fill in each processing step]
3. Output: next state x(k+1)

```
Your answer:


```

**Q9: Draw Your Own**
In the space below, sketch (or describe in text) a simplified version of the block diagram for n=1, m=1. Label every block and connection.

```
Your sketch/description:


```

---

## Self-Assessment Checklist

- [ ] I can explain why this is called a "neural network" despite not being deep learning
- [ ] I can define the signum activation function and explain its variable structure effect
- [ ] I can explain the role of beta as a learning rate parameter
- [ ] I can list all components in the functional block diagram
- [ ] I can trace signal flow through the block diagram for one time step
- [ ] I can explain the LAESS sub-network and its purpose
- [ ] I can draw a simplified block diagram for a scalar system

---

## Notes / Questions for Professor Tymoshchuk

```
Write any questions or confusions here:


```
