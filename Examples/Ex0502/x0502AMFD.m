clear; clc;
A=[3 1; 4 2];
T=1000;
Strategies = ["AllC","AllD","Grim","Pavlov","Prober","TitForTat","PerCCD","PerDDC","Gradual","PerNasty"];
s0=[100 100 100 100 100 100 100 100 100 100];
J=100;

B = MakePayoff(A,Strategies,T);

ExpName='x0502AMFDLogit'; 
GrName='Logit';
h=100/T; eta=100;
B = MakePayoff(A,Strategies,T);
[s,x]= EGTMFDyn(B,'Logit',s0,J,h,eta);		save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0502AMFDRep1'; 
GrName='Replicator Type 1';
h=1/T;
B = MakePayoff(A,Strategies,T);
[s,x]= EGTMFDyn(B,'Rep1',s0,J,h,[]);		save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0502AMFDRep2'; 
GrName='Replicator Type 2';
h=1/T;
B = MakePayoff(A,Strategies,T);
[s,x]= EGTMFDyn(B,'Rep2',s0,J,h,[]);		save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

%{
ExpName='x0502ASimRep2'; 
GrName='Replicator Type 2';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Rep2',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='x0502ASimLogit'; 
GrName='Logit';
eta=0.01;
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Logit',s0,J,eta);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);


% Replicator 1
ExpName='x0502AMFDRep1'; GrName='Replicator 1 Dynamics';h=1/T;
[s,x]= EGTMFDyn(B,'Rep1',s0,J,h,[]);GrDyn(s,x,Strategies,ExpName,GrName);pause(1)
% Replicator 2
ExpName='x0502AMFDRep2'; GrName='Replicator 2 Dynamics';h=1/T;
[s,x]= EGTMFDyn(B,'Rep2',s0,J,h,[]);GrDyn(s,x,Strategies,ExpName,GrName);pause(1)
% Logit Dynamics
ExpName='x0502AMFDLogit'; GrName='Logit Dynamics';h=100/T;eta=1e2;
[s,x]= EGTMFDyn(B,'Logit',s0,J,h,eta);GrDyn(s,x,Strategies,ExpName,GrName);pause(1)
%}