function tests = testMonospinnerDynamics
    tests = functiontests(localfunctions);
end

function testStaticFalling(testCase)
    x = zeros(12, 1);
    u = 0;
    actual = monospinnerDynamics(0, x, u);
    expected = [0 0 0  0 0 0  0 0 9.81  0 0 0]';
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testTranslationKinematics(testCase) 
    x = [0 0 0  0 0 0  1 1 1  0 0 0]';
    u = 0;
    actual = monospinnerDynamics(0, x, u);
    expected = [1 1 1  0 0 0  0 0 9.81  0 0 0]';
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testRotationKinematicsExceptRates(testCase)
    x = [0 0 0  0 0 0  0 0 0  1 1 1]';
    u = 0;
    actual = monospinnerDynamics(0, x, u);
    expected = [0 0 0  1 1 1  0 0 9.81]';
    verifyEqual(testCase, actual(1:9), expected, 'AbsTol', 1e-6);
end

function fuzzTest(testCase)
    for i = 1:10
        x = [randn(3,1); 2*pi*rand(3,1); randn(6,1)];
        u = randn(1);
        actual = monospinnerDynamics(0, x, u);
        expected = monospinnerDynamicsSolution(0, x, u);
        verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
    end
end
