%--------------------------------------------------------------------------%
%----------------- Simulation of a map using simulink model ---------------%
%--------------------------------------------------------------------------%
% this function can be used to simulate a map (x'= ux + x^3 -x^5) 
% considering two values for bifurcation parameters 
% (u = -2 and u = +2) and two values of initial condition (-0.5 and 1.4) 
% using a Simulink model named "fig2_31_simulink"

% NOTE: before running this code, open the Simulink file "fig2_31_simulink"

% created December 2022
% This function can be used to reproduced figure 2-32 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021

clear all

set_param('fig2_31_simulink/u','Gain','-2')   % set the value of A
set_param('fig2_31_simulink/Integrator','InitialCondition','-0.5')   % set the value of initial condition
set_param('fig2_31_simulink', 'StopTime', '9') % setting stop simulation time to 9 secs

sim('fig2_31_simulink')  % simulate the simulink file of the Logistic model 
load X % loading the output of the simulated model
load Xdot % loading the output of the simulated model

% plot
subplot(3,2,1)
plot(X(2,:), Xdot(2,:))
hold on
plot(X(2,1), Xdot(2,1),'o')
xlabel('X'); ylabel('X''')
xlim([-1,1]); ylim([-1,1])

subplot(3,2,2)
plot(X(1,:), X(2,:))
xlabel('t'); ylabel('X(t)')
ylim([-0.15,0.05])
grid on

% --------------------   Changing u to +2 
set_param('fig2_31_simulink/u','Gain','2')   % set the value of A
set_param('fig2_31_simulink/Integrator','InitialCondition','-0.5')   % set the value of initial condition
set_param('fig2_31_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_31_simulink')  % simulate the simulink file of the Logistic model 
load X % loading the output of the simulated model
load Xdot % loading the output of the simulated model

% plot
subplot(3,2,3)
plot(X(2,:), Xdot(2,:))
hold on
plot(X(2,1), Xdot(2,1),'o')
xlabel('X'); ylabel('X''')
xlim([-2,0.5]); ylim([-2,0.5])

subplot(3,2,4)
plot(X(1,:), X(2,:))
xlabel('t'); ylabel('X(t)')
ylim([-1.5,-0.5])
grid on


% --------------------   Changing initial condition to 0.6 
set_param('fig2_31_simulink/u','Gain','2')   % set the value of A
set_param('fig2_31_simulink/Integrator','InitialCondition','0.6')   % set the value of initial condition
set_param('fig2_31_simulink', 'StopTime', '20') % setting stop simulation time to 20 secs

sim('fig2_31_simulink')  % simulate the simulink file of the Logistic model 
load X % loading the output of the simulated model
load Xdot % loading the output of the simulated model

% plot
subplot(3,2,5)
plot(X(2,:), Xdot(2,:))
hold on
plot(X(2,1), Xdot(2,1),'o')
xlabel('X'); ylabel('X''')
xlim([0.5,1.7]); ylim([-0.5,2.2])

subplot(3,2,6)
plot(X(1,:), X(2,:))
xlabel('t'); ylabel('X(t)')
ylim([0.5,1.5])
grid on

