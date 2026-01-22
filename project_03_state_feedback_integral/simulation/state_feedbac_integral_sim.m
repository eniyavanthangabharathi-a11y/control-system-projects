% Load augmented model
run('../model/msd_state_space_integral.m');

% Desired closed-loop poles
poles = [-1.2 -1.3 -1.5];

% State feedback with integral action
K_aug = place(A_aug, B_aug, poles);

% Closed-loop system
Acl = A_aug - B_aug * K_aug;
sys_cl = ss(Acl, [0; 0; 1], C_aug, D_aug);

% Simulation
t = 0:0.1:20;
r = ones(size(t));

y = lsim(sys_cl, r, t);

% Plot
figure;
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Displacement');
title('State Feedback with Integral Action');
