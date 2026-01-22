% Simplified UAV Roll Dynamics
% States:
% x1 = roll angle (phi)
% x2 = roll rate (p)

% Parameters
Ixx = 0.02;   % Roll moment of inertia (kg·m^2)
L   = 0.1;    % Control effectiveness (Nm per unit input)

% State-space model
A = [ 0      1;
      0      0 ];

B = [ 0;
      L/Ixx ];

C = [1 0];   % Output: roll angle
D = 0;

% State-space system
sys_uav = ss(A, B, C, D);
