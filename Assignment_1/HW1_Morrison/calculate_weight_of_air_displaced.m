%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison
% @date: January 19, 2016
% Assignment 1, Problem 3

% This function determines the weight of the air displaced taking the radius 
% and the altitude of the balloon as inputs.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [weight_of_air_displaced] = calculate_weight_of_air_displaced(radius, balloon_altitude)

% Call function to determine the temperature and pressure.
[temp, pressure] = calculate_temp_and_pressure(balloon_altitude);

% Calculate the density based on the determined temperature and pressure.
density = pressure / (0.2869 * (temp + 273.1));

% Calculate the weight of the air displaced by the balloon.
weight_of_air_displaced = (4 * pi * density * radius^3) / 3;

end
