%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author Tom Morrison
% @date January 19, 2016
% Assignment 1, Problem 3

% This function determines a temperature (celsius) and a pressure (Pascals)
% for a given altitude. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&

function [temp, pressure] = calculate_temp_and_pressure(altitude)

if altitude >= 0 && altitude <= 11000
    temp = 15.04 - 0.00649 * altitude;
    pressure = 101.29 * ((temp + 273.1)/(288.08))^5.256;

elseif altitude > 11000 && altitude <= 25000
    temp = -56.46;
    pressure = 22.65 * exp(1.73-0.000157 * altitude);
    
elseif altitude > 25000
    temp = -131.21 + 0.00299 * altitude;
    pressure = 2.488 * (((temp + 273.1)/216.6)^-11.388);
    
else 
    temp = 'unknown';
    pressure = 'unknown';
    disp('Not a valid altitude');
end
end

