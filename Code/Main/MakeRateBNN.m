function r=MakeRateBNN(Q,p)
% creates a rate matrix for an evolutionary game with BNN dynamic
% INPUT:
% 	Q: 		state payoff matrix, has L rows (one per state) and M columns (one per strategy)
%	p:		Frequency sequence matrix, has J rows (one per generation) and M columns (one per strategy)
% OUTPUT:
% 	r:		rate matrix, has M rows (one per strategy) and M columns (one per strategy)

	M=length(Q);
	Qave=0;
	for m=1:M
		if ~anynan(Q(m)); Qave=Qave+p(m)*Q(m); end 
	end
	for m1=1:M
		for m2=1:M
			r(m1,m2)=max(Q(m2)-Qave,0);
		end
		if max(r(m1,:))==0; r(m1,m1)=1; end
		if max(r(m1,:))>0;  r(m1,:)=r(m1,:)/sum(r(m1,:)); end
	end
end
