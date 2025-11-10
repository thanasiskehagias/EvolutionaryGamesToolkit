% Initialization
clc; clear all

global B M eta
B=[4 1; 3 2]; 				% Stag Hunt
J=200;
Strategies = ["Cooperate","Defect"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main
ExpName='SH_SimBR';GrName='Best Response Simulation';
[s,x]=EGTSim1(B,'BR',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='SH_SimRep1';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='SH_SimRep2';GrName='Replicator Type 2 Simulation';
[s,x]=EGTSim1(B,'Rep2',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='SH_SimBNN';GrName='Brown-von Neumann-Nash Simulation';
[s,x]=EGTSim1(B,'BNN',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='SH_SimSmith';GrName='Smith Simulation';
[s,x]=EGTSim1(B,'Smith',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

eta=0.1;
ExpName='SH_SimLogit';GrName='Logit Simulation';
[s,x]=EGTSim1(B,'Logit',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);
