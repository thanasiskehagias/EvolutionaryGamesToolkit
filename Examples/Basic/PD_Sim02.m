% Initialization
clc; clear all

global B M eta
B=[3 1; 4 2]; 				% PD
J=200;
Strategies = ["Cooperate","Defect"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main
ExpName='PD_SimBR';GrName='Best Response Simulation';
[s,x]=EGTSim1(B,'BR',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='PD_SimRep2';GrName='Replicator Type 2 Simulation';
[s,x]=EGTSim1(B,'Rep2',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='PD_SimRep1';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='PD_SimBNN';GrName='Brown-von Neumann-Nash Simulation';
[s,x]=EGTSim1(B,'BNN',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='PD_SimSmith';GrName='Smith Simulation';
[s,x]=EGTSim1(B,'Smith',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

eta=0.1;
ExpName='PD_SimLogit';GrName='Logit Simulation';
[s,x]=EGTSim1(B,'Logit',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);
