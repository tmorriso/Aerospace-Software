function [values, isterminal, direction] = Billiards_events(t,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% @author: Tom Morrison
% @date: March 16, 2016
%
% Description: This function is the events function for ODE45. It determine
% if one of the balls collide with each other or a wall. If so ODE45 is
% terminated.
%
%   Inputs: 
%       t  : time
%       y  : vector with current positions
%        
%   Outputs:
%       value      : the value to tell ODE45 what to do
%       isterminal : determines if ODE45 should stop
%       direction  : condition on stopping
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global radius;
% Get current x and y positions of the balls.
x1 = y(5); 
y1 = y(6); 
x2 = y(7);
y2 = y(8);

% Determine the distance between the balls
d = sqrt((x2-x1)^2 + (y2-y1)^2);

% Determine if ball one hits a side wall
values(1) = 1*(x1 < 1-radius); %&& y1 < 1-radius && y1 > 0+radius && x2 < 1-radius && x2 > 0+radius && y2 < 1-radius && y2 > 0+radius && d > 2*radius);
isterminal(1) = 1;
direction(1) = -1;
% left wall
values(2) = 1*( x1 > 0+radius);
isterminal(2) = 1;
direction(2) = -1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% I had problems with seperating the events. If two events happened at the 
% same time ODE45 would break down. Thus, I put them all in the same line for
% now.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine if ball one hits a top or bottom wall
values(3) = 1*(y1 < 1 - radius);
isterminal(3) = 1;
direction(3) = -1;

values(4) = 1*(y1 > 0 + radius);
isterminal(4) = 1;
direction(4) = -1;
% Determine if ball two hits a side wall
values(5) = 1*(x2 < 1 - radius) ;
isterminal(5) = 1;
direction(5) = -1;

values(6) = 1*(x2 > 0 + radius);
isterminal(6) = 1;
direction(6) = -1;

% Determine if ball two hits a top or bottom wall
values(7) = 1*(y2 < 1 - radius);
isterminal(7) = 1;
direction(7) = -1;

values(8) = 1*(y2 > 0 + radius);
isterminal(8) = 1;
direction(8) = -1;

% Determine if the balls collide with eachother
values(9) = 1*(d > 2*radius);
isterminal(9) = 1;
direction(9) = -1;


end


