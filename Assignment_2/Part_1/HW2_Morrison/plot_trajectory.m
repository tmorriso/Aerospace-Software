%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @author: Tom Morrison Partner Jonathan Eble
% @date: February 3, 2015
% Assignment 2 Optimize function

% Description: This function plots the results depending on the objective
% and bonus points you are going after. It also serves as a validation that
% the optimal delta-v's obtained do in fact return the Spacecraft to Earth
% as it runs the simulation again using the optimized values.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_trajectory(vsx0,vsy0,vmx,vmy,xs,ys,xm,ym,dvsx,dvsy,objective,relative_tolerance)

% Velocities of the spaceship
vsx = vsx0+dvsx;                      % Spacecraft velocity in X-direction.
vsy = vsy0+dvsy;                      % Spacecraft velocity in Y-direction.

% Set simulation options
options = odeset('Events',@events1,'RelTol',relative_tolerance);
tspan = [0 1e10];
y0 = [vsx;vsy;vmx;vmy;xs;ys;xm;ym];

% Drive!
[t,y] = ode45(@(t,y)RHS(t,y),tspan,y0,options);

% Plot! 
sc_x_position = y(:,5);               % Spacecraft X-Coordinates
sc_y_position = y(:,6);               % Spacecraft Y-Coordinates
m_x_position = y(:,7);                % Moon X-Coordinates
m_y_position = y(:,8);                % Moon Y-Coordinates

% Plot spacecraft position
plot(sc_x_position, sc_y_position)
hold on

% Plot moon position
plot(m_x_position, m_y_position)

% Add axis labels
xlabel('X-Position meters')         
ylabel('Y-Position meters')         

% Add title
if objective == 1
    title('\fontsize{16}\color{black} Smallest Delta-V for return to Earth (meters/second) ')
elseif objective == 2
    title('\fontsize{16}\color{black} Shortest time for return to Earth (meters/second) ')
end
% Earth coordinates and radius
radius = 6371000;
earth_x_position = 0;
earth_y_position = 0;
theta = 0:pi/50:2*pi;

% Plot the Earth
xunit = radius * cos(theta) + earth_x_position;
yunit = radius * sin(theta) + earth_y_position;
plot(xunit, yunit);

% Add a legend
legend('Apollo Spaceship Path','Moon Path','Earth','location','southeast')   % Legend
hold off

end
