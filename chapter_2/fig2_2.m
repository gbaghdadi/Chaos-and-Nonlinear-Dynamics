%--------------------------------------------------------------------------------------------%
%----------------- Simulation of the model x'= x*x - x using simulink model -----------------%
%--------------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of the model x'= x*x - x
% with two initial conditions (x(0)=0.9 abd x(0)=1.2)
% using a Simulink model named "fig2_1_simulink"

% NOTE: before running this code, open the Simulink file "fig2_1_simulink"

% created December 2022
% This function can be used to reproduced figure 2-2 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all


set_param('fig2_1_simulink/Integrator','InitialCondition','0.9')   % set the initial condition value of varaible X to 0.9
set_param('fig2_1_simulink', 'StopTime', '10') % setting stop simulation time to 10 secs
sim('fig2_1_simulink')  % simulate the simulink file of the  model
load x % loading the output of the simulated model

subplot(1,2,1)
plot(x(1,:), x(2,:))
xlabel('time'); ylabel('x'); title('x(0) = 0.9')

%********* changing the initial condition of x value from 0.9 to 1.2 and run
% the model again to see what will hapen for the trajectory in time domain
set_param('fig2_1_simulink/Integrator','InitialCondition','1.2')   % set the initial condition value of varaible x to 1.2
set_param('fig2_1_simulink', 'StopTime', '1.7') % setting stop simulation time to 1.7 secs
sim('fig2_1_simulink')  % simulate the simulink file of the  model

load x % loading the output of the simulated model

subplot(1,2,2)
plot(x(1,:), x(2,:))
xlabel('time'); ylabel('x'); title('x(0) = 1.2')
