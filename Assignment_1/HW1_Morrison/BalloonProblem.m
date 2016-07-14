%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BalloonProblem.m
% @author: Tom Morrison
% @date: January, 19 2016
% Assignment 1, Problem 3, Part (d)

% This is the scipt to use the function written in part (c) to determine
% the maximum attainable altitude for helium filled weather balloon with a
% radius of 3.0 m, payload weight of 5 kg, and empty balloon weight of 0.6
% kg.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc 

% Define variables.
radius = 3.0;            % In meters
payload_weight = 5;      % In kg
empty_weight = 0.6;      % In kg
MW = 4.02;               % Molecular weight of helium

% Call funciton to determine maximum attainable height.
[max_height] = calculate_maximum_attainable_altitude(radius, payload_weight,empty_weight,MW);

% Display the result using fprintf.
fprintf('\n The maximum attainable altitude of the balloon is %g meters. \n', max_height)
