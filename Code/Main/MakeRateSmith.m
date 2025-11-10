function r=MakeRateSmith(Q)
% creates a rate matrix for an evolutionary game with Smith dynamic
% INPUT:
% 	Q: 		state payoff matrix, has L rows (one per state) and M columns (one per strategy)
% OUTPUT:
% 	r:		rate matrix, has M rows (one per strategy) and M columns (one per strategy)

	M=length(Q);
	for m1=1:M
		for m2=1:M
			r(m1,m2)=max(Q(m2)-Q(m1),0);
		end
		if max(r(m1,:))==0; r(m1,m1)=1; end
		if max(r(m1,:))>0;  r(m1,:)=r(m1,:)/sum(r(m1,:)); end
	end
end
