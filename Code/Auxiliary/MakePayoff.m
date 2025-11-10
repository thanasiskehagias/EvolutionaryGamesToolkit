function B = MakePayoff(A,Strategies,T)
% Returns the payoff matrix B for each of M strategies of an evolutionary game 
% INPUT:
%	A:				The one-round matrix payoff
%	Strategies:		The M strategies used by the players
%	T:				The number of rounds of the one-round game played 
% OUTPUT:
%	B:				An 	M-by-M matrix where B(m1,m2) is the payoff to 
%					a player of Strategy(m1) playing T rounds against a a player of Strategy(m2) 

	funList = cellfun(@str2func,Strategies,'uniformOutput',false);
	N_strat = length(Strategies);
	B = zeros(N_strat);

	% Calculate scores for each strategy against each strategy
	for i = 1: N_strat
		for j = i: N_strat
			History = zeros(T, 2);
			matchpayoffs = zeros(2, 1);

			% Assign strategy function handles
			strategy1 = funList{i};
			strategy2 = funList{j};

			% Play the game
			for round = 1:T
				History(round, 1) = strategy1(History);
				History(round, 2) = strategy2(flip(History,2));
			end

			% Calculate scores for the match
			for v = 1:T
				matchpayoffs(1) = matchpayoffs(1) + A(History(v, 1) , History(v, 2));
				matchpayoffs(2) = matchpayoffs(2) + A(History(v, 2) , History(v, 1));
			end
			B(i,j) = matchpayoffs(1);
			B(j,i) = matchpayoffs(2);
		end
	end
end
