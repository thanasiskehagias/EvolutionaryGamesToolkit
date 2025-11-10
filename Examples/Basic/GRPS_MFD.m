% Initialization
clear; clc;

global B M eta
B = [0 -1 0 1;1 0 -1 0;0 1 0 -1; -1 0 1 0];			% Gen Rock-Scissors-Paper
Strategies = ["1","2","3","4"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main
%J=200;
%ExpName='GRPS_MFDRep2'; GrName='Replicator 2 Dynamics';
%[s,x]= EGTMFDynDisc(B,'Rep2',s0,J);
%GrDynX(s,x,Strategies,ExpName,GrName);

J=100;
ExpName='GRPS_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=100;
ExpName='GRPS_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=100;
ExpName='GRPS_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=200; eta=0.1;
ExpName='GRPS_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);
