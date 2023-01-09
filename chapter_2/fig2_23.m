%---------------------------------------------------------------------------------------%
%----------------- Simulation of the Lorenz model using simulink model -----------------%
%---------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of the Lorenz model in
% state space with values of r = 30, p =10, b = 8/3, and initial condition (0.6 0.6 -1)
% using a Simulink model named "fig2_21_simulink"

% NOTE: before running this code, open the Simulink file "fig2_21_simulink"

% created December 2022
% This function can be used to reproduced figure 2-23 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all

set_param('fig2_21_simulink/Integrator1','InitialCondition','0')   % set the initial condition to [0 0 0]
set_param('fig2_21_simulink/Integrator1','InitialCondition','0')   
set_param('fig2_21_simulink/Integrator2','InitialCondition','0')   

r = 30;
set_param('fig2_21_simulink/r','Gain','r')    % set the value of Gain1 to B+1

set_param('fig2_21_simulink', 'StopTime', '100') % setting stop simulation time to 100 secs

sim('fig2_21_simulink')  % simulate the simulink file of the  model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model
load Z % loading the output of the simulated model

subplot(1,3,1)
plot(X(2,:), Z(2,:))
xlabel('X'); ylabel('Z'); 
xlim([-20 22]); ylim([0 50]); title('XZ Graph')

subplot(1,3,2)
plot(Y(2,:), Z(2,:))
xlabel('Y'); ylabel('Z'); title('YZ Graph')
xlim([-20 22]); ylim([0 60])

subplot(1,3,3)
plot(X(2,:), Y(2,:))
xlabel('X'); ylabel('Y');
xlim([-20 22]); ylim([-20 30]); title('XY Graph')
