function monospinnerAnimation(tout,xout)
    msp = loadawobj('Monospinner.obj');
    mtl = loadawmtl(msp.mtllib);
    Rfix = rotation321Solution([-pi/2,0,0]);
    nVert = size(msp.v,2);
    for ii=1:nVert
        msp.v(:,ii) = Rfix*msp.v(:,ii);
    end
    mspVert = msp.v;
    fig = figure(101);
    fig.Position = [850   185   778   831]
    clf;
    ax = gca;
    ax.FontSize = 14;
    ax.ZDir = 'reverse';
    ax.YDir = 'reverse';
    grid on;
    axis equal;
    unitScale = 100;
    ax.CameraPosition = unitScale*[-100,60,-10];
    [p3,p4] = drawinit(msp,mtl);
    xlim(unitScale*[-6,6]);
    ylim(unitScale*[-6,6]);
    zmin = min(xout(:,3));
    zmax = max(xout(:,3));
    zlim(unitScale*[zmin-2,zmax+2]);
    xlabel('x (cm)');
    ylabel('y (cm)');
    zlabel('z (cm)');

    % Animate
    %%%%%%%%% slow-mo factor
    tFactor = 5;
    %%%%%%%%%
    for ii=1:length(tout)
        R = rotation321Solution([xout(ii,4),xout(ii,5),xout(ii,6)]);
        for jj=1:nVert
            mspVert(:,jj) = R'*msp.v(:,jj);
        end
        mspVert = mspVert+unitScale*xout(ii,1:3)';
        p3.Vertices = mspVert';
        p4.Vertices = mspVert';
        title([sprintf('%.2f',tout(ii)), 'sec']);
        if(ii>1)
            pause(tFactor*0.3*(tout(ii)-tout(ii-1)));
        end
        drawnow;
    end
end