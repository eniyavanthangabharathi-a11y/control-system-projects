% Load state-space model
run('../model/msd_state_space.m');

% Define three pole sets (no design tool yet)
poles_slow   = [-0.5  -0.6];
poles_medium = [-1.5  -1.6];
poles_fast   = [-3.0  -3.2];

% Convert poles to equivalent feedback gains
K_slow   = place(A, B, poles_slow);
K_medium = place(A, B, poles_medium);
K_fast   = place(A, B, poles_fast);

% Closed-loop systems
sys_slow   = ss(A - B*K_slow,   B, C, D);
sys_medium = ss(A - B*K_medium, B, C, D);
sys_fast   = ss(A - B*K_fast,   B, C, D);

% Plot comparison
figure;
step(sys_slow, sys_medium, sys_fast);
grid on;
legend('Slow poles', 'Medium poles', 'Fast poles');
title('Effect of Pole Location on Time-Domain Response');
