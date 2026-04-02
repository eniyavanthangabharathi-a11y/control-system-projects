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
Q = diag([10,1,100,10]);
R = 1; 
K = lqr(A, B, Q, R);  
disp('value of k')
disp(K)

Acl = A - B*K;
disp('Closed-loop eigenvalues:');
disp(eig(Acl));

x0 =[0; 0; 0.1; 0];
dt =0.001;
t_end = 10;

N = t_end / dt; 
theta_hist = zeros(1, N);
x_hist = zeros(1, N);
t_hist = zeros(1, N);

state = x0;
theta_hist = zeros(1,N);
x_hist = zeros(1,N);
t_hist = zeros(1,N);

for i = 1:N
    t_hist(i) = (i-1)*dt;
    F = -K * state;
    x_dot = A*state + B*F;
    state = state + x_dot*dt;
    theta_hist(i) = state(3);
    x_hist(i) = state(1);
end

sys_tf = tf(sys);
sys_theta = sys_tf(2,1);
[C_pid, info] = pidtune(sys_theta, 'PD');

Kp =20;
Kd =5;
Ki=0;

A_pid = A + B*[0, 0, Kp, Kd];
disp(eig(A_pid));

state = x0;
integral_err = 0;
theta_pid = zeros(1,N);
x_pid = zeros(1,N);

for i = 1:N

    
    theta = state(3);
    theta_dot = state(4);
    F = Kp*theta + Kd*theta_dot + Ki*integral_err;
    integral_err = integral_err + theta*dt;
    x_dot = A*state + B*F;
    state = state + x_dot*dt;
    theta_pid(i) = state(3);
    x_pid(i) = state(1);
end

figure(1);
plot(t_hist, theta_hist, t_hist, theta_pid);
legend('LQR','PID');
xlabel('Time (s)'); ylabel('Theta (rad)');
title('LQR vs PID - Pendulum Angle');
grid on;

figure(2);
plot(t_hist, x_hist, t_hist, x_pid);
legend('LQR','PID');
xlabel('Time (s)'); ylabel('Cart Position (m)');
title('LQR vs PID - Cart Position');
grid on;
