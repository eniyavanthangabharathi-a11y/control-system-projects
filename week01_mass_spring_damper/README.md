## How to Run

1. Download or clone this repository.
2. Open MATLAB.
3. Set the Current Folder to `control-system-projects`.
4. Navigate to `week01_mass_spring_damper/Simulation`.
5. Run any `.m` file (for example: `CloseLoop_integral_distrubance.m`).

Note:
The simulation scripts automatically load the plant model from the `model` folder.

## Control Insight

When a constant disturbance is applied to the mass–spring–damper system, the closed-loop response without integral action exhibits steady-state error. Introducing integral control increases the system type and enables zero steady-state error for constant disturbances. This experiment highlights the importance of integral action in disturbance rejection for second-order control systems.
