%---------------------- RQA --------------------%
% more details can be find in 
% https://tocsy.pik-potsdam.de/CRPtoolbox/

x = randn(1,1000);  % replace by your signal
crp(x)              % GUI for recurrent plot

y=crqa(x);
% y(:,1)	-	Recurrence rate.
% y(:,2)	-	Determinism.
% y(:,3)	-	Averaged diagonal length.
% y(:,4)	-	Length of the longest diagonal line.
% y(:,5)	-	Entropy of diagonal length.
% y(:,6)	-	Laminarity.
% y(:,7)	-	Trapping time.
% y(:,8)	-	Length of the longest vertical line.
% y(:,9)	-	Recurrence time of 1st type.
% y(:,10)	-	Recurrence time of 2nd type.
% y(:,11)	-	Recurrence period density entropy.
% y(:,12)	-	Clustering coefficient.
% y(:,13)	-	Transitivity.
RR=y(1);
DET=y(2);
L=y(3);
LMAX=y(4);
ENTR=y(5);
LAM=y(6);
TT=y(7);                
Vmax=y(8);
T1=y(9);
T2=y(10);
RTE=y(11);
CLUST=y(12);              
TRANS=y(13);