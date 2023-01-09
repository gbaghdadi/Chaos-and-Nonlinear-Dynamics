%--------------------------------------------------------------------------%
%----------------- Simulation of a map using simulink model ---------------%
%--------------------------------------------------------------------------%
% this function can be used to simulate a map
% x' = -y + x {1 - (x^2 + y^2)}
% y' = +x + y {1 - (x^2 + y^2)}
% considering u = 4, -1, 0 
% using a Simulink model named "fig2_50_simulink"

% NOTE: before running this code, open the Simulink file "fig2_50_simulink"

% created December 2022
% This function can be used to reproduced figure 2-51 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021

clear all

% set_param('fig2_50_simulink/u', 'Value','4')   % set the value of u
set_param('fig2_50_simulink/Integrator1','InitialCondition','1.8')   % set the value of initial condition
set_param('fig2_50_simulink/Integrator2','InitialCondition','1.8')   % set the value of initial condition

set_param('fig2_50_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_50_simulink')  % simulate the simulink file of the Logistic model 
load x % loading the output of the simulated model
load y % loading the output of the simulated model

% plot
plot(x(2,:), y(2,:))
hold on
plot(x(2,1), y(2,1),'o')
xlabel('x'); ylabel('y')
xlim([-2,2]); ylim([-2,2])
