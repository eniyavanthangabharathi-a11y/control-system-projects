# Week 01 – Mass Spring Damper System

## Objective
Analyze steady-state behavior and disturbance rejection of a mass–spring–damper system using P and PI controllers.

---

## Plant Model

### Governing equation
\[
m\ddot{x}(t) + c\dot{x}(t) + kx(t) = u(t) + d(t)
\]

### Transfer function
\[
G(s) = \frac{1}{ms^2 + cs + k}
\]

For \( m = 2 \), \( c = 2 \), \( k = 4 \):

\[
G(s) = \frac{1}{2s^2 + 2s + 4}
\]

---

## Stability Check
- Open-loop poles:
\[
s = -0.5 \pm 1.3229j
\]
- System is stable (poles in left half-plane)

---

## Open-Loop Steady State
- DC gain:
\[
G(0) = \frac{1}{4} = 0.25
\]
- With disturbance \( d = 0.5 \):
\[
y_{ss} = 0.125
\]

---

## P Controller
- Reduces steady-state error
- Cannot eliminate disturbance offset
- Faster response, nonzero steady-state error

---

## PI Controller
- Integral action eliminates steady-state error
- Improved disturbance rejection
- Slower transient response

---

## Key Observations
- DC gain determines steady-state response
- P control reduces but does not eliminate error
- PI control achieves zero steady-state error for constant disturbance

---

## Conclusion
Steady-state behavior is governed by DC gain and system type.
Integral action is required for complete disturbance rejection.
