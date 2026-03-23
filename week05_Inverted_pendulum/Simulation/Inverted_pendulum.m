%% Inverted Pendulum - State Space Model
%  Phase 2: Mathematical Modeling

clear all; close all; clc;

%% System Parameters
M = 1.0;       % Cart mass (kg)
m = 0.1;       % Pendulum mass (kg)
b = 0.1;       % Cart friction (N.s/m)
L = 0.5;       % Pendulum length (m)
g = 9.81;      % Gravity (m/s^2)

%% Determinant term (from 2x2 matrix inversion)
p = (M + m) * (m * L^2) - (m * L)^2;

%% A Matrix
A = [0,               1,                    0,    0;
     0,  -(m*L^2)*b/p,    (m^2*g*L^2)/p,    0;
     0,               0,                    0,    1;
     0,    -(m*L*b)/p,    m*g*L*(M+m)/p,    0];

%% B Matrix
B = [          0;
     m*L^2/p;
               0;
        -m*L/p];

%% C Matrix (measuring x and theta)
C = [1, 0, 0, 0;
     0, 0, 1, 0];

%% D Matrix
D = [0;
     0];

%% Build state-space object
sys = ss(A, B, C, D);

%% ---- CHECK 1: Poles (eigenvalues of A) ----
disp('--- POLES ---');
poles = eig(A)

%% ---- CHECK 2: Controllability ----
disp('--- CONTROLLABILITY RANK ---');
rank_ctrb = rank(ctrb(A, B))

%% ---- CHECK 3: Observability ----
disp('--- OBSERVABILITY RANK ---');
rank_obsv = rank(obsv(A, C))
%% LQR modeling
Q = diag([1,1,100,1]);
R = 1; 
K = lqr(A, B, Q, R);  
disp('value of k')
disp(K)