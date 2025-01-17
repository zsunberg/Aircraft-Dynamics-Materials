function plt = plotStateHistory(tout, xout)
% PLOTSTATEHISTORY Plots the state history given the output from ode45.
% You will need to modify this to get it to work!

    subplot(2,2,1);
    plot(tout, zeros(length(tout), 3));
    legend('x', 'y', 'z', 'Location', 'NorthWest');
    title('Position (m)');

    subplot(2,2,2);
    plot(tout, zeros(length(tout), 3));
    legend('\phi', '\theta', '\psi', 'Location', 'NorthWest');
    title('Attitude (rad)');

    subplot(2,2,3);
    plot(tout, zeros(length(tout), 3));
    legend('u', 'v', 'w', 'Location', 'NorthWest');
    title('Velocity (m/s)');

    subplot(2,2,4);
    plot(tout, zeros(length(tout), 3));
    legend('p', 'q', 'r', 'Location', 'NorthWest');
    title('Angular Rates (rad/s)');

    plt = gcf;
end
