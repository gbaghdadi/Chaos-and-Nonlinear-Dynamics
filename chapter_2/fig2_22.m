%---------------------------------------------------------------------------------------%
%----------------- Simulation of the Lorenz model using simulink model -----------------%
%---------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of the Lorenz model in
% state space with values of r = 0.5, p =10, b = 8/3, and initial condition (0.6 0.6 -1)
% using a Simulink model named "fig2_21_simulink"

% NOTE: before running this code, open the Simulink file "fig2_21_simulink"

% created December 2022
% This function can be used to reproduced figure 2-22 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all

set_param('fig2_21_simulink/Integrator1','InitialCondition','0.6')   % set the initial condition to [0.6 0.6 -1]
set_param('fig2_21_simulink/Integrator1','InitialCondition','0.6')   
set_param('fig2_21_simulink/Integrator2','InitialCondition','-1')   

r = 0.5;
set_param('fig2_21_simulink/r','Gain','r')    % set the value of Gain1 to B+1

set_param('fig2_21_simulink', 'StopTime', '30') % setting stop simulation time to 30 secs

sim('fig2_21_simulink')  % simulate the simulink file of the  model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model
load Z % loading the output of the simulated model

subplot(1,3,1)
plot(X(2,:), Y(2,:))
xlabel('X'); ylabel('Y'); 
xlim([-1 1]); ylim([-1 1])
hold on; plot(0.6, 0.6, 'o')

subplot(1,3,2)
plot(X(2,:), Z(2,:))
xlabel('X'); ylabel('Z'); title('r = 0.5')
xlim([-1 1]); ylim([-1 1])
hold on; plot(0.6, -1, 'o')

subplot(1,3,3)
plot(Y(2,:), Z(2,:))
xlabel('Y'); ylabel('Z');
xlim([-1 1]); ylim([-1 1])
hold on; plot(0.6, -1, 'o')
