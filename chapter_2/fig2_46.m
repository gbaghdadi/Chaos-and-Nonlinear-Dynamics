%--------------------------------------------------------------------------%
%----------------- Simulation of a map using simulink model ---------------%
%--------------------------------------------------------------------------%
% this function can be used to simulate Van der pol oscilator
% x' = v
% v' = rv - x
% considering different values for r 
% using a Simulink model named "fig2_45_simulink"

% NOTE: before running this code, open the Simulink file "fig2_45_simulink"

% created December 2022
% This function can be used to reproduced figure 2-46 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021

clear all

set_param('fig2_45_simulink/r', 'Gain','-3')   % set the value of r
set_param('fig2_45_simulink/Integrator1','InitialCondition','-1.8')   % set the value of initial condition
set_param('fig2_45_simulink/Integrator2','InitialCondition','1.8')   % set the value of initial condition

set_param('fig2_45_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_45_simulink')  % simulate the simulink file of the Logistic model 
load x % loading the output of the simulated model
load v % loading the output of the simulated model

% plot
subplot(2,3,1)
plot(x(2,:), v(2,:))
hold on
plot(x(2,1), v(2,1),'o')
xlabel('X1'); ylabel('X2')
xlim([-2,2]); ylim([-2,2])
title('r = -3')

% ----- Changing the value of r to -0.1

set_param('fig2_45_simulink/r', 'Gain','-0.1')   % set the value of r
set_param('fig2_45_simulink/Integrator1','InitialCondition','-1.8')   % set the value of initial condition
set_param('fig2_45_simulink/Integrator2','InitialCondition','1.8')   % set the value of initial condition

set_param('fig2_45_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_45_simulink')  % simulate the simulink file of the Logistic model 
load x % loading the output of the simulated model
load v % loading the output of the simulated model

% plot
subplot(2,3,2)
plot(x(2,:), v(2,:))
hold on
plot(x(2,1), v(2,1),'o')
xlabel('X1'); ylabel('X2')
xlim([-2,2]); ylim([-2,2])
title('r = -0.1')

% ----- Changing the value of r to 0

set_param('fig2_45_simulink/r', 'Gain','0')   % set the value of r
set_param('fig2_45_simulink/Integrator1','InitialCondition','1')   % set the value of initial condition
set_param('fig2_45_simulink/Integrator2','InitialCondition','0.1')   % set the value of initial condition

set_param('fig2_45_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_45_simulink')  % simulate the simulink file of the Logistic model 
load x % loading the output of the simulated model
load v % loading the output of the simulated model

% plot
subplot(2,3,3)
plot(x(2,:), v(2,:))
hold on
plot(x(2,1), v(2,1),'o')
xlabel('X1'); ylabel('X2')
xlim([-2,2]); ylim([-2,2])
title('r = 0')

% ----- Changing the value of r to 0.6

set_param('fig2_45_simulink/r', 'Gain','0.6')   % set the value of r
set_param('fig2_45_simulink/Integrator1','InitialCondition','0.1')   % set the value of initial condition
set_param('fig2_45_simulink/Integrator2','InitialCondition','0.1')   % set the value of initial condition

set_param('fig2_45_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_45_simulink')  % simulate the simulink file of the Logistic model 
load x % loading the output of the simulated model
load v % loading the output of the simulated model

% plot
subplot(2,3,4)
plot(x(2,:), v(2,:))
hold on
plot(x(2,1), v(2,1),'o')
xlabel('X1'); ylabel('X2')
xlim([-2,2]); ylim([-2,2])
title('r = 0.6')

% ----- Changing the value of r to 4
set_param('fig2_45_simulink/r', 'Gain','4')   % set the value of r
set_param('fig2_45_simulink/Integrator1','InitialCondition','0.1')   % set the value of initial condition
set_param('fig2_45_simulink/Integrator2','InitialCondition','0.1')   % set the value of initial condition

set_param('fig2_45_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_45_simulink')  % simulate the simulink file of the Logistic model 
load x % loading the output of the simulated model
load v % loading the output of the simulated model

% plot
subplot(2,3,5)
plot(x(2,:), v(2,:))
hold on
plot(x(2,1), v(2,1),'o')
xlabel('X1'); ylabel('X2')
xlim([-5,5]); ylim([-15,15])
title('r = 4')
