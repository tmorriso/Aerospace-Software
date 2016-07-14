%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function calculates the moons velocity for initial
% conditions.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [vm] = calculate_moon_velocity(dem)
format long
G = 6.674 * 10^-11;          % Gravitational constant N(m/kg)^2.
mm = 7.34767309*10^22;       % Mass of the moon in Kg.
me = 5.97219*10^24;
vm = sqrt(G*me^2/((me+mm)*dem));

end
