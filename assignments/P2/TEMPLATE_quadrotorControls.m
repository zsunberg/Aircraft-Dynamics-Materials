function u = TEMPLATE_quadrotorControls(t, x, xr)
    % state vector: x = [x_E, z_E, uE, wE, theta, q]
    % controls: u = [Zc; Mc]
    
    % calculate controls 
    Zc = 0;
    Mc = 0;

    u = [Zc; Mc];
end
