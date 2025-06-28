function r=MakeRateRep1(Q,p)
% creates a rate matrix for an evolutionary game with Replicator Type 1 dynamic
% INPUT:
% 	Q: 		state payoff matrix, has L rows (one per state) and M columns (one per strategy)
%	p:		Frequency sequence matrix, has J rows (one per generation) and M columns (one per strategy)
% OUTPUT:
% 	r:		rate matrix, has M rows (one per strategy) and M columns (one per strategy)

	M=length(Q);
	for m=1:M
		r(m,:)=p.*max(Q-Q(m),0);
		if max(r(m,:))==0; r(m,m)=1; end
		if max(r(m,:))>0;  r(m,:)=r(m,:)/sum(r(m,:)); end
	end
end
