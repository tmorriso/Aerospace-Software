function [t,x1,x2] = billiards(x1_0, x2_0, v1_0, v2_0, r, e, n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% @author: Tom Morrison
% @date: March, 16 2016
%
% Description: This function caculates the position vectors for two
% billiard balls interacting on a 1 by 1 meter table. The table is assumed
% to be frictionless, and the collision between the balls perfectly
% elastic. The collisions between the balls and the walls has a user
% defined coefficient of restitution (e).
%
%   Inputs: 
%           x1_0: is the initial position vector for ball 1
%           x2_0: is the initial position vector for ball 2
%           v1_0: is the initial velocity vector for ball 1
%           v2_0: is the initial velocity vector for ball 2
%           r   : is the radius of the balls
%           e   : is the coefficient of restitution for the walls
%           n   : is the desired number of collisions
%   Outputs:
%           t   : is the time vector
%           x1  : is the position vector for ball 1
%           x2  : is the position vector for ball 2
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global radius; % Couldn't think of a way to pass this to events function without pointers
radius = r;
c_e = e; % Change this to c_e to avoid confusion with exponentials
collisions = 0;
yes = 1;
no = 0;
balls_collided = no;
wall_hit = no;
corner_hit = no;
% Set simulation parameters
options = odeset ('Events',@Billiards_events,'RelTol',2.23e-7, 'AbsTol', 2.23e-14);
tspan = [0 1e10];
y0 = zeros(1,8);

while (collisions < n)

% Populate y0 vector with initial values
y0(1) = v1_0(1);
y0(2) = v1_0(2);
y0(3) = v2_0(1);
y0(4) = v2_0(2);
y0(5) = x1_0(1);
y0(6) = x1_0(2);
y0(7) = x2_0(1);
y0(8) = x2_0(2);


% Drive ODE45
[t,y,te,ye,ie] = ode45(@(t,y)Billiards_RHS_function(t,y),tspan,y0,options);


% Check if ye is empty if so report error!
if(isempty(ye) == 1)
   disp('There was an error ODE45 did not produce a solution vector')
end

% Add to solution vector
if collisions == 0;
    disp('adding intial array')
x1_position = y(:,5); 
y1_position = y(:,6);
x2_position = y(:,7);
y2_position = y(:,8);
time = t;
total_time = te;
elseif collisions ~= 0;
    disp('adding to array')
x1_position = [x1_position; y(:,5)];
y1_position = [y1_position; y(:,6)];
x2_position = [x2_position; y(:,7)];
y2_position = [y2_position; y(:,8)];
time = [time; total_time + t];
total_time = total_time + te;
end

% get positions "before" impact
x_1 = ye(5);
y_1 = ye(6);
x_2 = ye(7);
y_2 = ye(8);
vx_1 = ye(1);
vy_1 = ye(2);
vx_2 = ye(3);
vy_2 = ye(4);

% Re-set initial conditions for next iteration (This step is redundant can
% take out later)
x1_0(1) = ye(5);
x1_0(2) = ye(6);
x2_0(1) = ye(7);
x2_0(2) = ye(8);
v1_0(1) = ye(1);
v1_0(2) = ye(2);
v2_0(1) = ye(3);
v2_0(2) = ye(4);

% Get vectors for the current positions and velocities
    x1 = [x_1 y_1];
    x2 = [x_2 y_2];
    v1 = [vx_1 vy_1];
    v2 = [vx_2 vy_2];
% Get distance at impact.
d = sqrt((x_1-x_2)^2 + (y_1-y_2)^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% If balls collide reset positions and velocities accordingly
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (d < 2*radius)
    disp('balls collided')
    v1_0 = v1 - (dot((v1-v2),(x1-x2))/dot((x1-x2),(x1-x2)))*(x1-x2);
    v2_0 = v2 - (dot((v2-v1),(x2-x1))/dot((x2-x1),(x2-x1)))*(x2-x1);
   
    balls_collided = yes;
    collisions = collisions + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Determine if a ball hits a wall and reset velocities and positions
% accordingly. 
%
% I decided to break up each interaction for debugging purposes, so I could
% see exactly what interactions are happening and where the simulation
% breaks down.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ball 1 hit the right wall
if (ye(5) > 1-radius) 
    disp('ball 1 hit right wall')
    v1_0(1) = -1*c_e*vx_1;
    x1_0(1) = 1-radius; 
    wall_hit = yes;
    collisions = collisions + 1;
end
% ball 1 hit the left wall
if (ye(5) < 0+radius)
    disp('ball 1 hit left wall')
    v1_0(1) = -1*c_e*vx_1;
    x1_0(1) = 0+radius;
    wall_hit = yes;
    collisions = collisions + 1;
end
% ball 2 hits the right wall
if (ye(7) > 1-radius)
    disp('ball 2 hit right wall')
    v2_0(1) = -1*c_e*vx_2;
    x2_0(1) = 1-radius;
    wall_hit = yes;
    collisions = collisions + 1;
end
% ball 2 hits the left wall
if (ye(7) < 0+radius)
    disp('ball 2 hit left wall')
    v2_0(1) = -1*c_e*vx_2;
    x2_0(1) = 0+radius;
    wall_hit = yes;
    collisions = collisions + 1;
end   
% ball 1 hit the top
if (ye(6) > 1-radius)
    disp('ball 1 hit top')
    v1_0(2) = -1*c_e*vy_1;
    x1_0(2) = 1-radius;
    wall_hit = yes;
    collisions = collisions + 1;
end
% ball 1 hit the bottom
if (ye(6) < 0+radius)
    disp('ball 1 hit bottom')
    v1_0(2) = -1*c_e*vy_1;
    x1_0(2) = 0+radius;
    wall_hit = yes;
    collisions = collisions + 1;
end
% ball 2 hit top
if (ye(8) > 1-radius)
    disp('ball 2 hit top')
    v2_0(2) = -1*c_e*vy_2;
    x2_0(2) = 1-radius;
    wall_hit = yes;
    collisions = collisions + 1;
end
% ball 2 hit bottom
if (ye(8) < 0+radius)
    disp('ball 2 hit bottom')
    v2_0(2) = -1*c_e*vy_2;
    x2_0(2) = 0+radius;
    wall_hit = yes;
    collisions = collisions + 1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Extreme cases:
% Extreme cases needed to account for when the balls encounter multiple
% collisions at a time. 
%
% Case 1 considered:
%       Ball hits a corner -> Hitting a corner will count as two collisions
% Notes:
%       I added a fudge factor of 1.1 to the corners. If
%       the ball hits perfectly in a way that it si not picked up as a
%       corner hit, but is close ODE45 will trigger an event before the
%       next iteration takes place. So there will be no solution matrix
%       produced, Resulting in an error.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ball 1 hits upper right corner

if (ye(5) > 1-1.1*radius && ye(6) > 1-1.1*radius)
    disp('Ball 1 hit upper right Corner!')
    v1_0(1) = -1*c_e*vx_1;
    v1_0(2) = -1*c_e*vy_1;
    x1_0(1) = 1-radius;
    x1_0(2) = 1-radius;
    corner_hit = yes;
end

% Ball 2 hits upper right corner
if (ye(7) > 1-1.1*radius && ye(8) > 1-1.1*radius)
    disp('Ball 2 hit upper right Corner!')
    v2_0(1) = -1*c_e*vx_2;
    v2_0(2) = -1*c_e*vy_2;
    x2_0(1) = 1-radius; 
    x2_0(2) = 1-radius;
    corner_hit = yes;
end
% Ball 1 hits upper left corner
if (ye(5) < 0+1.1*radius && ye(6) > 1-1.1*radius)
    disp('Ball 1 hit upper left Corner!')
    v1_0(1) = -1*c_e*vx_1;
    v1_0(2) = -1*c_e*vy_1;
    x1_0(1) = 0+radius; 
    x1_0(2) = 1-radius;
    corner_hit = yes;
end
% Ball 2 upper left corner
if (ye(7) < 0+1.1*radius && ye(8) > 1-1.1*radius)
    disp('Ball 2 hit upper left Corner!')
    v2_0(1) = -1*c_e*vx_2;
    v2_0(2) = -1*c_e*vy_2;
    x2_0(1) =  0 + radius; 
    x2_0(2) =  1 - radius;
    corner_hit = yes;
end
% Ball 1 hits lower right corner
if (ye(5) > 1-1.1*radius && ye(6) < 0+1.1*radius)
    disp('Ball 1 hit lower right Corner!')
    
    v1_0(1) = -1*c_e*vx_1;
    v1_0(2) = -1*c_e*vy_1;
    x1_0(1) = 1 - 1.1*radius; 
    x1_0(2) = 0 + 1.1*radius;
    corner_hit = yes;
end
% Ball 2 hits lower right corner
if (ye(7) > 1-1.1*radius && ye(8) < 0+1.1*radius)
    disp('Ball 2 hit lower right Corner!')
    v2_0(1) = -1*c_e*vx_2;
    v2_0(2) = -1*c_e*vy_2;
    x2_0(1) = 1 - radius; 
    x2_0(2) = 0 + radius;
    corner_hit = yes;
end
% Ball 1 hits lower left corner
if (ye(5) < 0+1.1*radius && ye(6) < 0+1.1*radius)
    disp('Ball 1 hit lower left Corner!')
    v1_0(1) = -1*c_e*vx_1;
    v1_0(2) = -1*c_e*vy_1;
    x1_0(1) = 0 + radius; 
    x1_0(2) = 0 + radius;
    corner_hit = yes;
end
% Ball 2 hits lower left corner
if (ye(7) < 0+1.1*radius && ye(8) < 0+1.1*radius)
    disp('Ball 2 hit lower left Corner!')
    v2_0(1) = -1*c_e*vx_2;
    v2_0(2) = -1*c_e*vy_2;
    x2_0(1) = 0 + radius; 
    x2_0(2) = 0 + radius;
    corner_hit = yes;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Extreme Case:
%
%      Case 2 Considered:
%           The balls collide with eachother and a wall at the same time.
%
%       Notes: If this happens it could happen in many ways. Therefore, I
%       decided to report an error as this simulation would take much more
%       physics to handle an event of that nature.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (balls_collided == yes && wall_hit == yes)
    disp('Extreme Case 2 Occured!')
   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Extreme Case
%
%   Case 3 Considered:
%           The balls collide with each other and a corner at the same time
%
%   Notes:
%           If this happens report an error as solving this would be very
%           intensive and I would need more time. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (balls_collided == yes && wall_hit == yes && corner_hit == yes)
    disp('Extreme Case 3 Occured!')
    
end
    
balls_collided = no;
wall_hit = no;
corner_hit = no;

disp(collisions)


end

% Assign output vectors
t = time;
x1 = [x1_position y1_position];
x2 = [x2_position y2_position];

end









