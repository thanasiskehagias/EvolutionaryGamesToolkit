% Initialization
clc; clear all

global B M eta
B = [0 -1 1;1 0 -1;-1 1 0];							% Rock-Paper-Scissors
Strategies = ["Rock","Paper","Scissors"];
M=length(Strategies);
s0=[10 5 5];
%s0=randi(10,1,M);
J=200;

%% Main
ExpName='RPS_SimBR';GrName='Best Response Simulation';
[s,x]=EGTSim1(B,'BR',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='RPS_SimRep1';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='RPS_SimBNN';GrName='Brown-von Neumann-Nash Simulation';
[s,x]=EGTSim1(B,'BNN',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='RPS_SimSmith';GrName='Smith Simulation';
[s,x]=EGTSim1(B,'Smith',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

eta=0.01;
ExpName='RPS_SimLogit';GrName='Logit Simulation';
[s,x]=EGTSim1(B,'Logit',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);
