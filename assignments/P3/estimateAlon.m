function A_lon = estimateAlon(aircraftDynamics, x_trim, u_trim, aircraft_parameters)

    function xdot_lon = lonDynamics(x_lon, x_trim, u_trim, aircraft_parameters)
        xdot = aircraftDynamics(x_trim + [0; 0; 0;  0; x_lon(4); 0;  x_lon(1); 0; x_lon(2);  0; x_lon(3); 0], u_trim, aircraft_parameters);
        xdot_lon = xdot([7; 9; 11; 5]);
    end

    A_lon = jacobianest(@(x_lon) lonDynamics(x_lon, x_trim, u_trim, ttwistor), zeros(4, 1))
end
