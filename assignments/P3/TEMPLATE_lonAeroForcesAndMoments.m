function [X, Z, M] = lonAeroForcesAndMoments(x, u, aircraft_parameters)
%lonAeroForcesAndMoments - Calculate the longitudinal aerodynamic forces and moments
%
% Inputs:
%    x - state vector [x, y, z, phi, theta, psi, u, v, w, p, q, r] in SI units and radians
%    u - control vector [de, da, dr, dt] in radians
%    aircraft_parameters - struct containing nondimensional derivatives and other aircraft parameters
%
% Outputs:
%    X - force in x direction in N
%    Z - force in z direction in N
%    M - moment in y direction in Nm

ap = aircraft_parameters;

rho = stdatmo(-x(3));

dt = u(4);

V = norm(x(7:9));

Thrust = rho*ap.Sprop*ap.Cprop*(V + dt*(ap.kmotor - V))*dt*(ap.kmotor-V);

% Replace the following with your own code
X = 0;
Z = 0;
M = 0;

end
