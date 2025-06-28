function DX=DynRep1(B,x)
% provides the correction term for MFD of an evolutionary game with Replicator Type 1 dynamics
% INPUT: 
%	B:		payoff matrix
% 	x:		frequency vector
% OUTPUT: 
%	DX:		correction term
	M=length(x);
	F=(B*x')';
	Fav=x*B*x';
	DX=x.*(F-Fav);
end
