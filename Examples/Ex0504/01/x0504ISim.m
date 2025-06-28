clc; clear all
Strategies = ["Rock", "Paper", "Scissors"];
s0=[5 8 2];
J=200;
B = [0 -1 1;1 0 -1;-1 1 0];

ExpName='x0504ISimBNN'; 
GrName='BNN Simulation';
[s,x]=EGTSim(B,'BNN',s0,J,[]);	save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504ISimRep1'; 
GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim(B,'Rep1',s0,J,[]);	save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504ISimRep2'; 
GrName='Replicator Type 2 Simulation';
[s,x]=EGTSim(B+1,'Rep2',s0,J,[]);save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0504ISimSmith'; 
GrName='Smith Simulation';
[s,x]=EGTSim(B,'Smith',s0,J,[]);save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);
