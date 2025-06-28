function DX=DynLogit(B,x,eta)
% provides the correction term for MFD of an evolutionary game with Logit dynamics
% INPUT: 
%	B:		payoff matrix
% 	x:		frequency vector
% 	eta:	noise term
% OUTPUT: 
%	DX:	correction term
	M=length(x);
	F=(B*x');
	Fav=x*B*x';
	for m1=1:M 
		DX(1,m1)=(exp(F(m1)/eta)/sum(exp(F/eta))-x(m1));
	end
end
