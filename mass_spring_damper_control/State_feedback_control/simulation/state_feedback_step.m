% Load state-space model
run('../model/msd_state_space.m');

% State feedback gain (simple)
K = [5 2];   % [position gain  velocity gain]

% Closed-loop system
A_cl = A - B*K;
sys_cl = ss(A_cl, B, C, D);

% Step response comparison
figure;
step(sys_ss, sys_cl);
grid on;
legend('Open-loop', 'With State Feedback');
title('Effect of State Feedback on MSD System');

