clear; clc;
A=[3 1; 4 2];
T=1000;
Strategies = ["AllC","AllD","Grim","Pavlov","Prober","TitForTat","PerCCD","PerDDC","Gradual","PerNasty"];
s0=[100 100 100 100 100 100 100 100 100 100];
J=5000;

B = MakePayoff(A,Strategies,T);

ExpName='x0502ASimRep1'; 
GrName='Replicator Type 1';
B = MakePayoff(A,Strategies,T);
[s,x]=EGTSim(B,'Rep1',s0,J,[]);			save([ExpName 'S']); 
GrSim(s,x,Strategies,ExpName,GrName);

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
