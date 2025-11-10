% Initialization
clear; clc;

global B M eta
A=[3 1; 4 2];						% PD
T=1000;
Strategies = ["AllC","AllD", "Grim"];
B = MakePayoff(A,Strategies,T);
M=length(Strategies);
s0=[10 5 5];
J=100;

ExpName='IPD_SimRep1';GrName='Replicator 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='IPD_SimBNN';GrName='BNN MF Dynamics';
[s,x]=EGTSim1(B,'BNN',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='IPD_SimSmith';GrName='Smith MF Dynamics';
[s,x]=EGTSim1(B,'Smith',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

J=1000; eta=0.1;
ExpName='IPD_SimLogit';GrName='Logit MF Dynamics';
[s,x]=EGTSim1(B,'Logit',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);
