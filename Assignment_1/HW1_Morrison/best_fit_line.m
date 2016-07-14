%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% best_fit_line.m
% @author: Tom Morrison
% @date: January 19, 2016
% Assignment 1, Problem 2

% This function calculates the slope and y intercept for a line of best fit
% for a set of data points. Taking two vectors x and y as inputs.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [m,b]=best_fit_line(vectorx,vectory)

A=sum(vectorx);
B=sum(vectory);
C=sum(vectorx.*vectory);
D=sum(vectorx.*vectorx);

N=numel(vectorx);

m=(A*B-N*C)/(A*A-N*D);
b=(A*C-B*D)/(A*A-N*D);

end