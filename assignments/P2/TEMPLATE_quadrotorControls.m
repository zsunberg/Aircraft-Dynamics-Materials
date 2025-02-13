function u = quadrotorControls(t, x, xr)
    % state vector: x = [x_E, z_E, uE, wE, theta, q]
    % controls: u = [Zc, Mc]

    g = 9.81;
    m = 2;

    %%%You may replace the linear control law with any control law of your
    %%%choice. The control law below is only present to give you a
    %%%structure to build upon.
    
    % replace with your gain values
    k1 = 0;
    k2 = 0; 
    k3 = 0; 
    k4 = 0; 
    k5 = 2.5133; %You may modify k5 and k6 but are not required to do so.
    k6 = 1.2337; 

    Zc = -k5*x(4) - k6*(x(2)) -m*g;
    Mc = -k1*x(6) - k2*x(5) + k3*x(3) + k3*k4*(x(1));

    u = [Zc; Mc];
end
