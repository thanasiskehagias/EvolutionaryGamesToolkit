% Initialization
clear; clc;

global B M eta
%a^2<bc: attractor; a^2=bc: center; a^2>bc: repellor
a=2;b=1;c=4;
B = [a b c;c a b;b c a];			% Circulant Matrix
J=200;
Strategies = ["1","2","3"];

M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10];

%% Main
J=100;
ExpName='Circ_MFDRep1';GrName='Replicator 1 MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Rep1',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);

J=200;
ExpName='Circ_MFDRep2'; GrName='Replicator 2 Dynamics';
[s,x]= EGTMFDynDisc(B,'Rep2',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);

J=100;
ExpName='Circ_MFDBNN';GrName='BNN MF Dynamics';
[s,x,t]= EGTMFDyn(B,'BNN',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);

J=100;
ExpName='Circ_MFDSmith';GrName='Smith MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Smith',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);

J=200; eta=0.1;
ExpName='Circ_MFDLogit';GrName='Logit MF Dynamics';
[s,x,t]= EGTMFDyn(B,'Logit',s0,J);
GrDyn(s,x,Strategies,ExpName,GrName);
