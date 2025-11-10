% Initialization
clear; clc;

global B M N eta
B = [0 -1 1;1 0 -1;-1 1 0];							% Rock-Paper-Scissors
Strategies = ["Rock","Paper","Scissors"];
M=length(Strategies);
s0=[1 1 1];
%s0=randi(10,1,M);
J=200;

% Main
M=length(s0);
N=sum(s0);

ExpName='RPS_MrkBR01';GrName='Best Response Markov';
[P,S]=EGTMarkP1(B,'BR');
[s,x]=EGTMarkSim1(P,S,s0,J);
GrMrk(Strategies,P,S,s,ExpName,GrName);
