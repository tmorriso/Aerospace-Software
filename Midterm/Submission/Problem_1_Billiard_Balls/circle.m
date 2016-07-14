function circle(x,y,r)
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);

plot(x+xp,y+yp,'LineWidth',4);
hold on
set(gca, 'XLim', [0 ,1], 'YLim', [0,1]);
hold off
end