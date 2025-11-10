% Initialization
clear; clc;

global B M eta
B = [3 2 4;4 3 2;2 4 3];			% Circulant
Strategies = ["1","2","3"];

M=length(Strategies);
s0=randi(20,1,M);
%s0=[10 10];

%% Main
J=100;
ExpName='RPS_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=200;
ExpName='RPS_MFDRep2'; GrName='Replicator 2 Dynamics';
[s,x]= EGTMFDynDisc(B,'Rep2',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);

J=100;
ExpName='RPS_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=100;
ExpName='RPS_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=200; eta=0.1;
ExpName='RPS_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);
