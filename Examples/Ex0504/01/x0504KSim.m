clc; clear all
Strategies = ["Rock", "Paper", "Scissors"];
s0=[50 80 20];
J=400;
eta=0.05;
B = [0 -1 1;1 0 -1;-1 1 0];

ExpName='x0504KSimBNN'; 
GrName='BNN Simulation';
[s,x]=EGTSim(B,'BNN',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504KSimLogit'; 
GrName='Logit Simulation';
%[s,x]=EGTSim(B,'Logit',s0,J,[]);
%GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504KSimRep1'; 
GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim(B,'Rep1',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504KSimRep2'; 
GrName='Replicator Type 2 Simulation';
[s,x]=EGTSim(B+1,'Rep2',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504KSimSmith'; 
GrName='Smith Simulation';
[s,x]=EGTSim(B,'Smith',s0,J,[]);
GrSim(s,x,Strategies,ExpName,GrName);
