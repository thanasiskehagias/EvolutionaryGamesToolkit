function [s,x]=EGTSim(B,Dynamic,s0,J,eta)
% simulates an evolutionary game
% INPUT:
%	B:			payoff matrix
%	Dynamic: 	The dynamic used by the volutionary game
%				admissible values: 'BR', 'BNN', 'Logit', 'Rep1', 'Rep2', 'Smith'
%	s0:			Initial state
%	J:			Number of generations
%	eta:		Noise parameter for Logit dynamics; for other dynamics set to []; swlect by trial and error
% OUTPUT:
%	s:			Strategy state sequence matrix, has J rows (one per generation) and M columns (one per strategy)
%	x:			Frequency sequence matrix, has J rows (one per generation) and M columns (one per strategy)

	M=length(s0);
	N=sum(s0);
	s=s0;
	for j=1:J
		x(j,:)=s(j,:)/sum(s(j,:));
		if contains(Dynamic,'BR')
			s(j+1,:)=SimBR(B,s(j,:));
		elseif contains(Dynamic,'BNN')
			s(j+1,:)=SimBNN(B,s(j,:));
		elseif contains(Dynamic,'Logit')
			s(j+1,:)=SimLogit(B,s(j,:),eta);
		elseif contains(Dynamic,'Rep1')
			s(j+1,:)=SimRep1(B,s(j,:));
		elseif contains(Dynamic,'Rep2')
			s(j+1,:)=SimRep2(B,s(j,:));
		elseif contains(Dynamic,'Smith')
			s(j+1,:)=SimSmith(B,s(j,:));
		else
			s(j+1,:)=s(j,:);
		end
	end
	s=s(1:J,:);
end

