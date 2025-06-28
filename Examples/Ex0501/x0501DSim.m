clear; clc;
A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[100 100 100];
J=1000;
eta=0.05;

B = MakePayoff(A,Strategies,T);

ExpName='x0501DSimRep1'; 
GrName='Replicator Type 1';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Rep1',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0501DSimRep2'; 
GrName='Replicator Type 2';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Rep2',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0501DSimBNN'; 
GrName='Brown-Von Neumann-Nash Simulation';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'BNN',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);
