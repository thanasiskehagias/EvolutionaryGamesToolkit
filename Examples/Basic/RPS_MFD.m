% Initialization
clear; clc;

global B M eta
B = [0 -1 1;1 0 -1;-1 1 0];							% Rock-Paper-Scissors
Strategies = ["Rock","Paper","Scissors"];
M=length(Strategies);
s0=[10 5 5];
%s0=randi(10,1,M);
J=20

%% Main
ExpName='RPS_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

ExpName='RPS_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

ExpName='RPS_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

eta=0.1;
ExpName='RPS_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

