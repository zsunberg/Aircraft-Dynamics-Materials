function tests = testRotation321
    tests = functiontests(localfunctions);
end

function testIdentity(testCase)
    % Test that the identity matrix is returned when the angles are zero
    angles = [0 0 0];
    expected = eye(3);
    actual = rotation321(angles);
    verifyEqual(testCase, actual, expected);
end

function testAdditiveRotation(testCase)
    % Test that the correct DCM is returned for multiple rotations about the same axis 
    for axis = 1:3
        angles = zeros(3,1);
        angles(axis) = 0.1;
        expected = rotation321(angles) * rotation321(angles);
        actual = rotation321(2*angles);
        verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
    end
end

function testXRotation(testCase)
    % Test that the correct DCM is returned for a rotation about the x-axis
    angles = [pi/2 0 0];
    expected = [1 0 0; 0 0 1; 0 -1 0];
    actual = rotation321(angles);
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testYRotation(testCase)
    % Test that the correct DCM is returned for a rotation about the y-axis
    angles = [0 pi/2 0];
    expected = [0 0 -1; 0 1 0; 1 0 0];
    actual = rotation321(angles);
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testZRotation(testCase)
    % Test that the correct DCM is returned for a rotation about the z-axis
    angles = [0 0 pi/2];
    expected = [0 1 0; -1 0 0; 0 0 1];
    actual = rotation321(angles);
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end

function testZYXRotation(testCase)
    % Test that the correct DCM is returned for a rotation about the z, y, and x axes
    angles = [pi/2 pi/2 pi/2];
    expected = [0 0 -1; 0 1 0; 1 0 0];
    actual = rotation321(angles);
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-6);
end
