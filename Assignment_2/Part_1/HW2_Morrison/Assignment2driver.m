%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 

% Description: This is the driver for assignment 2 it exectutes all of the
% embedded functions in order to obtain optimal velocity changes for the
% Apollo 13 mission. The user can input four different options for the four
% different bonus criteria (Shortest time, most accurate and quickest run
% time, and Smallest delta-v most accurate and quickest run time.) The most
% accurate are found using relative tolerance and absolute tolerance max.
% Tic toc is utilized to determine quickest run time.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clear all; clc;
format long
user_input = input('Enter 1 for shortest time (most accurate), enter 2 for shortest time (fastest), enter 3 for smallest dv (most accurate), enter 4 for smallest dv (fastest)');

% Set relative tolorances depending on the user input
if user_input == 1 || user_input == 3
    relative_tolerance = 2.22045e-14;
elseif user_input == 2 || user_input == 4
    relative_tolerance = 1e-6;
else
    message = 'Not a valid input try again';
    error(message)
end

% Start timer.
tic

% Initial conditions
des = 340000000;                         % Distance between Earth and the Spacecraft in meters.
stheta = 50;                             % Angle of the spacecraft trajectory.
vs = 1000;                               % Velocity of the Spacecraft in meters/ second.
xs = des*cosd(stheta);                   % X-Position of Spacecraft.
ys = des*sind(stheta);                   % Y-Position of Spacecraft.
dem = 384403000;                         % Distance between Earth and the Moon.
thetam = 42.5;                           % Angle of the moon.
vm = calculate_moon_velocity(dem);       % Moons velociy
xm = dem * cosd(thetam);                 % X-Position of the moon.
ym = dem * sind(thetam);                 % Y-Position of the moon.
vmx = -vm * sind(thetam);                % Moon velocity in X-direction.
vmy = vm *cosd(thetam);                  % Moon velocity in Y-direction.
vsx0 = vs*cosd(stheta);                  % Spacecraft initial X-velocity.
vsy0 = vs*sind(stheta);                  % Spacecraft initial Y-velocity

% Get guesses for ODE45 fminsearch optimization.
[smallest_dvsx,smallest_dvsy,shortest_time_dvsx,shortest_time_dvsy] = get_guesses(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym);

% Set initial guess
if user_input == 1 || user_input == 2
    dvsx1 = shortest_time_dvsx;
    dvsy1 = shortest_time_dvsy;
end
if user_input == 3 || user_input == 4
    dvsx0 = smallest_dvsx;
    dvsy0 = smallest_dvsy;
end

% Optimize!
if user_input == 1 || user_input == 2
    y = fminsearch(@(y)OptTimeFunctionODE45(y,vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,relative_tolerance),[dvsx1,dvsy1]);
end
if user_input == 3 || user_input == 4
    x = fminsearch(@(x)OptFunctionODE45(x,vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,relative_tolerance),[dvsx0,dvsy0]);
end

% Stop timer!
toc

% Results for smallest dv )(most accurate)
if user_input == 3 
    
    % Display!
    fprintf('\n >>>>>>This is the result for the smallest dv with the most accurate result<<<<<< \n') 
    fprintf('\nThe smallest delta-V for a return to earth is: %1.15f meters per second in the y direction and %1.15f meters per second in the x direction \n', x(2),x(1))
    dv = sqrt((x(2)^2+x(1)^2));
    fprintf('The smallest total delta-V is: %1.15f \n',dv)

    % Plot!
    plot_trajectory(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,x(1),x(2),1,relative_tolerance)
    
end

% Results for smallest dv (quickest run time)
if user_input == 4  
    
    % Display!
    fprintf('\n >>>>>>This is the result for the smallest dv with the quickest run time<<<<<< \n') 
    fprintf('\nThe smallest delta-V for a return to earth is: %1.15f meters per second in the y direction and %1.15f meters per second in the x direction \n', x(2),x(1))
    dv = sqrt((x(2)^2+x(1)^2));
    fprintf('The smallest total delta-V is: %1.15f \n',dv)

    % Plot!
    plot_trajectory(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,x(1),x(2),1,relative_tolerance)
    
end

% Results for shortest time (most accurate)
if user_input == 1
    
    % Display!
    fprintf('\n >>>>>>This is the result for the shortest time with the most accurate result<<<<<< \n')
    fprintf('\nThe shortest time for a return trip to earth: %1.15f meters per second in the y direction and %1.15f meters per second in the x direction \n',y(2),y(1))
    [time] = get_time(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,y(1),y(2),relative_tolerance);
    fprintf('The shortest time is: %1.15f hours\n',time/3600)
    
    % Plot!
    plot_trajectory(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,y(1),y(2),2,relative_tolerance)
end

% Results for shortest time (quickest run time)
if user_input == 2
    
    % Display!
    fprintf('\n >>>>>>This is the result for the shortest time with the quickest run time<<<<<< \n')
    fprintf('\nThe shortest time for a return trip to earth: %1.15f meters per second in the y direction and %1.15f meters per second in the x direction \n',y(2),y(1))
    [time] = get_time(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,y(1),y(2),relative_tolerance);
    fprintf('The shortest time is: %1.15f hours\n',time/3600)
    
    % Plot!
    plot_trajectory(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,y(1),y(2),2,relative_tolerance)
end