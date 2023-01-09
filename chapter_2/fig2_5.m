%-----------------------------------------------------------------------------------------------------%
%----------------- Simulation of the model x" + x' + x(x-1) = 0 using simulink model -----------------%
%-----------------------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of the model x" + x' + x(x-1) = 0 
% with two initial conditions ([-0.5 1.5] and x(0)=[-1 1.5])
% using a Simulink model named "fig2_1_simulink"

% NOTE: before running this code, open the Simulink file "fig2_4_simulink"

% created December 2022
% This function can be used to reproduced figure 2-5 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all


set_param('fig2_4_simulink/Integrator1','InitialCondition','1.5')   % set the initial condition to [-0.5 1.5]
set_param('fig2_4_simulink/Integrator2','InitialCondition','-0.5')   

set_param('fig2_4_simulink', 'StopTime', '10') % setting stop simulation time to 10 secs
sim('fig2_4_simulink')  % simulate the simulink file of the  model
load x % loading the output of the simulated model
load xdot % loading the output of the simulated model

subplot(1,2,1)
plot(x(2,:), xdot(2,:))
xlabel('x'); ylabel('x'''); title('initial condition = [-0.5 , 1.5]')
xlim([-2 2]); ylim([-1.6 1.6])
hold on; plot(-0.5, 1.5, 'o')

%********* changing the initial condition of x value from 0.9 to 1.2 and run
% the model again to see what will hapen for the trajectory in state space x-x'
set_param('fig2_4_simulink/Integrator1','InitialCondition','1.5')   % set the initial condition to [-1 1.5]
set_param('fig2_4_simulink/Integrator2','InitialCondition','-1')   
set_param('fig2_4_simulink', 'StopTime', '3') % setting stop simulation time to 3 secs

sim('fig2_4_simulink')  % simulate the simulink file of the  model

load x % loading the output of the simulated model
load xdot % loading the output of the simulated model

subplot(1,2,2)
plot(x(2,:), xdot(2,:))
xlabel('x'); ylabel('x'''); title('initial condition = [-1 , 1.5]')
xlim([-2 2]); ylim([-1.6 1.6])
hold on; plot(-1, 1.5, 'o')
