function [t,x] = simulateQuadrotor(controls,wind)
    % controls: function that takes in t, x and returns [Zc, Mc]
    % state vector: x = [x_E, z_E, uE, wE, theta, q]
    % initial and goal states
    %Initial Conditions
    x0 = zeros(6,1)';
    rand_angle = 2*pi*rand();
    x0(1:2) = [20*cos(rand_angle);20*sin(rand_angle)];
    tspan = 0:0.04:30;

    %Generate Optional Wind 
    if nargin < 2 || wind == 0

        W_E = [0;0;0];

        % call ode45
        [t, x] = ode45(@(t, x) quadrotorDynamics(t, x, controls(t, x, zeros([6,1])), W_E), tspan, x0);
    else

        % Pseudo-dryden turbulence model
        sigma = 0.4*wind;
        L = 50;
        Va = wind;
        T_wind = 0:0.01:30;
        s = tf('s');
        H = sigma*sqrt(3*L/Va)*(s + Va/(sqrt(3)*L))/((s+Va/L)^2);
        Wind_E = zeros(length(T_wind), 3);
        Wind_E(:,1) = wind;

        for i = 1:3
            Wind_E(:, i) = Wind_E(:, i) + lsim(H, randn(length(T_wind), 1), T_wind);
        end

        % call ode45
        [t, x] = ode45(@(t, x) quadrotorDynamics(t, x, controls(t, x, zeros([6,1])), interp1(T_wind, Wind_E, t)'), tspan, x0);
    end
    
    
end
