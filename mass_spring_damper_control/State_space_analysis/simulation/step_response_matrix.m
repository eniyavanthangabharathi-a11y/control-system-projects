% Load state-space model
run('../model/msd_state_space.m');

% Step response
figure;
step(sys_ss);
grid on;
title('Step Response of MSD System (State-Space)');

% Performance metrics
info = stepinfo(sys_ss);

% Display metrics
disp('Step Response Metrics:');
disp(info);
