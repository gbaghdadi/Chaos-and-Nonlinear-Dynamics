
% created December 2022
% This function can be used to reproduced figure 4-6 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021

% b = 1
% F = 2.048
% D = 2/3 

clear all

set_param('fig4_5_simulink', 'StopTime', '1000') % setting stop simulation time to 20 secs

sim('fig4_5_simulink')  % simulate the simulink file of the Logistic model 


[pks,locs] = findpeaks(F.Data);
% plot(v.Data(locs(1:end-1)),v.Data(locs(2:end)),'.')
% figure; plot(theta.Data(locs(1:end-1)),theta.Data(locs(2:end)),'.')

[pks,locs] = findpeaks(theta.Data);
plot(pks(1:end-1), pks(2:end),'.')
xlabel('\theta_m_a_x(n)')
ylabel('\theta_m_a_x(n+1)')