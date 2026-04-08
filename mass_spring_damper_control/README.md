# Mass-Spring-Damper Control System

## 📌 Problem

The mass-spring-damper system is a second-order dynamic system that exhibits oscillatory behavior and sensitivity to disturbances.

This project aims to:
- Analyze system dynamics  
- Improve stability  
- Reduce overshoot  
- Achieve faster settling  
- Handle disturbances effectively  

using multiple control strategies.

---

## 🧠 System Overview

The system is governed by:

m x'' + c x' + k x = F(t)

Where:
- m → mass  
- c → damping coefficient  
- k → spring constant  

The plant is modeled as a transfer function and reused across all control strategies.

---

## 🧩 System Architecture

All simulations use a common plant model:

`model/plant_definition.m`

This file defines:
- System parameters (m, c, k)  
- Transfer function G(s)

### 🔁 Modular Design

Each control method:
1. Loads the plant model  
2. Designs its own controller  
3. Simulates system response  

Example (MATLAB):
```matlab
run('../model/plant_definition.m');
```

---

## 📂 Project Structure

```
mass_spring_damper_control/

├── model/
├── System_implementation/
├── State_space_analysis/
├── State_feedback_control/
├── Pole_placement/
├── results/
```

👉 Each folder represents a different control strategy.

---

## 📷 Results & Analysis

### 🔹 Open Loop Response

<p align="center">
  <img src="System_implementation/results/Controller_PID_implement/OpenLoop_dis_0.5.png" width="600">
</p>

- Overshoot ≈ 30%  
- Oscillatory response  
- Slow settling time  

👉 The system is underdamped.

---

### 🔹 Closed Loop (PID Control)

<p align="center">
  <img src="System_implementation/results/Controller_PID_implement/ClosedLoop_PID_dis_0.5.png" width="600">
</p>

- Reduced oscillations  
- Faster settling time  
- Handles disturbance effectively  

👉 Feedback stabilizes the system.

---

### 🔹 Pole Placement Control

<p align="center">
  <img src="Pole_placement/result/pole_placement.jpg" width="600">
</p>

- Controlled overshoot  
- Faster response  

👉 Poles determine system behavior.

---

### 🔹 State Feedback Control

<p align="center">
  <img src="State_feedback_control/result/state_feedback_Effect.jpg" width="600">
</p>

- Improved stability  
- Better response  

👉 Full-state feedback enables precise control.

---

## 📊 Comparison

| Method          | Stability | Speed | Overshoot | Disturbance |
|----------------|----------|------|----------|-------------|
| Open Loop      | Poor     | Slow | High     | None        |
| PID            | Good     | Fast | Low      | Good        |
| Pole Placement | Good     | Fast | Medium   | Moderate    |
| State Feedback | Good     | Fast | Low      | Good        |

---

## ▶️ How to Run

1. Open MATLAB  
2. Navigate to a folder:

```matlab
cd('System_implementation')
```

3. Run:

```matlab
run('your_script_name.m')
```

---

## ⚙️ Parameter Tuning

Modify:
- m (mass)  
- c (damping)  
- k (spring)  
- Kp, Ki, Kd  

---

## 📈 Key Insights

- Open-loop is unstable  
- Feedback improves performance  
- PID is practical  
- Pole placement controls dynamics  
- State feedback gives precision  

---

## 🛠 Tools

- MATLAB  
- Control System Toolbox  

---

## 🎯 Conclusion

Control strategies transform an unstable system into a stable one.

Different methods involve trade-offs between performance and complexity.
