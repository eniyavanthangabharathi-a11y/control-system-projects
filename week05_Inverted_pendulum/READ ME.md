# Inverted Pendulum — Nonlinear Modeling and Feedback Control

A complete MATLAB and Simulink simulation of an inverted pendulum on a cart system, covering nonlinear mathematical modeling, linearization, state-space representation, and two feedback control designs — PID and LQR.

---

## Project Overview

The inverted pendulum is a classic benchmark problem in control engineering. A pendulum mounted on a moving cart is naturally unstable — any small disturbance causes it to fall. The goal is to design a controller that applies a horizontal force to the cart to keep the pendulum upright.

This project demonstrates the full control engineering workflow:
- Deriving equations of motion from first principles
- Linearizing the nonlinear system around the upright equilibrium
- Building a state-space model and verifying it mathematically
- Simulating the open-loop unstable response
- Designing and comparing PID and LQR controllers

---

## System Description

**Plant:** Cart-pendulum system with 4 states

| State | Symbol | Description |
|-------|--------|-------------|
| x₁ | x | Cart position (m) |
| x₂ | ẋ | Cart velocity (m/s) |
| x₃ | θ | Pendulum angle from vertical (rad) |
| x₄ | θ̇ | Pendulum angular velocity (rad/s) |

**Input:** Horizontal force F applied to cart (N)  
**Output:** Cart position x and pendulum angle θ

**System Parameters:**

| Parameter | Symbol | Value |
|-----------|--------|-------|
| Cart mass | M | 1.0 kg |
| Pendulum mass | m | 0.1 kg |
| Pendulum length | L | 0.5 m |
| Cart friction | b | 0.1 N·s/m |
| Gravity | g | 9.81 m/s² |

---

## Mathematical Modeling

### Nonlinear Equations of Motion (Newton's Laws)

**Cart (horizontal):**
```
(M + m)ẍ + bẋ + mL·θ̈·cosθ − mL·θ̇²·sinθ = F
```

**Pendulum (rotational):**
```
mL²·θ̈ − mgL·sinθ = −mL·ẍ·cosθ
```

### Linearization (Small Angle Approximation)

For |θ| < 15°: sinθ ≈ θ, cosθ ≈ 1, θ̇² ≈ 0

**Linearized Equation 1:**
```
(M + m)ẍ + bẋ + mL·θ̈ = F
```

**Linearized Equation 2:**
```
mL²·θ̈ − mgL·θ = −mL·ẍ
```

### State-Space Representation

```
ẋ = Ax + Bu
y  = Cx + Du
```

Where p = M·m·L²

```
A = [0,           1,              0,      0]
    [0,  −mL²·b/p,   m²gL²/p,       0]
    [0,           0,              0,      1]
    [0,   −mLb/p,    mgL(M+m)/p,    0]

B = [0, mL²/p, 0, −mL/p]ᵀ

C = [1, 0, 0, 0]   (measuring x and θ)
    [0, 0, 1, 0]

D = [0, 0]ᵀ
```

---

## System Verification

| Check | Result | Meaning |
|-------|--------|---------|
| Poles (eigenvalues of A) | 0, −0.09, −4.65, **+4.64** | One positive pole → unstable |
| Controllability rank | 4 | All states controllable by force F |
| Observability rank | 4 | All states observable from x and θ |

The positive pole at **+4.64** confirms the system is open-loop unstable. Any tilt grows as e^(4.64t).

---

## Simulation Results

### Phase 1 — Open Loop (No Controller)

Starting from θ₀ = 0.1 rad with zero control force:
- Pendulum angle explodes to **3000 radians in 3 seconds**
- Exponential growth driven by the +4.64 unstable pole
- Confirms the system requires active feedback control

### Phase 2 — PID Controller

**Gains:** Kp = −300, Ki = 0, Kd = −50  
**Feedback:** Pendulum angle θ only

| Metric | Value |
|--------|-------|
| Settling time | ~0.5 seconds |
| Overshoot | −0.02 rad |
| Steady state error | ~0 |
| Cart position | Drifts (not regulated) |

PID stabilizes the pendulum angle but cannot regulate cart position because it only sees θ.

### Phase 3 — LQR Controller

**Q matrix:** diag([1, 1, 100, 10]) — θ weighted 100x higher  
**R:** 1  
**Optimal gains:** K = [−1.0, −1.77, −32.95, −6.75]

| Metric | Value |
|--------|-------|
| Pendulum angle θ | Settles to 0 |
| Cart position x | Regulated to 0 |
| Control law | F = −K·[x; ẋ; θ; θ̇] |

LQR controls all 4 states simultaneously, bringing both cart position and pendulum angle to zero optimally.

---


## How to Run

1. Open MATLAB (R2021a or later recommended)
2. Run `pendulum_model.m` to load system matrices and compute LQR gains into workspace
3. Open `pendulum_openloop.slx` and run to see unstable response
4. Open `pendulum_pid.slx` and run to see PID controlled response
5. Simulation time: 5 seconds, initial condition: θ₀ = 0.1 rad

---

## Key Concepts Demonstrated

- Newton-Euler equations of motion derivation
- Small angle linearization of nonlinear systems
- State-space modeling (A, B, C, D matrices)
- Controllability and observability analysis
- Open-loop vs closed-loop simulation in Simulink
- PID controller design and tuning
- LQR optimal state feedback control
- Cost function Q and R matrix tuning

---

## Tools Used

- MATLAB — mathematical modeling, LQR design, `lqr()`, `ctrb()`, `obsv()`
- Simulink — block diagram simulation, State Space block, PID Controller block

---

## Author

**Eniyavanthangabharathi**  
Instrumentation and Control Engineering  
[GitHub Profile](https://github.com/eniyavanthangabharathi-a11y)
