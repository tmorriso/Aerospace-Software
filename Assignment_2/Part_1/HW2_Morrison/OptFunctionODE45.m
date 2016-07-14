%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function optimizes the ODE45 for the smallest delta v
% required for a return to earth. It takes velocities and positions as
% inputs and relative tolerance depending on the bonus points you are going
% after. It outputs the optimized delta v in the x and y direction.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function function_to_optimize = OptFunctionODE45(x,vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,relative_tolerance)

vsx = vsx0+x(1);                 % Spacecraft velocity in X-direction.
vsy = vsy0+x(2);                 % Spacecraft velocity in Y-direction.
re = 6371000;                    % Radius of the Earth

% Set simulation options
options = odeset('Events',@events1,'RelTol', relative_tolerance,'AbsTol',relative_tolerance); 
tspan = [0 1e10];
y0 = [vsx;vsy;vmx;vmy;xs;ys;xm;ym];

% Drive!
[t,y,te,ye,ie] = ode45(@(t,y)RHS(t,y),tspan,y0,options);

% Evaluate!
% If the Earth returned to Earth optimize the function 
if sqrt((0-ye(5))^2 + (0-ye(6))^2) <= re;
    function_to_optimize = sqrt((y(1,1)-vsx0)+(y(1,2)-vsy0));

% otherwise set function to arbitrary number.
else
    function_to_optimize = 20000000;
end