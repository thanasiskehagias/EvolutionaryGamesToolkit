function GrMrk(Strategies,P,S,s,ExpName,GrName)
% Produces 
% 1. the plot of the State Transition Graph (STG) of a Markov chain with transition matrix P
% 2. the plot of a strategy state sequence produced by the same P 
% It saves each of these  as a *.png file
% !!! Only works for M=3 strategies !!!
% INPUT:
%	Strategies:	the strategies used by the evolutionary game (only needed for labeling the plots)
%	P:			probability transition matrix of evolutionary game
%	S:			strategy state space stored as a mtrix with L rows (number of states) by 3 columns 
%	s:			strategy state sequence
%	ExpName:	used to name the saved figures 
%	GrName:		used to label the plots

	N=sum(s(1,:));
	J=size(s,1);
	G = digraph(P);
	G = rmedge(G, 1:numnodes(G), 1:numnodes(G));
	PP=P^1000;PP=PP^1000;PP=PP^1000;
	l1=MakeNumState([N 0 0],S);
	l2=MakeNumState([0 N 0],S);
	l3=MakeNumState([0 0 N],S);
	SC=PP(:,[l1 l2 l3]);
	for l=1:length(SC)
		if max(SC(l,:))==0
			SC(l,:)=[0.1 0.1 0.1];
		else
			SC(l,:)=SC(l,:)/sum(SC(l,:));
		end
	end
	figure(1); plot(G,'XData',S(:,1),'Ydata',S(:,2),'NodeColor',SC)
	title(GrName); 
	saveas(gcf,[ExpName 'STG.png'])
	figure(2); plot(s); grid; axis([0 J -N/100 N+1])
	legend(Strategies); title(GrName)
	saveas(gcf,[ExpName 'S.png'])
end
