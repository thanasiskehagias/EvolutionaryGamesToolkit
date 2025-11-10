function S=MakeS001(N)
% Produces the strategy state space for an evolutionary game of N players and 3 strategies
% INPUT:
%	N:		Number of players
% OUTPUT:
%	S:		Strategy state space organized as matrix of L rows (one per state) and 3 columns (one per strategy)

S=[];
for n1=0:N; 
	for n2=0:N-n1; 
		S=[S;[n1,n2,N-n1-n2]]; 
		%disp(S); 
	end; 
end;
