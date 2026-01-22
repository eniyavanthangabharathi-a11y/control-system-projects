##Roll Attitude Control Interpretation

In open loop, the UAV roll angle does not naturally settle, making the system unsafe and uncontrollable for flight. State feedback stabilizes the roll motion by applying
corrective torque based on roll angle and roll rate, allowing the UAV to settle at a commanded attitude. Adding integral action eliminates steady-state roll angle error caused 
by disturbances or biases, ensuring accurate and reliable attitude tracking
