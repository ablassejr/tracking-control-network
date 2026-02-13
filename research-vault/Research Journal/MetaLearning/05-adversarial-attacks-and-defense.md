# Metalearning Step 5: Adversarial Attacks & Defense

> **Purpose:** Demonstrate understanding of threats to control systems and how the tracking control NN defends against them. This is the core novelty of the project.
>
> **When complete:** You can explain what adversarial attacks do to a control system, why this NN architecture is inherently robust, and how the defense connects to the stability proofs.

---

## 5.1 Types of Adversarial Attacks

### Concept Check

**Q1: Spoofing Attacks**
Define a spoofing attack in the context of a control system. Give a concrete example: if the tracking control NN is controlling vehicle speed (ACC), what would a spoofing attack look like?

```
Your answer:


```

**Q2: Denial of Service (DoS)**
Define a DoS attack in the control context. How does it differ from spoofing? What is the effect on the controller if legitimate sensor data is blocked?

```
Your answer:


```

**Q3: Attack Modeling**
In mathematical terms, how does the paper model an adversarial attack? Is it:
(a) Additive noise on the state: x_measured(k) = x(k) + delta(k)
(b) Corruption of the control input: u_actual(k) = u(k) + delta(k)
(c) Something else?

Explain how the attack enters the system equations.

```
Your answer:


```

---

## 5.2 Defense Mechanisms

### Concept Check

**Q4: Robustness to Disturbances**
The paper shows the controller works correctly if nonlinearity disturbances are bounded:
- Signum disturbance: 0 <= rho < 1
- Function h disturbance: bounded by sqrt(f^2 + R^(-1) Q g^2)

In your own words, explain what "bounded disturbance" means and why there are limits to what the defense can handle.

```
Your answer:


```

**Q5: Why This Architecture Defends**
The key claim: the tracking control NN maintains correct tracking DESPITE adversarial perturbations, as long as they are bounded. Trace the logic:
1. Attack perturbs the system state
2. Stability proof guarantees... [fill in]
3. Uniqueness of steady state means... [fill in]
4. Finite-time convergence ensures... [fill in]

```
Your answer:


```

**Q6: Estimation-Based Defense**
The project mentions using Kalman filters or observers to estimate the true state. Explain the basic idea: if the attacker corrupts the sensor reading, how can you estimate the actual state?

```
Your answer:


```

**Q7: Integration with IDS**
An Intrusion Detection System (IDS) can trigger defense mechanisms. Describe how an IDS might work alongside the tracking control NN:
- What does the IDS detect?
- What action does it trigger?
- How does this complement the NN's inherent robustness?

```
Your answer:


```

---

## 5.3 CAN Bus & Vehicle Networks

### Concept Check

**Q8: CAN Protocol Basics**
Explain the basic properties of the CAN (Controller Area Network) bus:
- How do ECUs communicate?
- Why is the broadcast nature of CAN a vulnerability?
- What authentication/encryption does CAN have?

```
Your answer:


```

**Q9: Motivating the Defense**
Connect CAN bus vulnerabilities to the need for defended tracking control:
- ECUs communicate sensor data (speed, distance) over CAN
- An attacker on the CAN bus can... [fill in]
- This means the tracking controller receives... [fill in]
- The defense mechanism ensures... [fill in]

```
Your answer:


```

---

## 5.4 The Big Picture

### Synthesis Question

**Q10: End-to-End Defense Story**
Write a one-paragraph narrative that connects all of Step 5:
Start with the threat (CAN bus vulnerability), describe the attack type, explain how it affects the control system, and show how the tracking control NN's theoretical properties (stability, uniqueness, convergence) provide defense.

```
Your answer:


```

---

## Self-Assessment Checklist

- [ ] I can describe spoofing and DoS attacks in a control system context
- [ ] I can explain how attacks are modeled mathematically in the paper
- [ ] I can state the robustness bounds (when the defense works and when it fails)
- [ ] I can trace the defense logic through stability -> uniqueness -> convergence
- [ ] I can explain CAN bus vulnerabilities and why they motivate this research
- [ ] I can tell the end-to-end defense story in one coherent narrative

---

## Notes / Questions for Professor Tymoshchuk

```
Write any questions or confusions here:


```
