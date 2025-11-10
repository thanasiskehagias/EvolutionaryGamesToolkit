% Initialization
clear; clc;

global B M eta
B = [0 -1 1 1 -1;1 0 -1 -1 1;-1 1 0 1 -1;-1 1 -1 0 1;1 -1 1 -1 0];		% Rock-Paper-Scissors-Lizard-Spock
Strategies = ["1","2","3","4","5"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main

J=100;
ExpName='RPSLS_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=100;
ExpName='RPSLS_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=100;
ExpName='RPSLS_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=200; eta=0.1;
ExpName='RPSLS_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);
