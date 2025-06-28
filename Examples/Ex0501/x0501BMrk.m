% Initialization
clear; clc;
ExpName='x0501BMrkBR';  
GrName='Best Response';

A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[20 20 20];
J=200;

%% Main
M=length(s0);
N=sum(s0);
B = MakePayoff(A,Strategies,T);
[P,S]=EGTMarkP(B,'BR',M,N,[]);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);
GrMrk(Strategies,P,S,s,ExpName,GrName);
