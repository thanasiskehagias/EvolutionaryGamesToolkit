function DX=DynSmith(B,x)
% provides the correction term for MFD of an evolutionary game with Smith dynamics
% INPUT: 
%	B:		payoff matrix
% 	x:		frequency vector
% OUTPUT: 
%	DX:		correction term
	M=length(x);
	F=(B*x')';
	Fav=x*B*x';
	for m1=1:M 
		DX(1,m1)=0;
		for m2=1:M
			DX(m1)=DX(m1)+x(m2)*max(F(m1)-F(m2),0)-x(m1)*max(F(m2)-F(m1),0); 
		end
	end
end
