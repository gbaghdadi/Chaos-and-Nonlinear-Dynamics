%--------------------------------------------------------------------------------------------%
%----------------- Simulation of the Brusselator model using simulink model -----------------%
%--------------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of the Brusselator model 
% with two values of B = 1 and 2.1
% using a Simulink model named "fig2_1_simulink"

% NOTE: before running this code, open the Simulink file "fig2_18_simulink"

% created December 2022
% This function can be used to reproduced figure 2-19 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all


set_param('fig2_18_simulink/Integrator1','InitialCondition','1.5')   % set the initial condition to [1.5 1.5]
set_param('fig2_18_simulink/Integrator2','InitialCondition','1.5')   

B = 1;
set_param('fig2_18_simulink/Gain1','Gain','B+1')    % set the value of Gain1 to B+1
set_param('fig2_18_simulink/Gain2','Gain','B')    % set the value of Gain2 to B

set_param('fig2_18_simulink', 'StopTime', '30') % setting stop simulation time to 30 secs

sim('fig2_18_simulink')  % simulate the simulink file of the  model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model

subplot(1,2,2)
plot(X(2,:), Y(2,:))
xlabel('X'); ylabel('Y'); title('B=1 , fixed point = [1, 1], Spiral attractor')
xlim([0 2]); ylim([0 2])

%********* changing the value of B and run
% the model again to see what will hapen for the trajectory in state space x-y
set_param('fig2_18_simulink/Integrator1','InitialCondition','2')   % set the initial condition to [2 3]
set_param('fig2_18_simulink/Integrator2','InitialCondition','3')   

B = 2.1;
set_param('fig2_18_simulink/Gain1','Gain','B+1')    % set the value of Gain1 to B+1
set_param('fig2_18_simulink/Gain2','Gain','B')    % set the value of Gain2 to B

set_param('fig2_18_simulink', 'StopTime', '30') % setting stop simulation time to 30 secs

sim('fig2_18_simulink')  % simulate the simulink file of the  model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model

subplot(1,2,1)
plot(X(2,:), Y(2,:))
xlabel('X'); ylabel('Y'); title('B=1 , fixed point = [1, 2.1], Limit cycle attractor')
xlim([0 3]); ylim([0 3])
