%% Programming Homework 3 - (Your name here)

%% Task 1
% (Nothing additional is needed for this task besides passing the tests.)

runtests('testLonAeroForcesAndMoments.m')

%% Task 2
% (Nothing additional is needed for this task besides passing the tests.)

runtests('testAircraftDynamics.m')

%% Task 3

evaluate('your.gradescope.email@colorado.edu') % Change the email to your own

%% Task 4

x_trim = [0; 0; -1800; 0; 0.02780; 0; 20.99; 0; 0.5837; 0; 0; 0];
u_trim = [0.1079; 0; 0; 0.3182];
A_lon = estimateAlon(@aircraftDynamics, x_trim, u_trim, ttwistor);

% Calculate eigenvectors and indicate which corresponds to phugoid and short period

%% Task 5

ss_lon = ss(A_lon, zeros(4,1), [0 0 0 0], [0]); % Change this to the desired state-space model
dx_ph = zeros(4, 1) % Replace this with the initial deviation for phugoid mode
[linear_theta, linear_time] = initial(ss_lon, dx_ph, 50);

x_ph = zeros(12,1); % Replace this with an initial state that excites the phugoid mode
[nonlinear_time, nonlinear_x] = ode45(@(t, x) aircraftDynamics(x, u_trim, ttwistor), [0, 50], x_ph);

figure(1)
plot(linear_time, linear_theta + x_trim(5), nonlinear_time, nonlinear_x(:,5))

%% Task 6

dx_sp = zeros(4, 1) % Replace this with the initial deviation for short period mode
[linear_theta, linear_time] = initial(ss_lon, dx_sp, 10);

x_sp = zeros(12,1); % Replace this with an initial state that excites the short period mode
[nonlinear_time, nonlinear_x] = ode45(@(t, x) aircraftDynamics(x, u_trim, ttwistor), [0, 10], x_sp);

figure(2)
plot(linear_time, linear_theta + x_trim(5), nonlinear_time, nonlinear_x(:,5))

%% Task 7
%
% Replace this with your answer to the question in Task 7.
