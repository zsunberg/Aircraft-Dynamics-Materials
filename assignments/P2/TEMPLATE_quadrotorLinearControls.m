function u = quadrotorLinearControls(t, x, xr)
    % state vector: x = [x_E, z_E, uE, wE, theta, q]
    % controls: u = [Zc, Mc]

    g = 9.81;
    m = 2;

    % replace with your gain values
    k1 = 0;
    k2 = 0;
    k3 = 0;
    k4 = 0;
    k5 = 0;
    k6 = 0;

    Zc = -k5*x(4) - k6*(x(2) - xr(2)) -m*g;
    Mc = -k1*x(6) - k2*x(5) + k3*x(3) + k3*k4*(x(1) - xr(1));

    u = [Zc; Mc];
end
