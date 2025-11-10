function [s,x,t]=EGTMFDyn(B,Dynamic,s0,J)
% computes the mean field dynamics of an evolutionary game
% INPUT:
%	B:			payoff matrix
%	Dynamic: 	The dynamic used by the volutionary game
%				admissible values: 'BR', 'BNN', 'Logit', 'Rep1', 'Smith'
%	s0:			Initial state
%	J:			Final time (proprtional to number of generations)
% OUTPUT:
%	s:			Strategy state sequence matrix, has J rows (one per generation) and M columns (one per strategy)
%	x:			Frequency sequence matrix, has J rows (one per generation) and M columns (one per strategy)
%	t:			times vector

	%global B M eta
	M=size(B,1);
	N=sum(s0);
	x0=s0/sum(s0);
	if contains(Dynamic,'Rep1')
		[t,x] = ode89(@DynRep1,[0 J],x0);
	elseif contains(Dynamic,'BNN')
		[t,x] = ode89(@DynBNN,[0 J],x0);
	elseif contains(Dynamic,'Logit')
		[t,x] = ode89(@DynLogit,[0 J],x0);
	elseif contains(Dynamic,'Smith')
		[t,x] = ode89(@DynSmith,[0 J],x0);
	end
	s=N*x;
end
