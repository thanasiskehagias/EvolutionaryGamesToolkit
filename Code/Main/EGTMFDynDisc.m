function [s,x]=EGTMFDyn(B,Dynamic,s0,J)
% computes the mean field DISCRETE TIME dynamics of an evolutionary game
% INPUT:
%	B:			payoff matrix
%	Dynamic: 	The dynamic used by the volutionary game
%				admissible values: 'BR', 'BNN', 'Logit', 'Rep1', 'Rep2', 'Smith'
%	s0:			Initial state
%	J:			Number of generations
%	h:			Integration step, must be selected by trial and error 
%	eta:		Noise parameter for Logit dynamics; for other dynamics set to []; swlect by trial and error
% OUTPUT:
%	s:			Strategy state sequence matrix, has J rows (one per generation) and M columns (one per strategy)
%	x:			Frequency sequence matrix, has J rows (one per generation) and M columns (one per strategy)

	M=size(B,1);
	N=sum(s0);
	x=s0/sum(s0);
	for j=1:J
		x(j,:)=x(j,:)/sum(x(j,:));
		s(j,:)=N*x(j,:);
		if contains(Dynamic,'Rep2')
			x(j+1,:)=DynRep2(B,x(j,:),N);
		end
	end
	x=x(1:J,:);
end


