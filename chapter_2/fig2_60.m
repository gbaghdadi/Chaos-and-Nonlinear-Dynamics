
% created December 2022
% This function can be used to reproduced figure 2-60 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021

clear all

y0 = [0.5; 0.5];yy=[];
dt=0.1;k=1;

landa=-0.2;p=1;
tspan=[0 60];
ode = @(t,y) vanderpoldODE(t,y,landa,p);
[t,y] = ode45(ode, tspan, y0);

figure;

t2=t;
subplot(3,2,1)
plot(t2,y(:,1))
xlabel('time')
ylabel('Y')
title(' \lambda = -0.2 , p = 1')
% hold on
% figure;
subplot(3,2,2)
plot(y(:,1),y(:,2))
xlabel('Y')
ylabel('X')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
landa=0.2;p=1;
tspan=[0 60];
ode = @(t,y) vanderpoldODE(t,y,landa,p);
[t,y] = ode45(ode, tspan, y0);

% Plot of the solution
t2=t;
subplot(3,2,3)
plot(t2,y(:,1))
xlabel('time')
ylabel('Y')
title(' \lambda = 0.2 , p = 1')
% hold on
% figure;
subplot(3,2,4)
plot(y(:,1),y(:,2))
xlabel('Y')
ylabel('X')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
landa=0.2;p=2;
tspan=[0 60];
ode = @(t,y) vanderpoldODE(t,y,landa,p);
[t,y] = ode45(ode, tspan, y0);

% Plot of the solution
t2=t;
subplot(3,2,5)
plot(t2,y(:,1))
xlabel('time')
ylabel('Y')
title(' \lambda = 0.2 , p = 2')
% hold on
% figure;
subplot(3,2,6)
plot(y(:,1),y(:,2))
xlabel('Y')
ylabel('X')
set(gcf,'Color','white')
