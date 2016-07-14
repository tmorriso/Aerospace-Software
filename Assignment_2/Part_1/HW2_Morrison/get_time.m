%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function gets the time for the shortest time objective.
% to display the results in the driver.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [time] = get_time(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,dvsx,dvsy,relative_tolerance)

% Velocities of the spaceship
vsx = vsx0+dvsx;                      % Spacecraft velocity in X-direction.
vsy = vsy0+dvsy;                      % Spacecraft velocity in Y-direction.

% Set simulation options
options = odeset('Events',@events1,'RelTol',relative_tolerance);
tspan = [0 1e10];
y0 = [vsx;vsy;vmx;vmy;xs;ys;xm;ym];

% Drive!
[t,y,te,ye,ie] = ode45(@(t,y)RHS(t,y),tspan,y0,options);

% Get time!
time = te;
