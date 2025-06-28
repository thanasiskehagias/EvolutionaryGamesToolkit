% Initialization
clc; clear all

A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[100 100 100];
J=1000;

%% Main
ExpName='x0501CSimBR'; 
GrName='Best Response Simulation';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'BR',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0501CSimBNN'; 
GrName='Brown-von Neumann-Nash';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'BNN',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0501CSimLogit'; 
GrName='Logit';
eta=0.01;
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Logit',s0,J,eta);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0501CSimRep1'; 
GrName='Replicator Type 1';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Rep1',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0501CSimRep2'; 
GrName='Replicator Type 2';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Rep1',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0501CSimSmith'; 
GrName='Smith';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Rep1',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);
