function DX=DynBNN(B,x)
% provides the correction term for MFD of an evolutionary game with BNN dynamics
% INPUT: 
%	B:		payoff matrix
% 	x:		frequency vector
% OUTPUT: 
%	DX:		correction term

	M=length(x);
	F=(B*x');
	Fav=x*B*x';
	dF=F-Fav;
	for m1=1:M 
		DF=0;
		for m2=1:M
			DF=DF+x(m2)*max(dF(m2),0); 
		end
		DX(1,m1)=(max(dF(m1),0)-x(m1)*DF);
	end
end
