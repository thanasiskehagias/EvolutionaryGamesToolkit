clear; clc;
A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[100 100 100];
J=100;

B = MakePayoff(A,Strategies,T);

h=1/T;
ExpName='x0501DMFDRep1'; GrName='Replicator 1 Dynamics';
[s,x]= EGTMFDyn(B,'Rep1',s0,J,h,[]);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

h=1/T;
ExpName='x0501CMFDRep2'; GrName='Replicator 2 Dynamics';
[s,x]= EGTMFDyn(B,'Rep2',s0,J,h,[]);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

h=1/T;
ExpName='x0501CMFDBNN'; GrName='Brown-Von Neumann-Nash Dynamics';
[s,x]= EGTMFDyn(B,'BNN',s0,J,h,[]);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);
