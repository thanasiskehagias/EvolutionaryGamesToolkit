clc; clear all
ExpName='x0501ASimBR'; 
GrName='Best Response Simulation';

A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[5 5 5];
J=200;

B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'BR',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);
