---
tags: []
parent: ""
collections:
    - Notes
$version: 15
$libraryID: 1
$itemKey: B9HDRL6S

---
GD, C\&W, DeepFool) and **physical/digital spoofing attacks** target fundamentally different surfaces. Physical spoofing corrupts the *input signal* to a controller; gradient-based attacks corrupt the *internal processing* of a neural network controller. Both can falsify speed-dependent control actions, but through different mechanisms and with different defense requirements.

***

## 1. Speed Measurement Spoofing Vectors

### 1.1 Radar Spoofing (FMCW)

**Attack Category:** Sensor Spoofing (Section 2.2.1 of reference document)

**Mechanism:** A rogue FMCW radar transmitter injects signals synchronized to the victim radar's chirp timing, creating phantom measurements of distance and velocity that are coherent with physics.

**Key Papers:**

| Paper                                                    | Year  | Source             | Relevance |
| -------------------------------------------------------- | ----- | ------------------ | --------- |
| Spoofing Attacks Against Vehicular FMCW Radar            | 2021  | arXiv 2104.13318   | 5/5       |
| Explaining RADAR Features for Detecting Spoofing in CAVs | 2022  | arXiv 2203.00150   | 5/5       |
| Overview of Sensing Attacks on Autonomous Vehicles       | 2024  | arXiv 2401.15193   | 5/5       |
| mmSpoof: Resilient Spoofing of Automotive mmWave         | ~2023 | UCSD/Academic      | 4/5       |
| MadRadar (Duke University)                               | 2023  | Duke News/Academic | 4/5       |


**Key Findings:**

*   Single rogue radar can spoof distance AND velocity simultaneously, presenting phantom measurements coherent with physics laws (arXiv 2104.13318)
*   Demonstrated on Tesla Model S: created "ghost vehicles" disrupting distance measurement (arXiv 2401.15193)
*   Microsecond-precision synchronization required -- signals even 1 microsecond off misplace the fake datapoint by \~100m
*   More dangerous than jamming because harder to detect
*   Can cause emergency stops or abrupt acceleration

**Hardware Required:** Rogue FMCW radar transmitter with microsecond synchronization capability

**Mapping to Reference Document:**

*   Directly maps to **Sensor Spoofing** (Section 2.2.1):  $y_{compromised}(k) = y_{true}(k) + a_s(k)$

*   The spoofing signal  $a_s(k)$  represents the phantom velocity/distance offset

*   ACC context from reference document Section 4.2 directly applies: "Speed spoofing: Attacker modifies perceived lead vehicle speed"

***

### 1.2 LiDAR Spoofing

**Attack Category:** Sensor Spoofing (Section 2.2.1 of reference document)

**Mechanism:** Malicious laser emitters overwrite legitimate LiDAR sensing pulses, injecting false distance measurements that propagate to speed calculations via $\dot{d}_{rel} = v_{lead} - v_{ego}$.

**Key Papers:**

| Paper                                                            | Year | Source           | Relevance |
| ---------------------------------------------------------------- | ---- | ---------------- | --------- |
| On the Realism of LiDAR Spoofing at High Speed and Long Distance | 2025 | NDSS Symposium   | 5/5       |
| Adversarial Sensor Attack on LiDAR-based Perception              | 2019 | arXiv 1907.06826 | 4/5       |


**Key Findings:**

*   Attacks effective at 60 km/h from 110 meters (NDSS 2025)

*   Object removal attacks:  $\geq 96\%$  success rate

*   Adversarial device captures, alters, and re-emits LiDAR signals with controlled delay

*   Manipulates 3D point cloud measurements used for distance/speed estimation

*   Adaptive high-frequency removal (A-HFR) defeats pulse fingerprinting defenses

**Hardware Required:** Malicious laser emitters with adaptive timing control

**Mapping to Reference Document:**

*   Maps to **Sensor Spoofing** (Section 2.2.1): false distance measurements affect speed derivation

*   ACC context: "Distance injection: False radar/lidar distance measurements" (Section 4.2)

*   Speed is indirectly spoofed via corrupted  $\dot{d}_{rel}$  calculation

***

### 1.3 GPS Spoofing

**Attack Category:** False Data Injection (Section 2.2.3 of reference document)

**Mechanism:** Fake GPS signals replicate authentic signal structure (BPSK-PRN/BOC-PRN) with fabricated coordinates, exploiting the fact that civilian GPS is neither encrypted nor authenticated.

**Key Papers:**

| Paper                                         | Year | Source             | Relevance |
| --------------------------------------------- | ---- | ------------------ | --------- |
| GPS-IDS: Anomaly-based GPS Spoofing Detection | 2024 | arXiv 2405.08359v2 | 5/5       |
| GPS Spoofing Detection Using Adaptive DBSCAN  | 2025 | arXiv 2510.10766   | 4/5       |
| Transport Safety: GNSS Spoofing Detection     | 2022 | ScienceDirect      | 4/5       |


**Key Findings:**

*   Three attack subtypes targeting speed:

    1.  **Speed attacks:** Intentionally change GPS-derived speed, causing incorrect turn radius calculations

    2.  **Stealth attacks:** Incremental positional bias ( $\Delta p$  per timestep) that stays within normal GPS error margins

    3.  **Timing attacks:** Relay actual position delayed by seconds, causing stale speed estimates

*   Spoofed PID control:  $u_{spf}(t) = K_p \cdot e_{spf}(t) + K_i \int e_{spf}(t) dt + K_d \cdot \dot{e}_{spf}(t)$

*   Even without knowledge of control system, spoofing compromises closed-loop stability via persistent reference trajectory corruption

*   Detection via cross-validation between GPS and vehicle speedometer (DNN-based)

**Hardware Required:** Software Defined Radio (SDR), GPS signal generator/simulator

**Mapping to Reference Document:**

*   Maps to **FDI** (Section 2.2.3):  $y_{attacked}(k) = Cx(k) + f(k)$  where  $f(k)$  is the GPS spoofing signal

*   Stealth attacks parallel the "incipient" FDI type: gradual bias growth  $0.2(1 - e^{-0.5t})$

*   Timing attacks parallel **Replay Attacks** (Section 2.2.4):  $y_{replayed}(k) = y_{recorded}(k - \Delta)$

***

### 1.4 CAN Bus Speed Sensor Injection

**Attack Category:** False Data Injection + Actuator Injection (Sections 2.2.3 and 2.2.2 of reference document)

**Mechanism:** Attacker injects fabricated CAN frames containing false speed data, exploiting the protocol's lack of authentication, encryption, and source addressing. CAN was designed in the 1980s without cybersecurity considerations.

**Key Papers & Sources:**

| Paper                                                          | Year | Source                    | Relevance |
| -------------------------------------------------------------- | ---- | ------------------------- | --------- |
| CAN Injection: Keyless Car Theft (Dr. Ken Tindell)             | 2023 | Technical blog            | 5/5       |
| CANAttack: Assessing CAN Vulnerabilities                       | 2023 | PMC                       | 5/5       |
| Detection of Message Injection Using Successive Message Graphs | 2021 | IEEE TIFS                 | 4/5       |
| CAN-MIRGU: Comprehensive CAN Bus Attack                        | 2024 | NDSS VehicleSec           | 4/5       |
| Securing CAN Bus Using Deep Learning                           | 2025 | Nature Scientific Reports | 4/5       |


**Key Findings:**

*   **Real-world thefts documented:** Toyota RAV4 and Land Cruiser stolen using CAN injection (2023)

*   Device cost: \~\$10 (PIC18F microcontroller + CAN transceiver)

*   "Dominant-override" circuit prevents legitimate ECUs from transmitting

*   Attacker must send messages at  $\geq 20\times$  normal ECU rate to override

*   Speedometer display manipulation demonstrated at DEF CON 2013 (Miller & Valasek)

*   Attack vectors: headlight connectors, OBD-II port, wireless (Bluetooth, Wi-Fi, 4G/5G)

*   Detection: 97.32% accuracy, 2.5ms detection speed for speed/RPM injection

**Hardware Required:** \~\$10 device (PIC18F + CAN transceiver), physical access via OBD-II or wiring harness

**Mapping to Reference Document:**

*   Maps to **FDI** (Section 2.2.3): false speed data injected into measurement channel

*   Also maps to **Actuator Injection** (Section 2.2.2):  $u_{actual}(k) = u_{NN}(k) + a_u(k)$  when targeting actuator ECUs

*   CAN bus dominant-override maps to **MITM** (Section 2.2.5): attacker intercepts and replaces bus messages

***

### 1.5 V2V/V2X Communication Speed Data Manipulation

**Attack Category:** MITM + FDI + Replay (Sections 2.2.3, 2.2.4, 2.2.5 of reference document)

**Mechanism:** Attacker intercepts, forges, or replays V2V/V2X messages containing speed, position, and intent data. First-generation V2X (DSRC) lacks authentication features.

**Key Papers & Sources:**

| Paper                                         | Year  | Source           | Relevance |
| --------------------------------------------- | ----- | ---------------- | --------- |
| Cybersecurity Attacks in V2I Applications     | 2017  | arXiv 1711.10651 | 4/5       |
| Security in V2I Communications: SLR           | 2022  | MDPI Sensors     | 4/5       |
| Safeguarding CAV Communication                | 2025  | arXiv 2502.04201 | 4/5       |
| V2X Technology: Inviting Cyberattacks?        | ~2024 | VicOne           | 3/5       |
| V2V Message Content Plausibility for Platoons | 2019  | PMC              | 4/5       |


**Key Findings:**

*   **Self-telemetry manipulation:** Vehicle manipulates its own telemetry (position, speed, brake status) to send misleading cooperative awareness messages
*   **Ghost node attacks:** Fake nodes on V2X network mimic plausible mobility patterns -- high risk
*   Cloud-based impersonation allows sending fraudulent speed/position data causing lane changes, speed changes, or complete stops
*   Traditional security mechanisms inadequate for high-speed vehicular network dynamics

**Attack Subtypes:**

1.  **Message forgery:** Fabricate speed data in outgoing V2V messages
2.  **Message replay:** Record and replay legitimate V2V messages with stale speed data
3.  **MITM interception:** Modify speed fields in transit between vehicles
4.  **Ghost vehicles:** Create phantom vehicles with controlled speed profiles

**Mapping to Reference Document:**

*   Directly maps to **MITM** (Section 2.2.5): CAN bus and V2V channels

*   Maps to **Replay** (Section 2.2.4):  $y_{replayed}(k) = y_{recorded}(k - \Delta)$  for V2V message replay

*   Maps to **FDI** (Section 2.2.3) for forged message content

*   ACC scenario from Section 4.2: "V2V message tampering: Alter cooperative awareness messages"

***

### 1.6 Wheel Speed Sensor (WSS) / ABS Spoofing

**Attack Category:** Sensor Spoofing (Section 2.2.1 of reference document)

**Mechanism:** Electromagnetic actuators placed near magnetic-based wheel speed sensors inject fields that cancel the true signal and substitute a malicious one. Non-invasive -- no hardware tampering required.

**Key Papers:**

| Paper                                                         | Year      | Source    | Relevance |
| ------------------------------------------------------------- | --------- | --------- | --------- |
| Non-invasive Spoofing Attacks for ABS                         | 2013/2015 | IACR/CHES | 5/5       |
| Detection and Mitigation of Sensor and CAN Bus Attacks in ABS | 2022      | ACM TCPS  | 5/5       |


**Key Findings:**

*   Thin electromagnetic actuator near ABS sensors cancels true signal and injects malicious one
*   Two attack types: **disruptive** (corrupt signal arbitrarily) and **advanced spoofing** (inject specific velocity profile)
*   Attack during braking causes loss of directional control -- life-threatening
*   Non-invasive attacks harder for intrusion detection to detect than CAN-level injection
*   First real sensor attack experiments documented showing magnet effects on sensor readings

**Hardware Required:** Electromagnetic actuator (thin, placed near sensor), strong magnets

**Mapping to Reference Document:**

*   Maps to **Sensor Spoofing** (Section 2.2.1):  $y_{compromised}(k) = y_{true}(k) + a_s(k)$

*   Physical-layer attack -- bypasses all digital defenses

*   The signal cancellation + injection is analogous to targeted FDI at the transducer level

***

### 1.7 Inertial Measurement Unit (IMU) Attacks

**Attack Category:** Sensor Spoofing (Section 2.2.1 of reference document)

**Mechanism:** IMUs (accelerometers + gyroscopes + magnetometers) estimate velocity via integration: $v = \int a \, dt$. Attacks on accelerometer/gyroscope readings propagate through integration to corrupt speed estimates.

**Key Sources:**

| Paper                                      | Year | Source                      | Relevance |
| ------------------------------------------ | ---- | --------------------------- | --------- |
| Sensor Fusion for Speed Estimation via IMU | 2020 | Frontiers in Bioengineering | 3/5       |


**Key Findings:**

*   Velocity estimated via single integration of acceleration; position via double integration
*   GNSS+IMU fusion common in navigation -- corrupting either input affects speed estimate
*   Kalman filter-based fusion means spoofed GPS can contaminate IMU-derived speed estimates

**Research Gap:** Limited direct research on adversarial IMU attacks for speed estimation. Most literature focuses on legitimate sensor fusion. Acoustic injection attacks on MEMS accelerometers have been demonstrated in other domains but not extensively studied for vehicular speed spoofing.

**Mapping to Reference Document:**

*   Would map to **Sensor Spoofing** (Section 2.2.1) for direct IMU attacks
*   GPS spoofing affecting IMU fusion maps to **FDI** propagating through the Kalman filter state estimator

***

## 2. Cross-Layer Attack Taxonomy

### 2.1 Mapping Speed Spoofing Vectors to Document Categories

| Speed Spoofing Vector | Sensor Spoofing | FDI         | Replay      | MITM        | Actuator Injection | Gradient-Based |
| --------------------- | --------------- | ----------- | ----------- | ----------- | ------------------ | -------------- |
| **Radar (FMCW)**      | **Primary**     |             |             |             |                    |                |
| **LiDAR**             | **Primary**     |             |             |             |                    |                |
| **GPS**               |                 | **Primary** | Secondary   |             |                    |                |
| **CAN Bus Injection** |                 | **Primary** | Secondary   | Secondary   | Secondary          |                |
| **V2V/V2X**           |                 | Secondary   | **Primary** | **Primary** |                    |                |
| **Wheel Speed (WSS)** | **Primary**     |             |             |             |                    |                |
| **IMU**               | **Primary**     | Secondary   |             |             |                    |                |


### 2.2 Architectural Distinction: Physical vs. Neural Network Attacks

The reference document's taxonomy spans two fundamentally different attack surfaces:

**Layer 1 -- Signal-Level Attacks (this report's focus):** Speed spoofing vectors (radar, LiDAR, GPS, CAN, V2V, WSS, IMU) corrupt the *input signals* to the control system. These map to:

*   Sensor Spoofing:  $y_{compromised}(k) = y_{true}(k) + a_s(k)$

*   FDI:  $y_{attacked}(k) = Cx(k) + f(k)$

*   Replay:  $y_{replayed}(k) = y_{recorded}(k - \Delta)$

*   MITM: interception and modification of communication channels

**Layer 2 -- Model-Level Attacks (reference document Sections 2.1.x):** Gradient-based attacks (FGSM, PGD, C\&W, DeepFool) corrupt the *internal processing* of the neural network controller. These compute adversarial perturbations: $x_{adv} = x + \epsilon \cdot \text{sign}(\nabla_x J(\theta, x, y))$

**The connection:** A speed spoofing attack at Layer 1 produces a corrupted state observation $\tilde{x}(k)$ that is then processed by the NN controller. A gradient-based attack at Layer 2 adds an optimized perturbation to $x(k)$ before the NN processes it. In both cases, the NN controller receives a falsified input -- but the perturbation structure differs:

*   **Layer 1 perturbations** are constrained by physical plausibility (coherent with dynamics)

*   **Layer 2 perturbations** are optimized to maximally degrade NN performance within an  $\epsilon$ -ball

This suggests a **combined attack model** for the research project: $\tilde{x}(k) = x(k) + a_{physical}(k) + \delta_{adversarial}(k)$ where $a_{physical}$ is the sensor spoofing component and $\delta_{adversarial}$ is the gradient-optimized component.

***

## 3. ACC-Specific Speed Spoofing Analysis

The reference document identifies ACC as the primary benchmark (Section 4.2). Here is how each spoofing vector specifically targets ACC speed measurements:

| ACC Component          | Spoofing Vector        | Attack Effect                                      | Document Category |
| ---------------------- | ---------------------- | -------------------------------------------------- | ----------------- |
| Front radar            | FMCW radar spoofing    | False lead vehicle velocity, phantom vehicles      | Sensor Spoofing   |
| Front LiDAR            | LiDAR spoofing         | False distance $\rightarrow$ false $\dot{d}_{rel}$ | Sensor Spoofing   |
| GPS receiver           | GPS spoofing           | False ego velocity, wrong trajectory               | FDI               |
| CAN bus (speed signal) | CAN injection          | False ego speed to ACC ECU                         | FDI               |
| V2V channel            | Message forgery/replay | False lead vehicle speed/intent                    | MITM + Replay     |
| Wheel speed sensors    | EM actuator spoofing   | False ego speed at physical layer                  | Sensor Spoofing   |
| NN controller input    | FGSM/PGD perturbation  | Optimized state corruption                         | Gradient-based    |


**ACC Attack Scenarios (ranked by feasibility):**

1.  **CAN bus injection** -- lowest barrier (\$10 hardware, documented real-world attacks)
2.  **GPS spoofing** -- moderate barrier (SDR equipment, no physical access needed)
3.  **V2V message forgery** -- moderate barrier (requires V2V-equipped vehicles)
4.  **Radar spoofing** -- high barrier (precision FMCW hardware, microsecond timing)
5.  **LiDAR spoofing** -- high barrier (laser equipment, scan timing knowledge)
6.  **WSS spoofing** -- high barrier (physical proximity to wheel sensors)

***

## 4. Detection & Defense Mechanisms

| Spoofing Vector | Detection Approach                         | Accuracy                  | Reference                 |
| --------------- | ------------------------------------------ | ------------------------- | ------------------------- |
| GPS             | Cross-validation GPS vs. speedometer (DNN) | F1: 94.4% real, 97.1% sim | arXiv 2405.08359v2        |
| GPS             | Adaptive DBSCAN anomaly detection          | Real-time capable         | arXiv 2510.10766          |
| CAN bus         | Deep learning IDS                          | 97.32% accuracy, 2.5ms    | Nature Sci. Reports 2025  |
| CAN bus         | Zero Trust + message authentication        | Architectural             | Dr. Ken Tindell           |
| Radar           | ML-based radar feature analysis            | Under research            | arXiv 2203.00150          |
| Radar           | High-resolution multi-reflection analysis  | Under research            | Duke MadRadar             |
| LiDAR           | Pulse fingerprinting (defeated by A-HFR)   | Limited                   | NDSS 2025                 |
| LiDAR           | Sensor fusion (camera + LiDAR + radar)     | Improved                  | Multiple                  |
| V2V             | Message plausibility checking              | Under research            | PMC 2019                  |
| WSS/ABS         | Anomalous bit error monitoring             | Under research            | ACM TCPS 2022             |
| ACC (general)   | ACCDM anomaly detection model              | LSTM: 98.1% acc           | Nature Sci. Reports 2025  |
| All             | Kalman filter residual monitoring          | Baseline                  | Reference doc Section 5.2 |


**Cross-reference with reference document:** The Kalman filter residual detection approach (Section 5.2 of reference document, PMC 12197249) applies across all spoofing vectors. The residual $r(k) = y_{observed}(k) - y_{predicted}(k)$ captures any discrepancy between expected and observed speed, regardless of whether the corruption came from radar spoofing, CAN injection, or gradient-based NN attack.

***

## 5. Real-World Incidents

| Incident                          | Year | Vector              | Impact                                         |
| --------------------------------- | ---- | ------------------- | ---------------------------------------------- |
| Toyota RAV4 & Land Cruiser theft  | 2023 | CAN bus injection   | Vehicle theft via speed/ignition spoofing      |
| Tesla Model S radar hallucination | 2023 | FMCW radar spoofing | Ghost vehicle, distance measurement disruption |
| Miller & Valasek DEF CON demo     | 2013 | CAN bus injection   | Speedometer manipulation, brake disable        |


***

## 6. Knowledge Gaps

1.  **IMU-specific adversarial attacks** for vehicular speed estimation are understudied -- most research covers legitimate sensor fusion

2.  **Combined multi-vector attacks** (e.g., simultaneous GPS + CAN spoofing) lack comprehensive analysis

3.  **Gradient-based attacks combined with physical spoofing** ( $a_{physical} + \delta_{adversarial}$ ) have not been studied for tracking control systems

4.  **Real-time detection at highway speeds** remains challenging -- most detection systems have latency issues above 100 km/h

5.  **Transferability of speed spoofing techniques** across vehicle platforms is not well characterized

6.  **C++ adversarial attack libraries** for real-time simulation remain underdeveloped (consistent with reference document Section 9, Knowledge Gap #3)

***

## 7. Recommendations for Project Integration

### Phase 2 (Noise & Disturbance Testing) additions:

*   Model GPS incremental spoofing as colored noise with drift:  $f_{GPS}(k) = f_{GPS}(k-1) + \Delta_f$

*   Model CAN injection as PRBS signal (binary on/off attack pattern)

### Phase 3 (Adversarial Attack Simulation) additions:

*   Implement radar spoofing as sensor spoofing with physics-coherent constraints

*   Implement CAN injection as FDI with bounded magnitude:  $\|f(k)\| \leq \bar{f}$

*   Implement combined attack:  $\tilde{x}(k) = x(k) + a_{physical}(k) + \delta_{FGSM}(k)$

### Phase 4 (Defense) additions:

*   Cross-sensor validation (GPS vs. WSS vs. IMU) for speed consistency checking
*   Kalman filter residual monitoring tuned per spoofing vector
*   Zero Trust CAN architecture with message authentication

***

## Sources

### Academic Papers

*   [Spoofing Attacks Against Vehicular FMCW Radar](https://arxiv.org/abs/2104.13318) (arXiv, 2021)
*   [Explaining RADAR Features for Detecting Spoofing in CAVs](https://arxiv.org/abs/2203.00150) (arXiv, 2022)
*   [Overview of Sensing Attacks on Autonomous Vehicles](https://arxiv.org/abs/2401.15193) (arXiv, 2024)
*   [On the Realism of LiDAR Spoofing at High Speed and Long Distance](https://www.ndss-symposium.org/ndss-paper/on-the-realism-of-lidar-spoofing-attacks-against-autonomous-driving-vehicle-at-high-speed-and-long-distance/) (NDSS, 2025)
*   [Adversarial Sensor Attack on LiDAR-based Perception](https://arxiv.org/abs/1907.06826) (arXiv, 2019)
*   [GPS-IDS: Anomaly-based GPS Spoofing Detection](https://arxiv.org/abs/2405.08359) (arXiv, 2024)
*   [GPS Spoofing Detection Using Adaptive DBSCAN](https://arxiv.org/abs/2510.10766) (arXiv, 2025)
*   [Transport Safety: GNSS Spoofing Detection](https://www.sciencedirect.com/science/article/pii/S1877050922012650) (ScienceDirect, 2022)
*   [Cybersecurity Attacks in V2I Applications](https://arxiv.org/abs/1711.10651) (arXiv, 2017)
*   [Security in V2I Communications: SLR](https://www.mdpi.com/journal/sensors) (MDPI Sensors, 2022)
*   [CAN Injection: Keyless Car Theft](https://kentindell.github.io/2023/04/03/can-injection/) (Dr. Ken Tindell, 2023)
*   [CANAttack: Assessing CAN Vulnerabilities](https://pmc.ncbi.nlm.nih.gov/) (PMC, 2023)
*   [Detection of Message Injection Using Successive Message Graphs](https://ieeexplore.ieee.org/) (IEEE TIFS, 2021)
*   [CAN-MIRGU: Comprehensive CAN Bus Attack](https://www.ndss-symposium.org/) (NDSS VehicleSec, 2024)
*   [Non-invasive Spoofing Attacks for ABS](https://eprint.iacr.org/2015/419) (IACR, 2013/2015)
*   [Detection and Mitigation of Sensor/CAN Attacks in ABS](https://dl.acm.org/doi/10.1145/3495534) (ACM TCPS, 2022)
*   [Improvement of ACC Resilience Against Spoofing Using IDS](https://arxiv.org/abs/2302.00876) (arXiv, 2023)
*   [ML Detection of Cyberattacks in ACC Systems](https://www.nature.com/articles/s41598-025-20096-5) (Nature Sci. Reports, 2025)
*   [SoK: Rethinking Sensor Spoofing Against Robotic Vehicles](https://ieeexplore.ieee.org/) (IEEE EuroS\&P, 2023)
*   [Adversarial Attacks on Autonomous Driving Systems](https://ieeexplore.ieee.org/) (IEEE Trans. Intelligent Vehicles, 2024)
*   [Securing CAN Bus Using Deep Learning](https://www.nature.com/articles/s41598-025-98433-x) (Nature Sci. Reports, 2025)
*   [Safeguarding Connected Autonomous Vehicle Communication](https://arxiv.org/abs/2502.04201) (arXiv, 2025)
*   [Comprehensive Review of Security Vulnerabilities in Heavy-Duty Vehicles](https://www.sciencedirect.com/science/article/pii/S0167404825001415) (Computers & Security, 2025)

### Technical Sources

*   [mmSpoof: Resilient Spoofing of Automotive Millimeter-wave](https://wcsng.ucsd.edu/files/mmspoof.pdf) (UCSD)
*   [MadRadar: Engineers Develop Hack to Make Automotive Radar Hallucinate](https://pratt.duke.edu/news/engineers-develop-hack-to-make-automotive-radar-hallucinate/) (Duke University, 2023)
*   [V2X Technology: Inviting Cyberattacks?](https://vicone.com/blog/v2x-technology-inviting-cyberattacks-while-enhancing-mobility-and-safety) (VicOne)
*   [Hacking the Modern Automobile](https://www.kaspersky.com/blog/car-hacking/2527/) (Kaspersky, reporting Miller & Valasek DEF CON)
*   [V2V Message Content Plausibility for Platoons](https://pmc.ncbi.nlm.nih.gov/articles/PMC6960649/) (PMC, 2019)
*   [CAN Bus Detection from Purdue University](https://www.cs.purdue.edu/homes/bb/mubark1.pdf) (Purdue)
