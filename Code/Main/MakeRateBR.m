% creates a rate matrix for an evolutionary game with Best Response dynamic
% INPUT:
% 	Q: 		state payoff matrix, has L rows (one per state) and M columns (one per strategy)
% OUTPUT:
% 	r:		rate matrix, has M rows (one per strategy) and M columns (one per strategy)

function r=MakeRateBR(Q)
	M=length(Q);
	for m=1:M
		Qmax=max(Q);
		r(m,:)=(Q==Qmax)/length(find(Q==Qmax));
	end
end
