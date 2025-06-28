ExpName='x0501AMrkBR'; 
GrName='Best Response';

A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[5 5 5];
J=200;

M=length(s0);
N=sum(s0);
B = MakePayoff(A,Strategies,T);
[P,S]=EGTMarkP(B,'BR',M,N,[]);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);
GrMrk(Strategies,P,S,s,ExpName,GrName);
