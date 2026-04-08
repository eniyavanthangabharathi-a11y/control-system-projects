# Mass-Spring-Damper Control System

## 📌 Problem

The mass-spring-damper system exhibits oscillatory behavior and is sensitive to disturbances.  
The objective is to improve stability, reduce overshoot, and achieve faster settling using control strategies.

---

## 🧠 System Overview

The system is modeled using differential equations and analyzed using multiple control techniques to observe changes in system dynamics.

---

## 📷 Results & Analysis

### 🔹 Open Loop Response

<p align="center">
  <img src="System_implementation/results/Controller_PID_implement/OpenLoop_dis_0.5.png" width="600">
</p>

- Overshoot ≈ 30%  
- Oscillatory response  
- Slow settling time  

👉 The system is underdamped and unsuitable for controlled applications.

---

### 🔹 Closed Loop (PID Control)

<p align="center">
  <img src="System_implementation/results/Controller_PID_implement/ClosedLoop_PID_dis_0.5.png" width="600">
</p>

- Reduced oscillations  
- Faster settling time  
- Handles disturbance effectively  

👉 Feedback control stabilizes the system and improves disturbance rejection.

---

### 🔹 Pole Placement Control

<p align="center">
  <img src="Pole_placement/result/pole_placement.jpg" width="600">
</p>

- Controlled overshoot  
- Faster response compared to open loop  

👉 System poles directly influence transient response characteristics.

---

### 🔹 State Feedback Control

<p align="center">
  <img src="State_feedback_control/result/state_feedback_Effect.jpg" width="600">
</p>

- Improved stability  
- Better dynamic response  

👉 Full-state feedback allows precise shaping of system behavior.

---

## 📊 Comparison Summary

| Method            | Stability | Response Speed | Overshoot | Disturbance Handling |
|------------------|----------|---------------|-----------|----------------------|
| Open Loop        | Poor     | Slow          | High      | None                 |
| PID Control      | Good     | Faster        | Low       | Good                 |
| Pole Placement   | Good     | Fast          | Medium    | Moderate             |
| State Feedback   | Good     | Fast          | Low       | Good                 |

---

## 📈 Key Engineering Insights

- Open-loop systems are highly sensitive to disturbances and lack stability  
- Feedback significantly improves system performance and robustness  
- PID control is effective for practical implementation  
- Pole placement provides direct control over system dynamics  
- State feedback enables precise tuning but requires full system states  

---

## 🛠 Tools Used

- MATLAB  
- Control System Toolbox  

---

## 🎯 Conclusion

Feedback control transforms an oscillatory system into a stable and controllable one.  
Different control strategies provide trade-offs between performance, complexity, and implementation requirements.

Choosing the right method depends on system constraints and desired performance.
