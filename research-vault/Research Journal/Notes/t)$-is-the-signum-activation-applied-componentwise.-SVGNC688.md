---
tags: []
parent: ""
collections:
    - Notes
$version: 15
$libraryID: 1
$itemKey: SVGNC688

---
t)\$ is the **signum activation** applied componentwise.

*   $\beta$is a **diagonal gain matrix** whose diagonal entries are called **learning-rate parameters** in the paper. 

So, $\beta$ is not a "matrix you learn" via backprop; it is a **designed (chosen) set of per-state step sizes** that determines how aggressively the controller drives each error component toward zero.

***

## **Why** $\beta$ **is diagonal (not full)**

Because the update is intended to be **coordinatewise**:

$e_i(k+1) e_i(k)-\beta_i\,\mathrm{sgn} e_i(k))$

*   Each state/error channel$e_i$gets its **own** gain$\beta_i$.
*   No cross-coupling is introduced at the error-update level (which helps keep the analysis and implementation simple and predictable—important for your “moderate complexity” goal). 

***

## **What** $\beta$ 

## **does**

##  **mathematically (first-principles view)**

### **1) Sets the** 

### **per-step decrease**

###  **in** $|e_i|$

If $e_i(k)$>0, then \mathrm{sgn} $e_i(k)$)=+1 and:

e\_i(k+1) e\_i(k)$-$\beta\_i\$

If $e_i(k)$<0, then:

e\_i(k+1) $e_i(k)$+$\beta_i$

So $|e_i|$ shrinks by approximately $\beta_i$ each step until you reach a small neighborhood of 0.

### **2) Controls** 

### **finite-step convergence speed**

Ignoring the reference-change term for a moment, a crude step bound is: $N_i \approx \left\lceil \frac{|e_i(1)|}{\beta_i} \right\rceil$ Larger $\beta_i$ → fewer steps (faster convergence). Smaller $\beta_i$ → more steps (slower convergence).

### **3) Sets the size of the** 

### **steady “dither” band**

###  **(discrete-time sliding/chattering)**

Because this is discrete-time with a sign nonlinearity, you typically don’t get perfect settling at exactly 0; you get a small oscillation band whose scale is governed by $\beta_i$. Bigger $\beta_i$ generally means a larger residual band/oscillation amplitude near zero (unless you add a deadzone or smoothing).

This matches the paper’s point that **convergence time is changed by varying the learning rate parameter**. 

***

## **In** 

## **your**

##  **project context (defending tracking control under adversarial attacks)**

Your project’s core aim is to analyze and simulate a **defended tracking-control NN** for known affine discrete-time nonlinear systems under attacks. 

In that context, \beta is one of the **main tuning knobs** that trades off:

*   **Responsiveness** (how quickly you “correct” tracking error),
*   vs.
*   **Attack/noise sensitivity** (how strongly injected disturbances in$x(k)$or$r(k)$immediately drive the sign-based update),
*   vs.
*   **Implementation robustness** (larger steps can amplify quantization effects / induce chattering).

### **Practical “defense-relevant” interpretation**

*   If an attacker injects spikes/perturbations into measured state or reference, the sign term can flip rapidly.
*   A **large**$\beta_i$makes those flips produce **large control corrections** (potentially amplifying the attacker’s effect).
*   A **smaller**$\beta_i$limits the per-step correction magnitude, which can act like a **rate limiter** on the error dynamics—often desirable under adversarial perturbations.

Because \beta is **diagonal**, you can also do **channel-wise hardening**:

*   Reduce$\beta_i$on channels you believe are more exposed (e.g., compromised sensors),
*   Keep larger$\beta_j$on trusted channels to preserve performance.

***

## **One-sentence summary**

\beta=\mathrm{diag}(\beta\_1,\dots,\beta\_n) is the **per-state learning-rate/gain matrix** in the variable-structure tracking-error update e(k+1)=e(k)-\beta,\mathrm{sgn}(e(k)), and it directly sets the **speed**, **residual band**, and **attack/noise sensitivity** of the discrete-time tracking convergence.
