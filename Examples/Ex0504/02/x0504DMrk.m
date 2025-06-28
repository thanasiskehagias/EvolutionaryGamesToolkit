% Initialization
clear; clc;
ExpName='x0504DMrkBR'; 
GrName='Best Response';
Strategies = ["Rock", "Paper", "Scissors"];
s0=[2 2 2];
J=100;

%% Main
M=length(s0);
N=sum(s0);
B = [0 -1 1;1 0 -1;-1 1 0];

[P,S]=EGTMarkP(B,'BR',M,N,[]);	save([ExpName 'P']); 
[s,x]=EGTMarkSim(P,S,s0,J); 	save([ExpName 'S']);
GrMrk(Strategies,P,S,s,ExpName,GrName);
