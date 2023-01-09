%--------------------------------------------------------------------------%
%----------------- Simulation of Duffing map using simulink model ---------------%
%--------------------------------------------------------------------------%
% this function can be used to plot bifurcation diagram of Duffing map

% considering w = 1, delta = 1, gama = 0, 0.5, 2.5, 8, 15 initial condition = 0.1
% using a Simulink model named "fig5_5_simulink"

% NOTE: before running this code, open the Simulink file "fig5_5_simulink"

% created December 2022
% This function can be used to reproduced figure 5-6 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 


clear all
delta = 1;
w = 1;

set_param('fig5_5_simulink', 'StopTime', '50') % setting stop simulation time to 20 secs

counter = 1;
for gama = [0, 0.5, 2.5, 8, 15]
    set_param('fig5_5_simulink/gama', 'Gain','gama')   % set the value of bifurcation parameter a

    sim('fig5_5_simulink')  % simulate the simulink file of the Logistic model 
    load x % loading the output of the simulated model
    load y % loading the output of the simulated model
    subplot(5,2,counter)
    plot(x(1,:), x(2,:))
    xlabel('t'); ylabel('x(t)') 
    subplot(5,2,counter+1)
    plot(x(2,:), y(2,:))
    xlabel('x(t)'); ylabel('y(t)') 

    counter = counter + 2;
end

