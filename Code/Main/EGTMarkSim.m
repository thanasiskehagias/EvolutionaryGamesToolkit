function [s,x]=EGTSimMark(P,S,s0,J)
% simulates an evolutionary game which has probability transition matrix P
% INPUT:
%	P:			transition probability matrix
%	S:			Strategy state space matrix with L rows, 3 columns; every row is an s state
%	s0:			Initial state
%	J:			Number of generations
% OUTPUT:
%	s:			Strategy state sequence matrix, has J rows (one per generation) and M columns (one per strategy)
%	x:			Frequency sequence matrix, has J rows (one per generation) and M columns (one per strategy)

	l0=MakeNumState(s0,S);
	y=SimMC(P, l0, J);
	for j=1:J
		s(j,:)=S(y(j),:);
		x(j,:)=s(j,:)/sum(s(j,:));
	end
end
