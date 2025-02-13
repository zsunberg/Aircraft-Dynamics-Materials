I = 3e-4;
m = 2;

%% Task 1

k1 = 0
k2 = 0

%% Task 2

k4 = 0

%% Task 3
% Plot root locus for k3 here
figure(1)
k3range = 0:1; % modify the range of k3 you want to plot for
for k3 = k3range
    Acl = -eye(4); % replace this with Acl
    % modify the plot command below
    plot(-ones(size(k3)), zeros(size(k3)), 'x', 'MarkerSize', 10, 'LineWidth', 4);
    hold on;
end
legend(string(k3range), 'Location', 'west');
axis equal;
grid on;
xlim([-30 10]);
hold off;

k3 = 0

%% Task 4

K = [0 0 0 0]

A = -eye(4);

B = zeros(4,1);

Acl = -eye(4)

figure(2)
T = 0:0.02:20;
sys = ss(Acl, B, eye(4), [0], 'OutputName', {'\Delta x_E', '\Delta u', '\Delta \theta', '\Delta q'});
x0 = ones(4,1);
initial(sys, x0) % outputs the state

figure(3)
C_control = -K
D_control = [0];
csys = ss(Acl, B, C_control, D_control, 'OutputName', {'\Delta M_c'});
initial(csys, x0) % outputs the controls

%% Task 5
figure(4)
[t, x] = simulateQuadrotor(@quadrotorLinearControls);
displayTrajectory(t, x)

% figure(5)
% animateQuadrotor(t, x)

%% Task 6
wind = 0; 
evaluate(@quadrotorLinearControls, 'your.gradescope.email@colorado.edu', wind)

%%OPTIONAL, set wind > 0 for a boosted score!
% figure(6)
% wind = 1;
% [t, x] = simulateQuadrotor(@quadrotorLinearControls,wind);
% displayTrajectory(t, x)
% evaluate(@quadrotorControls, 'your.gradescope.email@colorado.edu', wind)
