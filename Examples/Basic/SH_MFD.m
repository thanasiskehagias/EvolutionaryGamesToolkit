% Initialization
clear; clc;

global B M eta
B=[4 1; 3 2]; 				% Stag Hunt
Strategies = ["Cooperate","Defect"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main
J=20;
ExpName='SH_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=200;
ExpName='SH_MFDRep2';GrName='Replicator 2 Dynamics';
[s,x]= EGTMFDynDisc(B,'Rep2',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);

J=20;
ExpName='SH_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=20;
ExpName='SH_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=20; eta=0.1;
ExpName='SH_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);
