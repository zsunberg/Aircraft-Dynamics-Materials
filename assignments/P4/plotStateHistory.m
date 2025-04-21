function plt = plotStateHistory(tout, xout)

    subplot(2,2,1);
    plot(tout, xout(:,1:3));
    legend('x', 'y', 'z', 'Location', 'NorthWest');
    title('Position (m)');

    subplot(2,2,2);
    plot(tout, xout(:,4:6));
    legend('\phi', '\theta', '\psi', 'Location', 'NorthWest');
    title('Attitude (rad)');

    subplot(2,2,3);
    plot(tout, xout(:,7:9));
    legend('u', 'v', 'w', 'Location', 'NorthWest');
    title('Velocity (m/s)');

    subplot(2,2,4);
    plot(tout, xout(:,10:12));
    legend('p', 'q', 'r', 'Location', 'NorthWest');
    title('Angular Rates (rad/s)');

    plt = gcf;
end
