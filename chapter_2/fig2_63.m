% created December 2022
% This function can be used to reproduced figure 2-60 of the book
% titled "Chaos and Nonlinear Dynamics: systems analysis and signals quantification", 
% written by Ali Motie Nasrabadi and Golnaz Baghdadi 
% in Persion 2021


% ---------- NOTE: this code is for a genral model and some parts of it do not relate to this figure

clear all; %close all
inx=1;
t_DE=0;
%%% stimuli
d=1;
stimuli=d;
%visiual=1  %auditory=0
% Modality=[1 1 1 0 0 0 0 1 0 1 0 0 1 1 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1];
Modality=1;
%%% First Step
A_S = 0;
w_S = 6;       

w_STM1_V=6;   % frequecy value that reperesents visual 1
w_STM2_V=8;   % frequecy value that reperesents visual 2
w_STM1_A=7;   % frequecy value that reperesents auditory 1
w_STM2_A=9;   % frequecy value that reperesents auditory 2

%--------------------------------------
landa_1_V=0.2;  % landa value in vanderpol eq. that reperesents visual 1
p_1_V =w_STM1_V; % frequecy (p) value in vanderpol eq. that reperesents visual 1
B_1_V= 1.5;   % coupling weight for visual 1

y_1_V=0.5;
x_1_V=0.5;
out_1_V(1)=y_1_V;

landa_2_V =0.2;  % landa value in vanderpol eq. that reperesents visual 2
p_2_V=w_STM2_V;  % frequecy (p) value in vanderpol eq. that reperesents visual 2
B_2_V=1.5; % coupling weight for visual 2

y_2_V=0.5;
x_2_V=0.5;
out_2_V(1)=y_2_V;

%-------------------------------------
landa_1_A=0.2;   % landa value in vanderpol eq. that reperesents auditory 1
p_1_A =w_STM1_A; % frequecy (p) value in vanderpol eq. that reperesents auditory 1
B_1_A=1.5; % coupling weight for auditory 1

y_1_A=0.5;
x_1_A=0.5;
out_1_A(1)=y_1_A;

landa_2_A =0.2;  % landa value in vanderpol eq. that reperesents auditory 2
p_2_A=w_STM2_A;  % frequecy (p) value in vanderpol eq. that reperesents auditory 2
B_2_A=1.5; % coupling weight for auditory 2

y_2_A=0.5;
x_2_A=0.5;
out_2_V(1)=y_2_A;

%-------------------------------------------
%-------------------------------------------
t_stim=0;
t_stim_pres=0;
t_ISI=0;
tt=0;
dt = 0.01;   %sample interval
t = -0.01;
T_present=20;  %stimulus presentation time
T_isi=100;  %inter stimulus interval
T_start=2;
T_end=(20*dt)+T_isi*(1/dt)*length(stimuli);
flag_start_stim=0;


for i= T_start:T_end
    t = t + dt;
    time(i)=t;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %------------Stimulation-------------%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (t>20) & (t_stim_pres<T_present) & (t_ISI<T_isi)  %t=20 just delay for begining the test
            if flag_start_stim==0
                time_ST=t;
                flag_start_stim=1;
            end
            A_S=1;
            w_S =w_STM1_V; 
            STIM(i)=1;
    elseif (t_stim_pres>T_present) & (t_ISI<T_isi)    % the gap between two presentation
        flag_stimuli=0;
        flag_start_stim=0;
        Flag_decision=0;
        A_S=0;
        B_1_V=0;
        B_2_V=0;
        B_1_A=0;
        B_2_A=0;
        STIM(i)=0;
    elseif (t_ISI>T_isi)    % start new presentation
        t_ISI=0;
        t_stim_pres=0;
        count=count+1
        tt=0;
    end
    if (t>20)
        t_stim_pres=t_stim_pres+dt;
        t_ISI=t_ISI+dt;
    end
%%%%&&&
    k=0;
    %   input
    x_S= A_S * sin(w_S * t);
    input(i)=x_S;
    
   %% ------------------------------- %%
   %%%%%%%% Attention resourse %%%%%%%%%
   %-----------------------------------%
   % Visual Target and Non-Target
   x_1_V=dt*((landa_1_V-y_1_V.^2)*x_1_V-p_1_V.^2*y_1_V+...
       B_1_V*x_S)+...
       x_1_V;
   y_1_V = dt * (x_1_V) + y_1_V;
     
   out_1_V(i)=y_1_V;
        
   x_2_V=dt*((landa_2_V-y_2_V.^2)*x_2_V-p_2_V.^2*y_2_V+...
       B_2_V*x_S)+...         
       x_2_V;
   y_2_V = dt * (x_2_V) + y_2_V;
   
   out_2_V(i)=y_2_V;
   %----------------------------------%
   %----------------------------------%
   % Auditory Target and Non-Target
   x_1_A=dt*((landa_1_A-y_1_A.^2)*x_1_A-p_1_A.^2*y_1_A+...
       B_1_A*x_S)+...
       x_1_A;
   y_1_A = dt * (x_1_A) + y_1_A;
     
   out_1_A(i)=y_1_A;
        
   x_2_A=dt*((landa_2_A-y_2_A.^2)*x_2_A-p_2_A.^2*y_2_A+...
       B_2_A*x_S)+...         
       x_2_A;
   y_2_A = dt * (x_2_A) + y_2_A;
   
   out_2_A(i)=y_2_A;

end
%-----------------------------------------------------------------------
figure;plot(out_1_V,'r')
hold on
plot(out_2_V)
%%%%%%%% attention source
diff_1_V=diff(out_1_V);
diff_2_V=diff(out_2_V);

diff_1_A=diff(out_1_A);
diff_2_A=diff(out_2_A);

diff_in=diff(input);

k=1;
for i=1:length(diff_1_V)-1
    if (sign(diff_1_V(i))~=sign(diff_1_V(i+1))) && (out_1_V(i)>0)
        push_1_V(k)=out_1_V(i);
        index_1_V(k)=time(i);
        k=k+1;
    end
end
%%%
k=1;
for i=1:length(diff_2_V)-1
    if (sign(diff_2_V(i))~=sign(diff_2_V(i+1))) && (out_2_V(i)>0)
        push_2_V(k)=out_2_V(i);
        index_2_V(k)=time(i);
        k=k+1;
    end
end
%%%
k=1;
for i=1:length(diff_1_A)-1
    if (sign(diff_1_A(i))~=sign(diff_1_A(i+1))) && (out_1_A(i)>0)
        push_1_A(k)=out_1_A(i);
        index_1_A(k)=time(i);
        k=k+1;
    end
end

%%%
k=1;
for i=1:length(diff_2_A)-1
    if (sign(diff_2_A(i))~=sign(diff_2_A(i+1))) && (out_2_A(i)>0)
        push_2_A(k)=out_2_A(i);
        index_2_A(k)=time(i);
        k=k+1;
    end
end
%%%
k=1;
for i=1:length(diff_in)-1
    if (sign(diff_in(i))~=sign(diff_in(i+1))) && (input(i)>0)
        push_in(k)=input(i);
        index_in(k)=time(i);
        k=k+1;
    end
end

figure;
hold on
plot(index_1_V(T_start:end),push_1_V(T_start:end),'b')
plot(index_2_V(T_start:end),push_2_V(T_start:end),'k')


plot(time,STIM*0.1,'Color','r','LineWidth',2)
set(gcf,'Color','white')
%set(gca,'FontSize',10)
ylabel('Push of Units'' Activity')
xlabel('Time')
legend({'Unit 1','Unit 2','Input onset and duration'},'Location','Best','FontSize',8)
%title('\bf \fontname{Arial} \fontsize{12} B = 1.5;\Omega1 \approx \omega1 = 6; \omega2 = 8; IC=0.5')