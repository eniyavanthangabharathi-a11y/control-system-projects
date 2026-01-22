% Load UAV roll model
run('../model/uav_roll_model.m');

% Open-loop step response
figure;
step(sys_uav);
grid on;
title('Open-Loop UAV Roll Angle Response');
xlabel('Time (s)');
ylabel('Roll Angle (rad)');

