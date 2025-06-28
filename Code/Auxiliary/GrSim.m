function GrSim(s,x,Strategies,ExpName,GrName)
% Produces two plots of an evolutionary game and saves them as *.png files
% 1. the strategy state sequence (correct for any number of strategies)
% 2. the 3-simplex plot of the frequency sequence (correct for M=3 strategies)
% INPUT:
%	s:			strategy state sequence
%	x:			frequency sequence
%	Strategies:	the strategies used by the evolutionary game (only needed for labeling the plots)
%	ExpName:	used to name the saved figures 
%	GrName:		used to label the plots

	N=sum(s(1,:));
	J=size(s,1);
	figure(3); plot(s); grid; axis([0 J -N/100 N+1])
	legend(Strategies); title(GrName)
	saveas(gcf,[ExpName 'S.png'])
	figure(4); GrSimplex(x); title(GrName)
	saveas(gcf,[ExpName 'Simplex.png'])
end
