% Load UAV roll model
run('../model/uav_roll_model.m');

% Safe (moderate) controller
poles_safe = [-4 -5];
K_safe = place(A, B, poles_safe);

% Aggressive controller
poles_fast = [-10 -12];
K_fast = place(A, B, poles_fast);

% Closed-loop systems
sys_safe = ss(A - B*K_safe, B, C, D);
sys_fast = ss(A - B*K_fast, B, C, D);

% Disturbance torque (step)
t = 0:0.01:5;
disturbance = 0.05 * ones(size(t));

% Simulate disturbance response
y_safe = lsim(sys_safe, disturbance, t);
y_fast = lsim(sys_fast, disturbance, t);

% Plot comparison
figure;
plot(t, y_safe, 'LineWidth', 1.5); hold on;
plot(t, y_fast, '--', 'LineWidth', 1.5);
grid on;
legend('Safe controller', 'Aggressive controller');
xlabel('Time (s)');
ylabel('Roll Angle (rad)');
title('Robustness Comparison Under Disturbance');
