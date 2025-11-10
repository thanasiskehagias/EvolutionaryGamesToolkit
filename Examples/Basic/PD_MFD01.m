clear; clc;
global B M eta
B=[3 1; 4 2]; 												% Prisoner's Dilemma
Strategies = ["Cooperate","Defect"];
M=length(Strategies);
s0=[12 8];

J=20;
ExpName='PD_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDynX(s,x,t,Strategies,ExpName,GrName);

J=200;
ExpName='PD_SimRep1';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);
