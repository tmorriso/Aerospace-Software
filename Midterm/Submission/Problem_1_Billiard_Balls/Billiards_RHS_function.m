function f = Billiards_RHS_function(t,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% @author: Tom Morrison
% @date: March 16, 2016
%
% Description: This function determines the right hand side (RHS) of the
% ODE for the billiard two ball problem.
%
%   Inputs:
%       t  : time
%       y  : current positions and velocity vector
%   Outputs:
%       f  : vector of velocities for the right hand side of the ODE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get the velocities
v1x = y(1);
v1y = y(2);
v2x = y(3);
v2y = y(4);

% Get the accelerations (frictionless there will be zero acceleration)
a1x = 0;
a1y = 0;
a2x = 0;
a2y = 0;

% Populate RHS vector
f(1,1) = a1x;
f(2,1) = a1y;
f(3,1) = a2x;
f(4,1) = a2y;
f(5,1) = v1x;
f(6,1) = v1y;
f(7,1) = v2x;
f(8,1) = v2y;
end

