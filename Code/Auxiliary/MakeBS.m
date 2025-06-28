function BS=MakeBS001(Q)
% Produces the best strategy for each state of an evolutionary game
% INPUT:
%	Q:		payoff matrix of L rows (one per state) and M columns (one per strategy
% OUTPUT:
%	BS:		Best strategy vector of L rows (one per state)	

	for k=1:size(Q,1)
		[bq,bs]=max(Q(k,:));
		BS(k).bs=[];
		for i=1:size(Q,2);
			if Q(k,i)==bq; BS(k).bs=[BS(k).bs i]; end
		end
	end
end
