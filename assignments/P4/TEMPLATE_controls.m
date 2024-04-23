function u = controls(t, x)
% CONTROLS - computes the control inputs for the aircraft given the time and state
%
% INPUTS
%   t = time in seconds
%   x = [x, y, z, phi, theta, psi, u^E, v^E, w^E, p, q, r] in SI units and radians
%   NOTE: For this assignment, when there is wind, the velocity components are with respect to the EARTH, not the wind
%
% OUTPUTS
%   u = [delta_e, delta_a, delta_r, delta_t] radians and number beteween 0 and 1

    delta_e_0 = 0.1068;
    delta_t_0 = 0.2439;

    % Insert your control gains here
    kp = nan;
    ka = nan;
    kr = nan;

    % Keep these gains the same
    kth = -3;
    kq = -1;

    % Keep this pitch angle
    theta_r = 0.0278;

    % Insert your roll angle here
    phi_r = nan;

    % Keep these elevator and thrust controllers
    delta_e = kth*(theta_r-x(5)) + kq*-x(11) + delta_e_0;
    delta_t = delta_t_0;

    % Insert your lateral controllers here
    delta_a = nan;
    delta_r = nan;

    u = [delta_e, delta_a, delta_r, delta_t];
end
