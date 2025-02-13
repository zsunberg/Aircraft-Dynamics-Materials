function animateQuadrotor(tData,sData,sc)
    % Animate quadrotor trajectory in x and z
    
    % Scale quadrotor drawing size, optional
    if(~exist('sc','var'))
        sc = 4;
    end

    % Initialize quadrotor sketch
    rbar = sc*0.2;
    rsup = sc*0.1;
    rprop = sc*0.12;
    qvx0 = [-rbar,-rbar,rbar,-rbar-rprop,rbar-rprop;rbar,-rbar,rbar,-rbar+rprop,rbar+rprop];
    qvz0 = [0,0,0,-rsup,-rsup;0,-rsup,-rsup,-rsup,-rsup];
    qv0 = [qvx0(:)';qvz0(:)'];
    qv = qv0;
    qc = 'bbbkk';
    nVert = size(qv,2);

    % figure;
    h = plot(qv0(1,1:2),qv0(2,1:2),qc(1),...
             qv0(1,3:4),qv0(2,3:4),qc(2),...
             qv0(1,5:6),qv0(2,5:6),qc(3),...
             qv0(1,7:8),qv0(2,7:8),qc(4),...
             qv0(1,9:10),qv0(2,9:10),qc(5),'LineWidth',3);
    ax = gca;
    ax.YDir = 'reverse';
    axis equal;
    grid on;
    xlabel('x (m)');
    ylabel('z (m)');
    xlim([-20,20]);
    ylim([-20,20]);

    % Animate according to state vector data
    for ii=1:length(tData)
        th = sData(ii,5); % pitch angle
        R = [cos(th),sin(th);-sin(th),cos(th)];
        for jj=1:nVert
            qv(:,jj) = R*qv0(:,jj);
        end
        qv(1,:) = qv(1,:)+sData(ii,1);
        qv(2,:) = qv(2,:)+sData(ii,2);
        for jj=1:5
            h(jj).XData = qv(1,2*(jj-1)+1:2*jj);
            h(jj).YData = qv(2,2*(jj-1)+1:2*jj);
        end
        title([sprintf('%.2f',tData(ii)),' sec']);
        pause(0.1);
        drawnow;
    end
end
