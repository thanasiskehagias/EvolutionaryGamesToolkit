clc; clear all
Strategies = ["Rock", "Paper", "Scissors"];
s0=[50 80 20];
J=400;
eta=0.05;
B = [0 -1 1;1 0 -1;-1 1 0];

ExpName='x0504JSimBNN'; 
GrName='BNN Simulation';
[s,x]=EGTSim(B,'BNN',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504JSimLogit'; 
GrName='Logit Simulation';
%[s,x]=EGTSim(B,'Logit',s0,J,[]);
%GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504JSimRep1'; 
GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim(B,'Rep1',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504JSimRep2'; 
GrName='Replicator Type 2 Simulation';
[s,x]=EGTSim(B+1,'Rep2',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504JSimSmith'; 
GrName='Smith Simulation';
[s,x]=EGTSim(B,'Smith',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);
