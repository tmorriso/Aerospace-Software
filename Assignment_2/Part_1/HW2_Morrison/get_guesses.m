%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function gets the initial guesses for the ODE45
% function. The closer the guesses are to the actual values the less time
% ODE45 will take to run, but I used a very broad range and then made up
% for it by using smaller tolerances in ODE45.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [smallest_dvsx,smallest_dvsy,shortest_time_dvsx,shortest_time_dvsy] = get_guesses(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym)
format long
% Radius of the Earth
re = 6371000;

% Set place holders
shortest_time = 1e10;
smallest_dv = 1050;

% Broad range sweep to find 'best' guess for ODE45.
for i = -100:50:100
    for j = -100:50:100
    
% Set initial velocity perturbation
dvsx = j;
dvsy = i;


% Velocities of the spaceship
vsx = vsx0+dvsx;                        % Spacecraft velocity in X-direction.
vsy = vsy0+dvsy;                        % Spacecraft velocity in Y-direction.

% Set simulation options
options = odeset('Events',@events1,'RelTol',1e-4);
tspan = [0 1e10];
y0 = [vsx;vsy;vmx;vmy;xs;ys;xm;ym];

% Drive!
[t,y,te,ye,ie] = ode45(@(t,y)RHS(t,y),tspan,y0,options);

% Distance between Earth and ship
des = sqrt((0-ye(5))^2 + (0-ye(6))^2);

% Determine if it is the shortest time or smallest dv.
if des <= re

    if te < shortest_time
        shortest_time = te;
        shortest_time_dvsx = dvsx;
        shortest_time_dvsy = dvsy;
    end
    
% Calculate total velocity perturbation
dv = sqrt((dvsx^2 + dvsy^2));
    if dv < smallest_dv
        smallest_dv = dv;
        smallest_dvsx = dvsx;
        smallest_dvsy = dvsy;
    end
    
end
    end
end
