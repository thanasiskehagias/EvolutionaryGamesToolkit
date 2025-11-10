% Initialization
clear; clc;

global B M N eta
A=[3 1; 4 2];						% PD
T=1000;
Strategies = ["AllC","AllD", "Grim"];
B = MakePayoff(A,Strategies,T);
M=length(Strategies);
s0=[10 5 5];
N=sum(s0);
J=100;

ExpName='IPD_MrkBR';GrName='Best Response Markov';
[P,S]=EGTMarkP1(B,'BR');
[s,x]=EGTMarkSim1(P,S,s0,J);
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='IPD_MrkRep1';GrName='Replicator Markov';
[P,S]=EGTMarkP1(B,'Rep1');
[s,x]=EGTMarkSim1(P,S,s0,J);
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='IPD_MrkBNN';GrName='Brown-Von Neumann-Nash Markov';
[P,S]=EGTMarkP1(B,'BNN');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='IPD_MrkSmith';GrName='Smith Markov';
[P,S]=EGTMarkP1(B,'Smith');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

eta=0.1;
ExpName='IPD_MrkLogit';GrName='Logit Markov';
[P,S]=EGTMarkP1(B,'Logit');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);
%{

ExpName='IPD_SimRep1';GrName='Replicator 1 Simulation';
[s,x]=EGTSim1(B,'Rep1',s0,J); 
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='IPD_SimBNN';GrName='BNN MF Dynamics';
[s,x]=EGTSim1(B,'BNN',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

ExpName='IPD_SimSmith';GrName='Smith MF Dynamics';
[s,x]=EGTSim1(B,'Smith',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);

J=1000; eta=0.1;
ExpName='IPD_SimLogit';GrName='Logit MF Dynamics';
[s,x]=EGTSim1(B,'Logit',s0,J);
GrSim(s,x,Strategies,ExpName,GrName);
%}