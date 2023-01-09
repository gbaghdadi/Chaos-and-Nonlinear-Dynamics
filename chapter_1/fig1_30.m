%----------------------------------------------------------------------------------------------------%
%----------------- Running Lorenz model in special conditions using simulink model ------------------%
%----------------------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of Lorenz model in special
% conditions (r = 160; p = 10; b = 8/3) initial conditions (X(0)=0; Y(0)=5; Z(0)=15)
% using a Simulink model named "fig1_26_simulink"

% NOTE: before running this code, open the Simulink file "fig1_26_simulink"

% created December 2022
% This function can be used to reproduced figure 1-30 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all

r = 160; p = 10; b = 8/3; % Lorenz model's parameters' value
set_param('fig1_26_simulink/r','Gain','r')   % set the value of r
set_param('fig1_26_simulink/p','Gain','p')   % set the value of p
set_param('fig1_26_simulink/b','Gain','b')   % set the value of b

set_param('fig1_26_simulink/integrator1','InitialCondition','0')   % set the initial condition value of varaible X to 0
set_param('fig1_26_simulink/integrator2','InitialCondition','5')   % set the initial condition value of varaible Y to 5
set_param('fig1_26_simulink/integrator3','InitialCondition','15')   % set the initial condition value of varaible Z to 15

set_param('fig1_26_simulink', 'StopTime', '40') % setting stop simulation time to 40 secs

sim('fig1_26_simulink')  % simulate the simulink file of the Lorenz model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model
load Z % loading the output of the simulated model


subplot(2,2,1)
plot(X(1,:), X(2,:))
xlabel('t'); ylabel('X'); title('(a)')
xlim([30 40])

subplot(2,2,2)
plot(Y(1,:), Y(2,:))
xlabel('t'); ylabel('Y'); title('(b)')
xlim([30 40])

subplot(2,2,3)
plot(Z(1,:), Z(2,:))
xlabel('t'); ylabel('Z'); title('(c)')
xlim([30 40])

subplot(2,2,4)
plot3(X(2,30000:end),Y(2,30000:end),Z(2,30000:end))
xlabel('X'); ylabel('Y'); zlabel('Z'); title('(d)')
view([56 57])
grid on