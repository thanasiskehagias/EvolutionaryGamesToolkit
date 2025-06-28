function r=MakeRateRep(Q,p,eta)
% creates a rate matrix for an evolutionary game with BNN dynamic
% INPUT:
% 	Q: 		state payoff matrix, has L rows (one per state) and M columns (one per strategy)
%	p:		Frequency sequence matrix, has J rows (one per generation) and M columns (one per strategy)
%	eta:	Noise parameter for Logit dynamics; for other dynamics set to []; swlect by trial and error
% OUTPUT:
% 	r:		rate matrix, has M rows (one per strategy) and M columns (one per strategy)

	M=length(Q);
	Q=Q/max(max(Q));
	for m=1:M
		r(m,:)=exp(Q/eta)/sum(exp(Q/eta));
	end
end
