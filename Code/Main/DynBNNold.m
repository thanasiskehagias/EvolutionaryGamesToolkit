function DX=DynBNN(t,x)
% provides the correction term for MFD of an evolutionary game with BNN dynamics
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
	dF=F-Fav;
	for m1=1:M 
		DF=0;
		for m2=1:M
			DF=DF+x(m2)*max(dF(m2),0); 
		end
		DX(m1,1)=(max(dF(m1),0)-x(m1)*DF);
	end
end
