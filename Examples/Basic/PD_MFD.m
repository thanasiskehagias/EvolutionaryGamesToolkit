% Initialization
clear; clc;

global B M eta
B=[3 1; 4 2]; 				% Prisoner's Dilemma
Strategies = ["Cooperate","Defect"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main
J=200;
ExpName='PD_MFDRep2';GrName='Replicator 2 Dynamics';
[s,x]= EGTMFDynDisc(B,'Rep2',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);

J=10;
ExpName='PD_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=10;
ExpName='PD_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=100;
ExpName='PD_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=200; eta=0.1;
ExpName='PD_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);
