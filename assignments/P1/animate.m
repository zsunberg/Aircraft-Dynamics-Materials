u = [2.3];
[tout, xout] = ode45(@(t,x) monospinnerDynamics(t, x, u), [0 2], zeros(12, 1));

monospinnerAnimation(tout, xout);
