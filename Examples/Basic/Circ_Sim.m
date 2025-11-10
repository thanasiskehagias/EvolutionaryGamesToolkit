% Initialization
clc; clear all

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
ExpName='Circ_SimBR';GrName='Best Response Simulation';
[s,x]=EGTSim1(B,'BR',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='Circ_SimRep1';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='Circ_SimRep2';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep2',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='Circ_SimRep2';GrName='Replicator Type 1 Simulation';
[s,x]=EGTSim1(B,'Rep2',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='Circ_SimBNN';GrName='Brown-von Neumann-Nash Simulation';
[s,x]=EGTSim1(B,'BNN',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='Circ_SimSmith';GrName='Smith Simulation';
[s,x]=EGTSim1(B,'Smith',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

eta=0.01;
ExpName='Circ_SimLogit';GrName='Logit Simulation';
[s,x]=EGTSim1(B,'Logit',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);
