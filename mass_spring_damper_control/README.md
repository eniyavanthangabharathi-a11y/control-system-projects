# Mass-Spring-Damper Control System

## 📌 Problem

Design and analyze control strategies for a mass-spring-damper system.

---

## 🧠 Approaches Implemented

### 1. State Space Analysis

* System modeled in state-space form
* Studied system dynamics and stability

### 2. State Feedback Control

* Designed controller using feedback
* Improved stability and response

### 3. Pole Placement Control

* Adjusted system poles to control response
* Reduced overshoot and settling time

---

## 📊 Results Comparison

| Method         | Stability | Response Speed | Overshoot |
| -------------- | --------- | -------------- | --------- |
| Open Loop      | Poor      | Slow           | High      |
| State Feedback | Good      | Faster         | Medium    |
| Pole Placement | Best      | Fast           | Low       |

---

## 📈 Key Insight

Feedback control significantly improves system stability and performance.
Different methods provide trade-offs between speed, accuracy, and control effort.

---
## 📷 Results & Analysis

### 🔹 Open Loop Response
<img src="System_implementation/results/Controller_PID_implement/OpenLoop_dis_0.5.png" width="600">

- Overshoot ≈ 30%  
- Oscillatory response  
- Slow settling time  

👉 The system is underdamped and unsuitable for controlled applications.

---

### 🔹 Closed Loop (PID Control)
<img src="System_implementation/results/Controller_PID_implement/ClosedLoop_PID_dis_0.5.png" width="600">

- Reduced oscillations  
- Faster settling time  
- Handles disturbance effectively  

👉 Feedback control stabilizes the system and improves disturbance rejection.

---

### 🔹 Pole Placement Control
<img src="Pole_placement/result/pole_placement.jpg" width="600">

- Controlled overshoot  
- Faster response compared to open loop  

👉 System poles directly influence transient response characteristics.

---

### 🔹 State Feedback Control
<img src="State_feedback_control/result/state_feedback_Effect.jpg" width="600">

- Improved stability  
- Better dynamic response  

👉 Full-state feedback allows precise shaping of system behavior.
---

## 🛠 Tools Used

* MATLAB
* Control System Toolbox

---

## 🎯 Conclusion

This project demonstrates how different control strategies affect system behavior and how to choose appropriate methods based on system requirements.

