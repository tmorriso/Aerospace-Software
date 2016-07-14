%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function sets the right hand side of the ODE to be used
% in ODE45.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f = RHS(t,y)

% Gravitational Constant N(m/kg)^2.
G = 6.674 * 10^-11;

% Masses
mm = 7.34767309*10^22;
me = 5.97219*10^24;          
ms = 28833;

% Velocity
vsx = y(1);
vsy = y(2);
vmx = y(3);
vmy = y(4);

% Positions
xs = y(5);
ys = y(6);
xm = y(7);
ym = y(8);
xe = 0;
ye = 0;

% Distances
dms = sqrt((xm-xs)^2 + (ym-ys)^2);
des = sqrt((xe-xs)^2 + (ye-ys)^2);
dem = sqrt((xe-xm)^2 + (ye-ym)^2);

% Forces
fmsx = (G*mm*ms*(xm - xs))/dms^3;     
fmsy = (G*mm*ms*(ym - ys))/dms^3;

fesx = (G*me*ms*(xe - xs))/des^3;           
fesy = (G*me*ms*(ye - ys))/des^3;

femx = (G*me*mm*(xe - xm))/dem^3;
femy = (G*me*mm*(ye - ym))/dem^3;

fsmx = (G*ms*mm*(xs - xm))/dms^3;           
fsmy = (G*ms*mm*(ys - ym))/dms^3;

% Acceleration
asx = (fmsx + fesx)/ms;
asy = (fmsy + fesy)/ms;
amx = (femx + fsmx)/mm;
amy = (femy + fsmy)/mm;


% RHS vector
f(1,1) = asx;
f(2,1) = asy;
f(3,1) = amx;
f(4,1) = amy;
f(5,1) = vsx;
f(6,1) = vsy;
f(7,1) = vmx;
f(8,1) = vmy;