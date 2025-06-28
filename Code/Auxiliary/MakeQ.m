function Q=MakeQ001(B,S,M)
% Produces total payoff matrix for each state of an evolutionary game
% INPUT:
%	B:		An 	M-by-M matrix where B(m1,m2) is the payoff to 
%			a player of Strategy(m1) playing T rounds against a a player of Strategy(m2) 
%	S:		Strategy state space organized as matrix of L rows (one per state) and M columns (one per strategy
%	M:		M number of strategies
% OUTPUT:
%	Q:		total payoff matrix of L rows (one per state) and M columns (one per strategy)	

	for k=1:size(S,1)
		s=S(k,:);
		for m1=1:M		
			Q(k,m1)=0;
			if 		s(m1)>0
				Q(k,m1)=sum(s.*B(m1,:))-B(m1,m1);
			else
				Q(k,m1)=-Inf;
			end
		end
	end
end
