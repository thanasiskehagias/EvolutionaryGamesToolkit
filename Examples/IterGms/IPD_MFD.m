% Initialization
clear; clc;

global B M eta
A=[3 1; 4 2];						% PD
T=1000;
Strategies = ["AllC","AllD", "Grim"];
B = MakePayoff(A,Strategies,T);
M=length(Strategies);
s0=[10 5 5];
J=0.1;

ExpName='IPD_MFDRep1';GrName='Replicator 1 Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

ExpName='IPD_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

ExpName='IPD_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=10; eta=100;
ExpName='IPD_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);
