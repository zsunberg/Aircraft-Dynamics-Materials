function xdot = aircraftDynamics(x, u, aircraft_parameters)
%aircraftDynamics - computes the state derivative of a conventional aircraft
%
% Inputs:
%    x - state vector [x, y, z, phi, theta, psi, u, v, w, p, q, r] in SI units and radians
%    u - control vector [de, da, dr, dt] in radians
%    aircraft_parameters - struct containing nondimensional derivatives and other aircraft parameters
%
% Outputs:
%    xdot - state derivative vector [xdot, ydot, zdot, phidot, thetadot, psidot, udot, vdot, wdot, pdot, qdot, rdot] in SI units and radians

[X, Z, M] = lonAeroForcesAndMoments(x, u, ap);
[Y, L, N] = latAeroForcesAndMoments(x, u, ap);

% Replace with your code
xdot = zeros(12, 1);

end
