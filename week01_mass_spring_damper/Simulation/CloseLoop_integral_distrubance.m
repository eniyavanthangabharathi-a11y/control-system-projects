% Load plant model
run('../model/plant_definition.m');

% Integral controller
Ki = 2;
C = Ki / s;

% Closed-loop transfer functions
Tr = feedback(C*G, 1);   % reference -> output
Td = feedback(G, C);     % disturbance -> output

% Simulation time
t = 0:0.1:100;

% Inputs
r = zeros(size(t));      % no reference input
d = 0.5 * ones(size(t)); % step disturbance

% Responses
yr = lsim(Tr, r, t);
yd = lsim(Td, d, t);

% Total output
y = yr + yd;

% Plot
figure;
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Displacement');
title('Closed-loop disturbance rejection with integral control');

% Steady-state value
y(end)

