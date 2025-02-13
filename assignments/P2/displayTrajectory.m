function displayTrajectory(tData,sData)
    % Displays x vs t, z vs t, and z vs x using output from ode integration
    % Also, shows goal and tolerances for x and z
    
    xTarget = 0;
    xTol = 0.5;
    zTarget = 0;
    zTol = 0.5;

    xData = sData(:,1);
    zData = sData(:,2);
    xMin = xTarget-xTol;
    xMax = xTarget+xTol;
    zMin = zTarget-zTol;
    zMax = zTarget+zTol;
    
    % figure;
    subplot(3,1,1);
    plot(tData,xTarget*ones(size(tData)),'k'); hold on;
    plot(tData,xMin*ones(size(tData)),'k--');
    plot(tData,xMax*ones(size(tData)),'k--');
    plot(tData,xData,'b','LineWidth',1);
    grid on;
    ylim([-20,20]);
    xlabel('t (s)');
    ylabel('x (m)');
    title('x_E vs t');
    
    subplot(3,1,2);
    plot(tData,zTarget*ones(size(tData)),'k'); hold on;
    plot(tData,zMin*ones(size(tData)),'k--');
    plot(tData,zMax*ones(size(tData)),'k--');
    plot(tData,zData,'m','LineWidth',1);
    grid on;
    ax = gca;
    ax.YDir = 'reverse';
    ylim([-20,20]);
    xlabel('t (s)');
    ylabel('z (m)');
    title('z_E vs t');
    
    subplot(3,1,3);
    scatter(xTarget,zTarget,100,'k','x'); hold on;
    plot([xMin,xMin],[zMin,zMax],'k--');
    plot([xMax,xMax],[zMin,zMax],'k--');
    plot([xMin,xMax],[zMin,zMin],'k--');
    plot([xMin,xMax],[zMax,zMax],'k--');
    plot(xData,zData,'g','LineWidth',1);
    grid on;
    ax = gca;
    ax.YDir = 'reverse';
    xlim([-20,20]);
    ylim([-20,20]);
    xlabel('x (m)');
    ylabel('z (m)');
    title('Quadrotor Trajectory');
end
