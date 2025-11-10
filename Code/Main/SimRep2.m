function snew=SimRep2(B,s)
%Simulates a generation update for an evolutionary game with Replicator Type 2 dynamics
% INPUT:
%	B:			payoff matrix
%	s:			Strategy state sequence matrix, has J rows (one per generation) and M columns (one per strategy)
% OUTPUT:
%	snew:		New strategy state, has 1 row  and M columns (one per strategy)

	M=length(s);
	N=sum(s);
	for m1=1:M
		Q(1,m1)=0;
		for m2=1:M 
			Q(1,m1)=Q(1,m1)+s(m2)*B(m1,m2);
		end
	end
	x=(s.*Q)/sum(s.*Q);		
	z=randsample(M,N,'true',x);
	snew=MakeSfromZ(z,M);	
end
