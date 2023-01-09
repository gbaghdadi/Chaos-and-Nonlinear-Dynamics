
% this function can be used to plot bifurcation diagram of logistic map
% x(n+1) = A* x(n)* (1-x(n))
% created December 2022
% This function can be used to reproduced figure 5-18 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 


clear all
x(1)=0; 
out=[];
for A=3.82:0.001:3.87
    clear x
    x(1)=0;
    for i=2:10000
        x(i) = A* x(i-1)* (1-x(i-1))
    end
    out=[out;x(end-100:end)];
end
A=3.82:0.001:3.87;
plot(A,out,'.','MarkerSize',1)
xlabel('A','FontName','Times New Roman','FontSize',11)
ylabel('X','FontName','Times New Roman','FontSize',11)

