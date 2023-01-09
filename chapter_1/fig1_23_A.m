%--------------------------------------------------------------------------------------%
%----------------- Bifurcation diagram of a map using simulink model ------------------%
%--------------------------------------------------------------------------------------%
% this function can be used to plot the bifurcation diagram of a map 
% (x'= ux + x^3 -x^5)
% using a Simulink model named "fig2_31_simulink"

% NOTE: before running this code, open the Simulink file "fig2_31_simulink"

% created December 2022
% This function can be used to reproduced figure 2-30 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021
clear all

k=1;
x = [];
for u = 0:0.01:4,   % A is the bifurcation parameter
    set_param('fig1_22_simulink/A','Gain','A')   % set the value of A
    sim('fig1_22_simulink')  % simulate the simulink file of the Logistic model 
    load out % loading the output of the simulated model
    x(:,k) = out(2,700:1000)'; % selected the output values at steady state
    k = k+1;
end

% plot the bifurcation diagram
A = 0:0.01:4
plot(A, x, '.')
xlabel('A'); ylabel('x')