## 1. Problem Definition
- Objective: our objective is to analyis Mass Sprin Damper System so we are going to consider this into general form then plot the analysis with open loop and close loop then implement the controllers(P,PI,PID) analyis the response of the system  
- Active input:
Mass(m)=2, Spring (K) =4, Damper(c) = 2;
- Expected steady-state behavior:
Steady state error = 0.25

## 2. Plant Model
- Governing equation:
\[
m\ddot{x}(t) + c\dot{x}(t) + kx(t) = u(t) + d(t)
\]
Assuming zero initial conditions, the transfer function is:

\[
G(s) = \frac{1}{ms^2 + cs + k}
\]
- Transfer function:
         1
G = ---------------
    2 s^2 + 2 s + 4
## 3. Stability Check
- Open-loop poles:
  -0.5000 + 1.3229i
  -0.5000 - 1.3229i
- Stable / unstable:
