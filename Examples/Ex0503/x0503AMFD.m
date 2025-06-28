A=[10 1;8 5];
T=1000;
Strategies = ["AllC","AllD","Grim"];
s0=[5 5 5];
J=100;
eta=0.05;

B = MakePayoff(A,Strategies,T);

h=0.1/T;
ExpName='x0503AMFDRep1'; GrName='Replicator 1 Dynamics';
[s,x]= EGTMFDyn(B,'Rep1',s0,J,h,[]);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);

h=100/T;eta=1e2;
ExpName='x0503AMFDLogit'; GrName='Logit Dynamics';
[s,x]= EGTMFDyn(B,'Logit',s0,J,h,eta);	save([ExpName 'S']); 
GrDyn(s,x,Strategies,ExpName,GrName);
