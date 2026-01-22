% Load augmented UAV roll model
run('../model/uav_roll_integral_model.m');

% Desired closed-loop poles
poles = [-4 -5 -2];

% State feedback with integral action
K_aug = place(A_aug, B_aug, poles);

% Closed-loop system
Acl = A_aug - B_aug * K_aug;
sys_cl = ss(Acl, [0; 0; 1], C_aug, D_aug);

% Roll angle command
t = 0:0.01:5;
r = ones(size(t));

% Simulate
y = lsim(sys_cl, r, t);

% Plot
figure;
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Roll Angle (rad)');
title('UAV Roll Attitude Tracking with Integral Action');
