%--------------------------------------------------------------------------%
%----------------- Simulation of a map using simulink model ---------------%
%--------------------------------------------------------------------------%
% this function can be used to simulate the following map
% x' = y
% y' = -x + (1-x^2)y
% for two initial values x0=3.2, y0=0 AND x0=0.2, y0=0
% using a Simulink model named "fig2_52_simulink"

% NOTE: before running this code, open the Simulink file "fig2_52_simulink"

% created December 2022
% This function can be used to reproduced figure 2-53 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all

set_param('fig2_49_simulink', 'StopTime', '100') % setting stop simulation time to 100 secs
set_param('fig2_49_simulink/Integrator1','InitialCondition','3.2')   % set the value of initial condition
set_param('fig2_49_simulink/Integrator2','InitialCondition','0')   % set the value of initial condition

sim('fig2_49_simulink')  % simulate the simulink file of the Logistic model 
load x;load y;

subplot(1,2,1)
plot(x(2,:))
xlabel('x'); ylabel('y')