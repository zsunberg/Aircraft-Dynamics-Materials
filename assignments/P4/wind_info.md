This document contains information about the wind for the optional task in P4.

Wind is generated using the following code where `wind` is the argument.

```matlab
if nargin < 3
    wind = 0;
end
wind = round(wind);

% Pseudo-dryden turbulence model
sigma = 0.15*wind;
L = 500;
Va = 21;
T_wind = 0:0.01:100;
s = tf('s');
H = sigma*sqrt(3*L/Va)*(s + Va/(sqrt(3)*L))/((s+Va/L)^2);
Wind_E = zeros(length(T_wind), 3);
Wind_E(:, 2) = wind;
for i = 1:3
    Wind_E(:, i) = Wind_E(:, i) + lsim(H, randn(length(T_wind), 1), T_wind);
end

x_trim = [0; 0; -1800; 0; 0.02780; 0; 20.99; wind; 0.5837; 0; 0; 0];
t_max = 30;
[T, X] = ode45(@(t, x) secure_aircraftDynamics(x, controls(t, x), interp1(T_wind, Wind_E, t)', ttwistor), [0, t_max], x_trim);
```

Note that this is similar to the Dryden gust model in that it is generated with noise fed through one of the Dryden gust model transfer functions, but the true Dryden gust model needs to be simulated in concert with the aircraft state.

Note that the state fed into the controller and the state integrated by ode45 contains $u^E$, $v^E$, and $w^E$, that is, the *inertial* velocity in body coordinates.

In the aircraft dynamics used within the `evaluate` script, wind is incorporated as follows:

```matlab
p_E = x(1:3);
o = x(4:6);
v_E_B = x(7:9);
omega = x(10:12);

R_BE = rotation321(o);

ap = aircraft_parameters;

I_B = [ap.Ix 0 -ap.Ixz;
       0 ap.Iy 0;
       -ap.Ixz 0 ap.Iz];

x_wind = x;
x_wind(7:9) = x(7:9) - R_BE*wind_E;
[X, Z, M] = lonAeroForcesAndMoments(x_wind, u, ap);
[Y, L, N] = latAeroForcesAndMoments(x_wind, u, ap);

f_g_E = [0; 0; 9.81]*ap.m;
f_aero_B = [X; Y; Z];
f_B = f_aero_B + rotation321(o)*f_g_E;
G_B = [L; M; N];

pdot_E = R_BE'*v_E_B;
odot = attitudeInfluence321(o)*omega;
vdot_E_B = -cross(omega, v_E_B) + f_B/ap.m;
omegadot_B = I_B\(-cross(omega, I_B*omega) + G_B);

xdot = [pdot_E; odot; vdot_E_B; omegadot_B];
```
