% Initialization
clc; clear all

global B M eta
B = [0 -1 0 1;1 0 -1 0;0 1 0 -1; -1 0 1 0];			% Gen Rock-Scissors-Paper
J=200;
Strategies = ["1","2","3","4"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main
ExpName='GRPS_SimBR';GrName='Best Response Simulation';
[s,x]=EGTSim1(B,'BR',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='GRPS_SimRep1';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

%ExpName='GRPS_SimRep2';GrName='Replicator Type 1 Simulation';
%[s,x]=EGTSim1(B,'Rep2',s0,J); 
%GrSimX(s,x,Strategies,ExpName,GrName);

ExpName='GRPS_SimBNN';GrName='Brown-von Neumann-Nash Simulation';
[s,x]=EGTSim1(B,'BNN',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='GRPS_SimSmith';GrName='Smith Simulation';
[s,x]=EGTSim1(B,'Smith',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

eta=0.01;
ExpName='GRPS_SimLogit';GrName='Logit Simulation';
[s,x]=EGTSim1(B,'Logit',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);
