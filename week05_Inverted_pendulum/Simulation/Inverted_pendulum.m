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


state=x0;
theta_hist=[];
t_hist= [];
x_hist =[];
figure(1);
axis([-3 3 -1.5 1.5]);
grid on;
hold on;

for i = 1:N
    t = (i-1)*dt;

    F = -K * state;          % control input
    x_dot = A * state + B * F;
    state = state + x_dot * dt;
    theta_hist(i) = state(3);
    x_hist(i) = state(1);
    t_hist(i) = t;

%     figure(1)
%     cla;;
%     cart_x = state(1);
%     bob_x = cart_x + L*sin(state(3));
%     bob_y = L*cos(state(3));
%     rectangle('Position',[cart_x-0.2, -0.1, 0.4, 0.2]);
%     line([cart_x, bob_x],[0, bob_y]);
%     drawnow;
end

figure(1);
plot(t_hist,theta_hist);
xlabel('Time (s)');
ylabel('Theta (rad)');
title('LQR - Pendulum Angle');
grid on;

% Finalize the simulation by displaying the cart position over time
figure(2);
plot(t_hist, x_hist);
xlabel('Time (s)');
ylabel('Cart Position (m)');
title('LQR - Cart Position');
grid on;