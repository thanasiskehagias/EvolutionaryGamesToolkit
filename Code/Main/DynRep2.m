function xnew=DynRep2(B,x,N)
% provides the correction term for MFD of an evolutionary game with Replicator Type 2 dynamics
% INPUT: 
%	B:		payoff matrix
% 	x:		frequency vector
% 	N: 		number of players
% OUTPUT: 
%	DX:		correction term
	M=length(x);
	for m1=1:M
		Q(1,m1)=0;
		for m2=1:M 
			Q(1,m1)=Q(1,m1)+N*x(m2)*B(m1,m2);
		end
	end
	snew=N*(x.*Q)/sum(x.*Q);		
	xnew=snew/sum(snew);		
end
