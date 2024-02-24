function [t,x] = simulateQuadrotor(controls)
    % controls: function that takes in t, x and returns [Zc, Mc]
    % state vector: x = [x_E, z_E, uE, wE, theta, q]
    % initial and goal states
    x0 = [0; 0; 0; 0; 0; 0];
    tspan = 0:0.04:30;
    
    % call ode45
    [t, x] = ode45(@(t, x) quadrotorDynamics(t, x, controls(t, x)), tspan, x0);
end
