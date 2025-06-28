% Initialization
clc; clear all
ExpName='x0501BSimBR'; 
GrName='Best Response Simulation';

A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[20 20 20];
J=200;

%% Main
B = MakePayoff(A,Strategies,T);

[s,x]=EGTSim(B,'BR',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);
