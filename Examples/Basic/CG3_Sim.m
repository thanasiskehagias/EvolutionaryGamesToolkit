% Initialization
clc; clear all

global B M eta
B = [3 2 4;4 3 2;2 4 3];			% Circulant
Strategies = ["1","2","3"];
J=200;

M=length(Strategies);
s0=randi(20,1,M);
%s0=[10 10];

%% Main
ExpName='CG3_SimBR';GrName='Best Response Simulation';
[s,x]=EGTSim1(B,'BR',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='CG3_SimRep1';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='CG3_SimRep2';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep2',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='CG3_SimBNN';GrName='Brown-von Neumann-Nash Simulation';
[s,x]=EGTSim1(B,'BNN',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='CG3_SimSmith';GrName='Smith Simulation';
[s,x]=EGTSim1(B,'Smith',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

eta=0.01;
ExpName='CG3_SimLogit';GrName='Logit Simulation';
[s,x]=EGTSim1(B,'Logit',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);
