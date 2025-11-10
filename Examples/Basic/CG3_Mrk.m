% Initialization
clear; clc;

global B M N eta
B = [3 2 4;4 3 2;2 4 3];			% Circulant
Strategies = ["1","2","3"];

M=length(Strategies);
s0=randi(20,1,M);
%s0=[10 10];

%% Main
M=length(Strategies);
s0=randi(10,1,M);
%s0=[10 10 10];
J=200;

%% Main
M=length(s0);
N=sum(s0);

ExpName='CG3_MrkBR';GrName='Best Response Markov';
[P,S]=EGTMarkP1(B,'BR');
[s,x]=EGTMarkSim1(P,S,s0,J);
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='CG3_MrkRep1';GrName='Replicator 1 Markov';
[P,S]=EGTMarkP1(B,'Rep1');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='CG3_MrkBNN';GrName='Brown-Von Neumann-Nash Markov';
[P,S]=EGTMarkP1(B,'BNN');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

ExpName='CG3_MrkSmith';GrName='Smith Markov';
[P,S]=EGTMarkP1(B,'Smith');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);

eta=0.1;
ExpName='CG3_MrkLogit';GrName='Logit Markov';
[P,S]=EGTMarkP1(B,'Logit');	 
[s,x]=EGTMarkSim1(P,S,s0,J); 	
GrMrk(Strategies,P,S,s,ExpName,GrName);
