%----------------------------------------------------------------------------------------------------%
%----------------- Running Lorenz model in special conditions using simulink model ------------------%
%----------------------------------------------------------------------------------------------------%
% this function can be used to plot the behavior of Lorenz model in special
% conditions (r = 143; p = 10; b = 8/3) initial conditions (X(0)=20; Y(0)=0; Z(0)=163 & 166)
% using a Simulink model named "fig1_26_simulink"

% NOTE: before running this code, open the Simulink file "fig1_26_simulink"

% created December 2022
% This function can be used to reproduced figure 1-32 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all

r = 143; p = 10; b = 8/3; % Lorenz model's parameters' value
set_param('fig1_26_simulink/r','Gain','r')   % set the value of r
set_param('fig1_26_simulink/p','Gain','p')   % set the value of p
set_param('fig1_26_simulink/b','Gain','b')   % set the value of b

set_param('fig1_26_simulink/integrator1','InitialCondition','20')   % set the initial condition value of varaible X to 20
set_param('fig1_26_simulink/integrator2','InitialCondition','0')   % set the initial condition value of varaible Y to 0
set_param('fig1_26_simulink/integrator3','InitialCondition','163')   % set the initial condition value of varaible Z to 163

set_param('fig1_26_simulink', 'StopTime', '44') % setting stop simulation time to 44 secs

sim('fig1_26_simulink')  % simulate the simulink file of the Lorenz model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model
load Z % loading the output of the simulated model

subplot(2,1,1)
plot(Z(1,:), Z(2,:))
xlabel('t'); ylabel('Z'); title('Z(0)=163')
xlim([30 44]);ylim([50 200])
%********* changing the initial conditoon of Z value from 163 to 166 and run
% the model again to see what will hapen for the varaible Z in time domain
set_param('fig1_26_simulink/integrator2','InitialCondition','166')   % set the initial condition value of varaible Y to -1

sim('fig1_26_simulink')  % simulate the simulink file of the Lorenz model
load X % loading the output of the simulated model
load Y % loading the output of the simulated model
load Z % loading the output of the simulated model

subplot(2,1,2)
plot(Z(1,:), Z(2,:))
xlabel('t'); ylabel('Z'); title('Z(0)=166')
xlim([30 44]);ylim([50 200])
