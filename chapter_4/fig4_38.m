%--------------------------------------------------------------------------%
%----------------- Simulation of a map using simulink model ---------------%
%--------------------------------------------------------------------------%
% this function can be used to plot bifurcation diagram of Henon map

% considering b = 0.3, initial condition = 0
% using a Simulink model named "fig4_39_simulink"

% NOTE: before running this code, open the Simulink file "fig4_39_simulink"

% created December 2022
% This function can be used to reproduced figure 4-38 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021

clear all

set_param('fig4_39_simulink/b', 'Gain','0.3')   % set the value of b
set_param('fig4_39_simulink/UnitDelay','InitialCondition','0.1')   % set the value of initial condition
set_param('fig4_39_simulink/UnitDelay1','InitialCondition','0.1')   % set the value of initial condition

set_param('fig4_39_simulink', 'StopTime', '50') % setting stop simulation time to 20 secs
set_param('fig4_39_simulink/b', 'Gain','0.3')   % set the value of b

counter = 1;
for a = 1.05:0.0001:1.09
    set_param('fig4_39_simulink/a', 'Gain','a')   % set the value of bifurcation parameter a

    sim('fig4_39_simulink')  % simulate the simulink file of the Logistic model 
    load X % loading the output of the simulated model
    out(counter, :) = X(2,7000:end);
    counter = counter + 1;
end

% plot
a = 1.05:0.0001:1.09;
plot(a, out, '.')
xlabel('a'); ylabel('X')
xlim([1.05,1.095]); ylim([-1,1.5])
