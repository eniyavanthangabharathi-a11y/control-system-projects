% Plant Definition: Mass–Spring–Damper System

% Governing equation: m*x'' + c*x' + k*x = F(t)

% Assumptions:
% - Linear system
% - Single degree of freedom
% - No saturation or nonlinear effects

% Purpose:
% This file defines the physical plant model.
% It is used by all simulation scripts in this project.

% Parameters
m = 2;      % mass (kg)
c = 2;      % damping coefficient (Ns/m)
k = 4;      % spring constant (N/m)

% Transfer function model
s = tf('s');
G = 1 / (m*s^2 + c*s + k);
