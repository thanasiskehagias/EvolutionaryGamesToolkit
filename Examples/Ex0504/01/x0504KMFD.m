clear; clc;
T=10;
Strategies = ["Rock", "Paper", "Scissors"];
s0=[50 80 20];
J=400;
eta=0.05;
B = [0 -1 1;1 0 -1;-1 1 0];

h=1/T;
ExpName='x0504KMFDBNN'; 
GrName='BNN Dynamics';
[s,x]= EGTMFDyn(B,'BNN',s0,J,h,[]);
GrDyn(s,x,Strategies,ExpName,GrName);pause(1)

%h=100/T;eta=1e2;
%ExpName='x0504KMFDLogit'; 
%GrName='Logit Dynamics';
%[s,x]= EGTMFDyn(B,'Logit',s0,J,h,eta);
%GrDyn(s,x,Strategies,ExpName,GrName);pause(1)

h=1/T;
ExpName='x0504KMFDRep1'; 
GrName='Replicator 1 Dynamics';
[s,x]= EGTMFDyn(B,'Rep1',s0,J,h,[]);
GrDyn(s,x,Strategies,ExpName,GrName);pause(1)

h=10/T;
ExpName='x0504KMFDRep2'; 
GrName='Replicator 2 Dynamics';
[s,x]= EGTMFDyn(B+1,'Rep2',s0,J,h,[]);
GrDyn(s,x,Strategies,ExpName,GrName);pause(1)

h=0.5/T;
ExpName='x0504KMFDSmith'; 
GrName='Smith Dynamics';
[s,x]= EGTMFDyn(B,'Smith',s0,J,h,eta);
GrDyn(s,x,Strategies,ExpName,GrName)
