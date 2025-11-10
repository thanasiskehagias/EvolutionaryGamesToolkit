% Initialization
clear; clc;

global B M N eta
B = [0 -1 1;1 0 -1;-1 1 0];							% Rock-Paper-Scissors
Strategies = ["Rock","Paper","Scissors"];
M=length(Strategies);
s0=[10 5 5];
%s0=randi(10,1,M);
J=200;

% Main
M=length(s0);
N=sum(s0);

ExpName='RPS_MrkBR';GrName='Best Response Markov';
[P,S]=EGTMarkP1(B,'BR');
[s,x]=EGTMarkSim1(P,S,s0,J);
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='RPS_MrkRep1';GrName='Replicator 1 Markov';
[P,S]=EGTMarkP1(B,'Rep1');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='RPS_MrkBNN';GrName='Brown-Von Neumann-Nash Markov';
[P,S]=EGTMarkP1(B,'BNN');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='RPS_MrkSmith';GrName='Smith Markov';
[P,S]=EGTMarkP1(B,'Smith');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

eta=0.1;
ExpName='RPS_MrkLogit';GrName='Logit Markov';
[P,S]=EGTMarkP1(B,'Logit');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);
