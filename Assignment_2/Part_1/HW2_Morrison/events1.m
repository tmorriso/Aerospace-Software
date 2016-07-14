%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function sets the events for ODE45 to know when to stop
% solving ODE45.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [value,isterminal,direction] = events1(t,y)

xs = y(5);
ys = y(6);
xm = y(7);
ym = y(8);
xe = 0;
y_e = 0;
rm = 1737100;                
re = 6371000;
% Distances

des = sqrt((xe-xs)^2 + (y_e-ys)^2);
dem = sqrt((xe-xm)^2 + (y_e-ym)^2);
dms = sqrt((y(7)-y(5))^2 + (y(8)-y(6))^2);
% Detect height = 0
if dms <= rm
    value = 0;
elseif des <= re
    value = 0;
elseif des >= 2*dem 
    value = 0;
else
    value = 1;
end

% Stop the integration
isterminal = 1;

% Negative direction only
direction = -1;