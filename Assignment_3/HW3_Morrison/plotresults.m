axes(handles.axes15)
%Simple script to plot the results of the bistatic processing of the
%direct channel;  create two figures and plot important aspects
%figure(901)

subplot(2,1,1),plot(p_i .^2 + p_q .^ 2, 'g.-')
hold on
grid
subplot(2,1,1),plot(e_i .^2 + e_q .^ 2, 'bx-')
subplot(2,1,1),plot(l_i .^2 + l_q .^ 2, 'r+-')
hold off
xlabel('milliseconds')
ylabel('amplitude')
title('Correlation Results')
legend('prompt','early','late')
subplot(2,2,3),plot(p_i)
grid
xlabel('milliseconds')
ylabel('amplitude')
title('Prompt I Channel')
subplot(2,2,4),plot(p_q)
grid
xlabel('milliseconds')
ylabel('amplitude')
title('Prompt Q Channel')

% figure(902)
subplot(2,1,1),plot(1.023e6 - codefq)
grid
xlabel('milliseconds')
ylabel('Hz')
title('Tracked Code Frequency (Deviation from 1.023MHz)')
subplot(2,1,2),plot(carrierfq)
grid
xlabel('milliseconds')
ylabel('Hz')
title('Tracked Intermediate Frequency')
