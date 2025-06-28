clear; clc;
A=[10 1;8 5];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[5 5 5];
J=100;
eta=0.005;

M=length(s0);
N=sum(s0);
B = MakePayoff(A,Strategies,T);

ExpName='x0503AMrkBR'; 
GrName='Best Response';
[P,S]=EGTMarkP(B,'BR',M,N,[]);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='x0503AMrkRep1'; 
GrName='Replicator Type 1';
[P,S]=EGTMarkP(B,'Rep1',M,N,[]);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);ExpName='x0503AMrkLogit'; 
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='x0503AMrkLogit'; 
GrName='Logit';
eta=0.1;
[P,S]=EGTMarkP(B,'Logit',M,N,eta);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);
GrMrk(Strategies,P,S,s,ExpName,GrName);
