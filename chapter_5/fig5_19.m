
% this function can be used to plot bifurcation diagram of sine-circle map
% considering omega = 0.606661, initial condition = 0

% created December 2022
% This function can be used to reproduced figure 5-19 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 


clear all
theta(1)=0; omega = 0.606661;
out=[];
for K=0:0.001:5.5
    clear theta
    theta(1)=0;
    for i=2:10000
        theta(i) = mod(theta(i-1) + omega - (K/(2*pi))*sin(2*pi*theta(i-1)), 1); 
    end
    out=[out;theta(end-100:end)];
end
K=0:0.001:5.5;
plot(K,out,'.','MarkerSize',1)
xlabel('K','FontName','Times New Roman','FontSize',11)
ylabel('\theta_n','FontName','Times New Roman','FontSize',11)


