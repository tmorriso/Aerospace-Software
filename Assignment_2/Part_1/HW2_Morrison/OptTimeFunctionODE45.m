%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function optimizes the ODE45 for the shortest time
% required for a return to earth. It takes velocities and positions as
% inputs and relative tolerance depending on the bonus points you are going 
% after. It outputs the optimized delta v in the x and y direction.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function function_to_optimize = OptTimeFunctionODE45(y,vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,relative_tolerance)

vsx = vsx0+y(1);                 % Spacecraft velocity in X-direction.
vsy = vsy0+y(2);                 % Spacecraft velocity in Y-direction.
re = 6371000;                    % Radius of Earth

% Set simulation options
options = odeset('Events',@events1,'RelTol', relative_tolerance,'AbsTol',2.22e-14); 
tspan = [0 3.5e5];
y0 = [vsx;vsy;vmx;vmy;xs;ys;xm;ym];

% Drive!
[t,y,te,ye,ie] = ode45(@(t,y)RHS(t,y),tspan,y0,options);

% Determine function to minimize.

% If the spaceship returns to earth minimize time.
if sqrt((0-ye(5))^2 + (0-ye(6))^2) <= re;
    function_to_optimize = t(end);
    
% Else set function to a high arbitrary number.
else
    function_to_optimize = tspan(end);
end