%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LeastSquares.m
% @author: Tom Morrison
% @date: January 19, 2016
% Assignment 1, Problem 2

% This script uses the function best_fit_line for a table of F-117
% Nighthawk lift coefficients and angles of attack. It then plots the data
% and the line of best fit on the same figure.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%{Test Data if code is working should return m=5.0860 b=2.0040.}%%%%%%%
% x=[-3,12.1,20,0,8,3.7,-5.6,0.5,5.8,10];
% y=[-11.06,58.95,109.73,3.15,44.83,21.29,-27.29,5.11,34.01,43.25];
% [slope1,intercept1]=best_fit_line(x,y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha=[-5,-2,0,2,3,5,7,10,14];
lift_coefficient=[-0.008,-0.003,0.001,0.005,0.007,0.006,0.009,0.017,0.019];

% Call function to get line of best fit.
[slope, intercept]=best_fit_line(alpha,lift_coefficient);

% Get table of x and y values for line of best fit.
x = []; 
xaxis = -6;
dx = 0.01;
y = [];

while xaxis <= 14
    y = [y , slope * xaxis + intercept];
    x = [x , xaxis];
    xaxis = xaxis + dx;
end

% Plot scatter plot and line on same figure.
figure; hold on
scatter(alpha, lift_coefficient);
plot (x, y)
xlabel('Angle of Attack', 'FontSize', 14)
ylabel('Lift Coefficient', 'FontSize', 14)
title('Lift Coefficient vs. Angle of Attack', 'FontSize', 16)
legend('Data Points', 'Line of best fit')
hold off
    
