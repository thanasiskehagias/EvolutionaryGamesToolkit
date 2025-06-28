%% Various Dynamics

% Initialization
clear; clc;
A=[3 1; 4 2];
T=1000;
Strategies = ["AllC", "AllD", "Grim"];
s0=[100 100 100];
J=100;

%% Main
B = MakePayoff(A,Strategies,T);

h=1/T;
ExpName='x0501CMFDBNN'; GrName='Brown-Von Neumann-Nash Dynamics';
[s,x]= EGTMFDyn(B,'BNN',s0,J,h,[]);		save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

h=100/T;eta=1e2;
ExpName='x0501CMFDLogit'; GrName='Logit Dynamics';
[s,x]= EGTMFDyn(B,'Logit',s0,J,h,eta);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

h=1/T;
ExpName='x0501CMFDRep1'; GrName='Replicator 1 Dynamics';
[s,x]= EGTMFDyn(B,'Rep1',s0,J,h,[]);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

h=1/T;
ExpName='x0501CMFDRep2'; GrName='Replicator 2 Dynamics';
[s,x]= EGTMFDyn(B,'Rep2',s0,J,h,[]);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

h=0.5/T;
ExpName='x0501CMFDSmith'; GrName='Smith Dynamics';
[s,x]= EGTMFDyn(B,'Smith',s0,J,h,[]);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

%{
h=0.5/T;
ExpName='x0501CMFDSmith'; GrName='Smith Dynamics';
[s,x]= EGTMFDyn(B,'Smith',s0,J,h,eta);GrDyn(s,x,Strategies,ExpName,GrName)
%}