function snew=SimBR(B,s)
%Simulates a generation update for an evolutionary game with Best Response dynamics
% INPUT:
%	B:			payoff matrix
%	s:			Strategy state sequence matrix, has J rows (one per generation) and M columns (one per strategy)
% OUTPUT:
%	snew:		New strategy state, has 1 row  and M columns (one per strategy)

	M=length(s);
	N=sum(s);
	x=s/sum(s);
	z=MakeZfromS(s);
	Q=zeros(1,M);
	for m1=1:M
		Q(1,m1)=-B(m1,m1);
		for m2=1:M 
			Q(1,m1)=Q(1,m1)+s(m2)*B(m1,m2);
		end
	end
	r=MakeRateBR(Q);
	m1=randsample([1:M],1);
	m2=randsample([1:M],1,true,r(m1,:));
	snew=s;
	if snew(m1)>0 & snew(m2)<N
		snew(m1)=snew(m1)-1;
		snew(m2)=snew(m2)+1;
	end

end
