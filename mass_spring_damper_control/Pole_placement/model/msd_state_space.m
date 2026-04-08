% State-Space Model: Mass–Spring–Damper System

% States:
% x1 = displacement
% x2 = velocity

% Governing equation: m*x'' + c*x' + k*x = u

% Parameters
m = 2;
c = 2;
k = 4;

% State-space matrices
A = [  0      1;
     -k/m  -c/m ];

B = [ 0;
      1/m ];

C = [ 1  0 ];   % output = displacement
D = 0;

% State-space system
sys_ss = ss(A, B, C, D);
