%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison
% @date: January 19, 2016
% Assignment 1, Problem 3, Part (a)

% This function calculates the total weight of a balloon. Given
% radius, payload weight, the weight of the balloon when empty, and the molecular
% weight of the gas in the balloon.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [balloon_weight] = calculate_balloon_weight(radius, payload_weight, empty_balloon_weight, gas_molecular_weight)

rho_initial = 1.225; % density of air at sea level kg/m3

% Calculate the weight of the gas.
gas_weight = (4 * pi * rho_initial * radius^3 * gas_molecular_weight)/(3 * 28.966);

% Calculate the total weight of the balloon.
balloon_weight = gas_weight + payload_weight + empty_balloon_weight;

end