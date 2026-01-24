% Disturbance torque (wind)
d = 0.02;   % constant disturbance

% Disturbance enters same channel as control
sys_dist = ss(A - B*K, B, C, D);

% Simulate disturbance as input
t = 0:0.01:5;
disturbance = d * ones(size(t));
y = lsim(sys_dist, disturbance, t);

% Poles 
disp('Closed-loop poles with disturbance:')
pole(sys_dist)

% Plot
figure;
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Roll Angle (rad)');
title('Roll Response with Constant Wind Disturbance');
