% Initialization
clear; clc;

global B M eta
A=[3 1; 4 2];						% PD
T=1000;
Strategies = ["AllC","AllD","HardTfT","PerCCD","PerDDC","PerKind","Alternator","Grim"];
B = MakePayoff(A,Strategies,T);
M=length(Strategies);
s0=[10 5 5 10 5 5 10 10];
J=300;

ExpName='IPD8_SimRep1';GrName='Replicator 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='IPD8_SimBNN';GrName='BNN MF Dynamics';
[s,x]=EGTSim1(B,'BNN',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='IPD8_SimSmith';GrName='Smith MF Dynamics';
[s,x]=EGTSim1(B,'Smith',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

J=1000; eta=0.1;
ExpName='IPD8_SimLogit';GrName='Logit MF Dynamics';
[s,x]=EGTSim1(B,'Logit',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);
