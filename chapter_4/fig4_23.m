%--------------------------------------------------------------------------%
%----------------- Simulation of a map using simulink model ---------------%
%--------------------------------------------------------------------------%
% this function can be used to plot bifurcation diagram of Gausian map

% considering b = -4, initial condition = 0
% using a Simulink model named "fig4_22_simulink"

% NOTE: before running this code, open the Simulink file "fig4_22_simulink"

% created December 2022
% This function can be used to reproduced figure 4-23 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021

clear all

set_param('fig4_22_simulink/b', 'Gain','-4')   % set the value of b
set_param('fig4_22_simulink/UnitDelay','InitialCondition','0')   % set the value of initial condition

set_param('fig4_22_simulink', 'StopTime', '50') % setting stop simulation time to 20 secs

counter = 1;
for C = -1:0.01:1
    set_param('fig4_22_simulink/C', 'Value','C')   % set the value of b
    sim('fig4_22_simulink')  % simulate the simulink file of the Logistic model 
    load X % loading the output of the simulated model
    out(counter, :) = X(2,7000:end);
    counter = counter + 1;
end

% plot
C = -1:0.01:1
plot(C, out, '.')
xlabel('C'); ylabel('X')
xlim([-1,1]); ylim([-1,1.5])
