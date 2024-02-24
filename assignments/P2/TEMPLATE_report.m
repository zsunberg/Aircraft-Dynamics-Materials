I = 3e-4;
m = 2;
xr = [10; -10; 0; 0; 0; 0];

%% Task 1

k5 = 0
k6 = 0

%% Task 2

k1 = 0
k2 = 0

k4 = 0

% Plot root locus for k3 here

k3 = 0

%% Task 3

% modify the matrices below
Acl = [
    0 0 1 0 0 0;
    0 0 0 1 0 0;
    0 0 0 0 -9.81 0;
    0 0 0 0 0 0;
    0 0 0 0 0 1;
    0 0 0 0 0 0;
];
Bcl = [
    0 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0;
];

figure(2)
T = 0:0.02:20;
ref = repmat(xr, 1, length(T));
sys = ss(Acl, Bcl, eye(6), zeros(6,6), 'OutputName', {'\Delta x_E', '\Delta z_E', '\Delta u', '\Delta w', '\Delta \theta', '\Delta q'});
lsim(sys, ref, T) % outputs the state

figure(3)
C_control = [
    0 -k6 0 -k5 0 0;
    k3*k4 0 k3 0 -k2 -k1
];
D_control = [
    0 k6 0 0 0 0;
    -k3*k4 0 0 0 0 0
];
csys = ss(Acl, Bcl, C_control, D_control, 'OutputName', {'\Delta Z_c', '\Delta M_c'});
lsim(csys, ref, T) % outputs the controls

%% Task 4
figure(4)
[t, x] = simulateQuadrotor(@(t, x) quadrotorLinearControls(t, x, xr));
displayTrajectory(t, x)

% figure(5)
% animateQuadrotor(t, x)

%% Task 5
figure(6)
[t, x] = simulateQuadrotor(@(t, x) quadrotorControls(t, x, xr));
displayTrajectory(t, x)

% figure(7)
% animateQuadrotor(t, x)

%% Task 6
evaluate(@(t, x) quadrotorControls(t, x, xr), 'your.gradescope.email@colorado.edu')
