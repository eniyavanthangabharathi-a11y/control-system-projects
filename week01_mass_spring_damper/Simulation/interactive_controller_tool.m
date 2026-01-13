clc;
clear;
close all;

s =tf('s');

disp("Enter mass(m)-spring(k)-damper(c) plant parameters");
m = input('Enter mass m   : ');
c = input('Enter damping c: ');
k = input('Enter spring k : ');

% Create the transfer function for the mass-spring-damper system
G = (1/(m*s^2 + c*s + k));
disp('Plant transfer function G(s): ');
G
disp('plant poles:');

figure;
step(G);
grid on;
title('Open-loop plant response ');

disp('Select controller type:');
disp('0 -> open loop');
disp('1 -> P controller');
disp('2 -> PI controller');
disp('3 -> PID controller');

ctype = input('Enter controller choice : ');
switch ctype
    case 0
        c = 1;
        disp('Open loop selected ');
    case 1
        kp =input('Enter kp : ');
        c = kp;
        disp('P controller selected ');
    case 2
        kp = input('Enter Kp: ');
        ki = input('Enter Ki: ');
        c =kp + ki/s;
        disp('PI controller selected');
    case 3
        kp = input('Enter Kp: ');
        ki = input('Enter Ki: ');
        kd = input('Enter kd: ');
       
        c =kp + ki/s +kd*s;
        disp('PID controller selected');
    otherwise 
        error('Invalid controller selection');
end
disp('Simulation inputs ');
dist_amp = input('Enter disturbance amplitude: ');
t_end = input('Enter simulation end time :');
t = 0:0.01:t_end;

r = zeros(size(t));
d = dist_amp*ones(size(t));

Tr = feedback(c*G, 1);
Td = feedback(G, c);
yr = lsim(Tr, r, t);
yd = lsim(Td, d, t);

y = yr+yd;
figure;
plot(t,y,'LineWidth',1.5);
grid on;
xlabel('Time(s)');
ylabel('Output');
title('Closed-loop response');


 