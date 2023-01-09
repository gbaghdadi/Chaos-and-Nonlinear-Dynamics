%---------------------------------------------------------------------------------------%
%----------------- Simulation of the Lorenz model using simulink model -----------------%
%---------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of the Lorenz model in
% state space with values of r = 30, p =10, b = 8/3, and initial condition (-10 -10 30)
% using a Simulink model named "fig2_21_simulink"

% NOTE: before running this code, open the Simulink file "fig2_21_simulink"

% created December 2022
% This function can be used to reproduced figure 2-24 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all

set_param('fig2_21_simulink/Integrator1','InitialCondition','-18')   % set the initial condition to [-10 -10 30]
set_param('fig2_21_simulink/Integrator1','InitialCondition','-10')   
set_param('fig2_21_simulink/Integrator2','InitialCondition','30')   

r = 30;
set_param('fig2_21_simulink/r','Gain','r')    % set the value of Gain1 to B+1

set_param('fig2_21_simulink', 'StopTime', '100') % setting stop simulation time to 100 secs

sim('fig2_21_simulink')  % simulate the simulink file of the  model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model
load Z % loading the output of the simulated model

subplot(3,1,1)
plot(X(1,:), X(2,:))
xlabel('time'); ylabel('X'); 
xlim([30 70]); ylim([-20 25]); grid on

subplot(3,1,2)
plot(Y(1,:), Y(2,:))
xlabel('time'); ylabel('Y'); 
xlim([25 65]); ylim([-20 40]); grid on

subplot(3,1,3)
plot(Z(1,:), Z(2,:))
xlabel('time'); ylabel('Z');
xlim([20 60]); ylim([0 60]); grid on
