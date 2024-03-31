function tests = testAircraftDynamics
    tests = functiontests(localfunctions);
end

function testStill(testCase)
    ap = ttwistor;
    x = [0; 0; 0; 0; 0; 0; 1e-5; 0; 0; 0; 0; 0]; % small velocity needed to avoid division by zero
    u = [0; 0; 0; 0];
    xdot = aircraftDynamics(x, u, ap);
    expected = zeros(12, 1);
    expected(9) = ap.g;
    verifyEqual(testCase, xdot, expected, 'AbsTol', 1e-2);
end

function testThrottle(testCase)
    ap = ttwistor;
    x = [0; 0; 0; 0; 0; 0; 1e-5; 0; 0; 0; 0; 0]; % small velocity needed to avoid division by zero
    u = [0; 0; 0; 1];
    xdot = aircraftDynamics(x, u, ap);
    expected = zeros(12, 1);
    rho = stdatmo(-x(3));
    expectedX = rho*ap.Sprop*ap.Cprop*ap.kmotor^2;
    expected(7) = expectedX/ap.m;
    expected(9) = ap.g;
    verifyEqual(testCase, xdot, expected, 'AbsTol', 1e-2);
end

function fuzzTest(testCase)
    ap = ttwistor;
    for i = 1:10
        x_E = randn;
        y_E = randn;
        z_E = 1700 + randn;
        phi = randn;
        theta = 0.02780 + randn;
        psi = 2*pi*rand;
        u = 21;
        v = randn;
        w = randn;
        pqr = randn(3, 1);
        x = [x_E; y_E; z_E; phi; theta; psi; u; v; w; pqr];
        u = randn(4, 1);
        xdot = aircraftDynamics(x, u, ap);
        expected = aircraftDynamicsSolution(x, u, ap);
        verifyEqual(testCase, xdot, expected, 'AbsTol', 1e-6);
    end
end
