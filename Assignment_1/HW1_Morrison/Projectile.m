%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Projectile.m
% @author: Tom Morrison
% @date: January 19, 2016
% Assignment 1, Problem 1

% This scipt prompts the user for an angle and initial airspeed
% and plots the horizontal and vertical displacements as a function of
% time.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prompt the user for and angle.
angle = input('Enter an angle theta in degrees ');

% Prompt the user for an initial air speed.
initialAirSpeed = input('Enter an initial airspeed in m/s ');

% Define constants.
g = -9.81;  % acceleration due to gravity m/s2.
dt = .001;  % time step size

% Determine the termination time for the object.
terminationTime = (-2*initialAirSpeed*sind(angle))/g;

% Determine time array.
time = (0:dt:terminationTime);

% Calculate horizontal displacement.
horizontalDisplacement = initialAirSpeed*cosd(angle).*time;
fprintf('\n The maximum horizontal displacement is %g %s \n ', max(horizontalDisplacement), 'meters'); % Checking purposes

% Calculate vertical displacment.
verticalDisplacement = .5*g.*time.^2 + initialAirSpeed*sind(angle).*time;
fprintf('\n The maximum vertical displacement is %g %s \n ', max(verticalDisplacement), 'meters'); % Checking purposes

% Plot the horizontal displacement vs time on figure 1.
plot (time, horizontalDisplacement)
xlabel('Time (seconds)')
ylabel('HorizontalDisplacement (Meters)')

% Plot the vertical displacement vs time on figure 2.
figure                               % Open figure 2
plot (time, verticalDisplacement)    % Plot on figure 2
xlabel('Time (seconds)')
ylabel('Vertical Displacement (Meters)')

