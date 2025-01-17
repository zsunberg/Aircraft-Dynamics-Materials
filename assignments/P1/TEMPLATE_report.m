%% Programming Homework 1 - (Your name here)

%% Task 5

% (modify this code for Task 5)
u = [0.0];
[tout, xout] = ode45(@(t,x) monospinnerDynamics(t, x, u), [0 2], zeros(12, 1));

plotStateHistory(tout, xout);

%%
% (answer to Task 5 question here)

%% Task 6

% (code for task 6 here)

%%
% (answer to Task 6 question here)


%% Task 7
%
% (answer to Task 7 question here)
