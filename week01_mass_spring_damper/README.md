Week 1 – Mass–Spring–Damper (Open Loop)

System:
Linear mass–spring–damper system modeled using second-order dynamics.

Objective:
Study open-loop response and understand the effect of damping.


Tasks:
- Derive transfer function
- Simulate step response
- Compare underdamped, critically damped, overdamped cases

Status:
Open loop model implemented and simulated 

Experiments:
Step response plotted for different damping values.

Observation: 
i)when c = 0.1 ;  
=> overshoot = 94.6% ; Response time = 0.747sec ; setteling time = 156sec;
               (Oscilatory response with high overshoot )
ii)when c = 2   
=> overshoot = 30.5% ; Response time = 0.989sec ; setteling time = 7.74sec;
                (Oscilatory response wih less overshoot, setteling time )
iii)when c = 5  
=> overshoot = 0.264% ; Response time = 1.99sec ; setteling time = 3.2sec;
                (critically damped response with less overshoot, setteling time)

note; 
Computed Damping Ratios (m = 2, k = 4):
c = 0.1 → ζ ≈ 0.018 (highly underdamped)
c = 2   → ζ ≈ 0.354 (underdamped)
c = 5   → ζ ≈ 0.884 (near-critical but underdamped)

Questions:
Why does the increasing the damping reduce oscillations but slow down system response?
       higher damping resists motion, reducing acceleration and slowing the system’s ability to 
reach the final value. This creates a trade-off between oscillation suppression and speed of response.

The behavior is governed by the damping ratio:
ζ = c / (2√(mk))

Low ζ → underdamped (oscillatory, high overshoot)
ζ = 1 → critically damped (fastest non-oscillatory response)
ζ > 1 → overdamped (no oscillations but slower response)
