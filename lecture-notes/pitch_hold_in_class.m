b747_state_space

ol_sys = ss(A_lon, B_lon(:, 1), [0 0 0 1], [])

step(ol_sys, 120)

%% Choose proportional gain

rlocus(ol_sys, 0:-0.001:-5)

J = -0.5
p_sys = feedback(ol_sys*J, 1)
step(p_sys)

%% PI Controller

s = tf('s')

J = (1 + 1/s)

rlocus(ol_sys*J, 0:-0.001:-5)

J = -0.5*(1 + 1/s)

pi_sys = feedback(ol_sys*J, 1)
step(pi_sys)

%% PID Controller

J = (1 + 1/s + s)
rlocus(ol_sys*J, 0:-0.001:-2)
grid on

% J = -0.5*(1 + 1/s + s)
% pid_sys = feedback(ol_sys*J, 1)
% step(pid_sys)