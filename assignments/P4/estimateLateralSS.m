function [A_lat, B_lat] = estimateLateralSS(aircraftDynamics, x_trim, u_trim, aircraft_parameters)

    function xdot_lat = latDynamics(x_lat, u_lat, x_trim, u_trim, aircraft_parameters)
        xdot = aircraftDynamics(x_trim + [0; 0; 0;  x_lat(4); 0; 0;  0; x_lat(1); 0;  x_lat(2); 0; x_lat(3)], u_trim + [0; u_lat(1); u_lat(2); 0], aircraft_parameters);
        xdot_lat = xdot([8; 10; 12; 4]);
    end

    A_lat = jacobianest(@(x_lat) latDynamics(x_lat, zeros(2, 1), x_trim, u_trim, ttwistor), zeros(4, 1));
    B_lat = jacobianest(@(u_lat) latDynamics(zeros(4, 1), u_lat, x_trim, u_trim, ttwistor), zeros(2, 1));

end
