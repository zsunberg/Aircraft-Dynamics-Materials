function xdot = quadrotorDynamics(t, x, u, W_E)
    % full nonlinear quadrotor dynamics equations for ode45
    % state vector: x = [x_E, z_E, uE, wE, theta, q]
    % controls: u = [Zc, Mc]
    
    % constants
    m = 2;
    Iy = 3e-4;
    v = 2.5e-2;
    mu = 3e-5;
    g = 9.81;
    Zcmax = 5+m*g;
    Mcmax = 1.5e-3;


    % drag forces/moments
    Va = x(3:4) - W_E([1,3]); %air-relative velocity
    X = -v*norm(Va)*Va(1);
    Z = -v*norm(Va)*Va(2);
    M = -mu*x(6)^2;
    
    % dynamics
    if(u(1)>Zcmax),      u(1) = Zcmax;
    elseif(u(1)<-Zcmax), u(1) = -Zcmax;
    end
    if(u(2)>Mcmax),      u(2) = Mcmax;
    elseif(u(2)<-Mcmax), u(2) = -Mcmax;
    end
    xEdot = cos(x(5))*x(3) + sin(x(5))*x(4);
    zEdot = -sin(x(5))*x(3) + cos(x(5))*x(4);
    thetaDot = x(6);
    uDot = -x(6)*x(4) - g*sin(x(5)) + X/m;
    wDot = x(6)*x(3) + g*cos(x(5)) + Z/m + u(1)/m;
    qDot = M/Iy + u(2)/Iy;
    
    % return state time derivative
    xdot = [xEdot; zEdot; uDot; wDot; thetaDot; qDot];
end
