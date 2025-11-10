function DX=DynRep1(t,x)
% provides the correction term for MFD of an evolutionary game with Replicator Type 1 dynamics
% used by ode89 matlab ode solver
% INPUT: 
%	t:		time instant
% 	x:		frequency vector
% OUTPUT: 
%	DX:		correction term
	global B M
	M=length(x);
	F=B*x;
	Fav=x'*B*x;
	DX=x.*(F-Fav);
end
