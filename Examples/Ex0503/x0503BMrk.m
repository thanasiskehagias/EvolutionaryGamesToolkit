clear; clc;
A=[10 1;8 5];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[20 20 20];
J=100;

M=length(s0);
N=sum(s0);
B = MakePayoff(A,Strategies,T);
B = MakePayoff(A,Strategies,T);

ExpName='x0503BMrkBR'; 
GrName='Best Response';
[P,S]=EGTMarkP(B,'BR',M,N,[]);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='x0503BMrkRep1'; 
GrName='Replicator Type 1';
[P,S]=EGTMarkP(B,'Rep1',M,N,[]);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);ExpName='x0503AMrkLogit'; 
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='x0503BMrkLogit'; 
GrName='Logit';
eta=0.005;
[P,S]=EGTMarkP(B,'Logit',M,N,eta);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);
GrMrk(Strategies,P,S,s,ExpName,GrName);
