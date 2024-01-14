function R = rotation321(phiThetaPsi)
% ROTATION321 Creates a rotation matrix from Euler angles for a 3-2-1 rotation sequence.
% Inputs:
%   phiThetaPsi = 3x1 vector of Euler angles [phi; theta; psi] (rad)
% Outputs:
%   R = 3x3 direction cosine matrix

phi = phiThetaPsi(1);
theta = phiThetaPsi(2);
psi = phiThetaPsi(3);

R = eye(3); % Replace with your code

end
