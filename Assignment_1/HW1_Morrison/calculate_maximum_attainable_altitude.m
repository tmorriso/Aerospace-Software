%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison
% @date: January 19, 2016
% Assignment 1, Problem 3, Part (c)

% This function calculates the maximum attainable altitude of the ballon.
% It takes the radius, payload weight, empty balloon weight, and the
% molecular weight of the gas as inputs.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [maximum_attainable_altitude] = calculate_maximum_attainable_altitude(radius, payload_weight, empty_balloon_weight, gas_molecular_weight)

h = 0;   % Initialize the height at 0 meters.
dh = 10; % Altitude increments delta h = 10 meters.

% Determine the initial weight of displaced air.
[weight_of_displaced_air] = calculate_weight_of_air_displaced(radius, h);

% Determine the total weight of the ballloon.
[balloon_total_weight] = calculate_balloon_weight(radius, payload_weight, empty_balloon_weight, gas_molecular_weight);

while weight_of_displaced_air > balloon_total_weight
    h = h + dh;  
    % Calculate the new weight of the displaced air at the new height.
    [weight_of_displaced_air] = calculate_weight_of_air_displaced(radius, h);
end
maximum_attainable_altitude = h;


end

    

