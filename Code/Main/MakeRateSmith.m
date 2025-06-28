function r=MakeRateSmith(Q)
% creates a rate matrix for an evolutionary game with Smith dynamic
% INPUT:
% 	Q: 		state payoff matrix, has L rows (one per state) and M columns (one per strategy)
% OUTPUT:
% 	r:		rate matrix, has M rows (one per strategy) and M columns (one per strategy)

	Qmax=max(Q);
	QQ=max(Q,-1000);
	if QQ(1)==Qmax 
		r(1,:)=(QQ==Qmax); r(1,:)=[1,0,0]; %r(1,:)/sum(r(1,:));
	else
		r(1,:)=max(QQ-QQ(1),0); r(1,:)=r(1,:)/sum(r(1,:));
	end
	if QQ(2)==Qmax 
		r(2,:)=(QQ==Qmax); r(2,:)=[0,1,0]; %r(2,:)/sum(r(2,:));
	else
		r(2,:)=max(QQ-QQ(2),0); r(2,:)=r(2,:)/sum(r(2,:));
	end
	if QQ(3)==Qmax 
		r(3,:)=(QQ==Qmax); r(3,:)=[0,0,1]; %r(3,:)/sum(r(3,:));
	else
		r(3,:)=max(QQ-QQ(3),0); r(3,:)=r(3,:)/sum(r(3,:));
	end
end
