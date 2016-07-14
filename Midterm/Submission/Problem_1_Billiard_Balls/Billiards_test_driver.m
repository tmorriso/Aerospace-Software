r = .1;
x1_0 = [.5 .5];
x2_0 = [.2 .8];
v1_0 = [.1 70];
v2_0 = [-60 -6];
e = 1;
n = 30;

[t,x1,x2] = billiards(x1_0, x2_0, v1_0, v2_0, r, e, n);

%{
% Plot
ball_1 = animatedline('Color', 'r', 'Marker', 'o', 'MarkerSize', r*150);
ball_2 = animatedline('Color', 'g', 'Marker', 'o', 'MarkerSize', r*150);
%circle_1 = animatedline('Color', 'r');
%circle(x2(i,1),x2(i,2),r)
p = .02;
set(gca, 'XLim', [0 ,1], 'YLim', [0,1]);
for i = 1:size(x1)
    pause(p);
    addpoints( ball_1, x1(i,1), x1(i,2) );
    addpoints( ball_2, x2(i,1), x2(i,2) );
   %addpoints(circle_1, circle(x1(i,1),x1(i,2),r) );

    %refreshdata
    drawnow
end
%}
%p =.07;
% Animate
for i = 1:size(x1)
    if t(i) ~= t(end)
        p =.07*(t(i+1)-t(i));
    end
    
  pause(p)  
  circle(x2(i,1),x2(i,2),r)
  hold on
  circle(x1(i,1),x1(i,2),r)
  hold off
end
