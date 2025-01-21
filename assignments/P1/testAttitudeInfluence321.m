function tests = testAttitudeInfluence321 
    tests = functiontests(localfunctions);
end

function testIdentityInfluence(testCase)
    angles = [0; 0; 0];
    actual = attitudeInfluence321(angles);
    expected = eye(3);
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testXRotationInfluence(testCase)
    angles = [pi/2; 0; 0];
    actual = attitudeInfluence321(angles);
    expected = [1 0 0; 0 0 -1; 0 1 0];
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testYRotationInfluence(testCase)
    angles = [0; pi; 0];
    actual = attitudeInfluence321(angles);
    expected = [1 0 0; 0 1 0; 0 0 -1];
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testZRotationInfluence(testCase)
    angles = [0; 0; pi/2];
    actual = attitudeInfluence321(angles);
    expected = eye(3);
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end
