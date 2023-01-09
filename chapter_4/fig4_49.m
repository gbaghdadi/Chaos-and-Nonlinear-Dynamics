% created December 2022
% This function can be used to reproduced figure 4-49 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021


clear all
in(1)=0.2; B = 5.821;
w1 = 1.487; w2 = 0.2223;
out=[];
for A=5:0.001:30
    clear in
    in(1)=0.2;
    for i=2:1000
        in(i) = (B*tanh(w1*in(i-1)) - A*tanh(w2*in(i-1))); 
    end
    out=[out;in(end-50:end)];
end
A=5:0.001:30;
plot(A,out,'.','MarkerSize',1)
xlabel('Control Parameter=A','FontName','Times New Roman','FontSize',11)
ylabel('Fixed points','FontName','Times New Roman','FontSize',11)

