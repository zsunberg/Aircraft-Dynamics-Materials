function [Y, L, N] = latAeroForcesAndMoments(x, u, aircraft_parameters)
% TODO docs

ap = aircraft_parameters;
rho = stdatmo(-x(3));

da = u(2);
dr = u(3);

V = norm(x(7:9));
beta = asin(x(8)/V);

p = x(10);
r = x(12);

Q = 0.5*rho*V^2;


% Y force
CY = ap.CY0 + ap.CYbeta*beta + ap.CYp*p*ap.b/(2*V) + ap.CYr*r*ap.b/(2*V) + ap.CYda*da + ap.CYdr*dr;
Y = Q*ap.S*CY;

Cl = ap.Cl0 + ap.Clbeta*beta + ap.Clp*p*ap.b/(2*V) + ap.Clr*r*ap.b/(2*V) + ap.Clda*da + ap.Cldr*dr;
Cn = ap.Cn0 + ap.Cnbeta*beta + ap.Cnp*p*ap.b/(2*V) + ap.Cnr*r*ap.b/(2*V) + ap.Cnda*da + ap.Cndr*dr;

L = Q*ap.S*ap.b*Cl;
N = Q*ap.S*ap.b*Cn;

end
