function DX=DynSmith(t,x)
% provides the correction term for MFD of an evolutionary game with Smith dynamics
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
	for m1=1:M 
		DX(m1,1)=0;
		for m2=1:M
			DX(m1)=DX(m1)+x(m2)*max(F(m1)-F(m2),0)-x(m1)*max(F(m2)-F(m1),0); 
		end
	end
end
