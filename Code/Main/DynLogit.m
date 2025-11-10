function DX=DynLogit(t,x)
% provides the correction term for MFD of an evolutionary game with Logit dynamics
% used by ode89 matlab ode solver
% INPUT: 
%	t:		time instant
% 	x:		frequency vector
% OUTPUT: 
%	DX:		correction term
	global B M eta
	M=length(x);
	F=B*x;
	Fav=x'*B*x;
	for m1=1:M 
		DX(m1,1)=exp(F(m1)/eta)/sum(exp(F/eta))-x(m1);
	end
end	