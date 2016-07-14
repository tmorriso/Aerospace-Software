%Thomas Morrison, Noel Puldon
%ASEN 4519 - LAb6
%
%Plot optimal solution from data file
%%
clc; clearvars; close all;



data = load('Optimum_2_10000_0p5.txt');

str = 'Apollo 13 Simulation \n Objective 2';

%% GIF Image 
%Plot Earth
h = figure(1);
hold on;
plot(0,0,'og','MarkerSize',25,'MarkerFaceColor',[.2 .5 0],'MarkerEdgeColor','k');
title(sprintf(str))
xlabel('Distance [m]')
ylabel('Distance [m]')
axis([-.25E8 3E8 -.25E8 4E8 ]);
set(gcf,'defaulttextInterpreter','latex')
set(gca,'XminorTick','on','YminorTick','on')
filename = 'testgif1.gif';

%Plot Moon and S/C
for i = 1:20:length(data(:,1))-20
    if i == 1
        plot(data(i:i+20,2),data(i:i+20,3),'-r',data(i,4),data(i,5),...
            'o','MarkerFaceColor',[0.4,0.4,0.4],'MarkerEdgeColor','k')
        [hleg1, hobj1] = legend('Earth','Apollo','Moon',...
            'Interpreter','latex','Location','Southeast');
        set(hleg1,'position',[.75503 .16 .1025 .335])
        drawnow
        frame = getframe(1);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1;
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append');
        end
    else
        
        plot(data(i:i+20,2),data(i:i+20,3),'-r',data(i,4),data(i,5),'o',...
            'MarkerFaceColor',[0.4,0.4,0.4],'MarkerEdgeColor','k')
        drawnow
        frame = getframe(1);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1;
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append');
        end
    end
    
end