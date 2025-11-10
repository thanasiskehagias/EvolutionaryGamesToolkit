function i=MakeNumState(s,S)
% Returns the "canonical" number of a state according to state numbering of matrix S
% INPUT:
%	s:		the state the number of which we are seeking
%	S:		Strategy state space organized as matrix of L rows (one per state) and M columns (one per strategy
% OUTPUT:
%	i:		State number	

	i=0;
	Q1=(S==s);
	Q2=sum(Q1');
	i1=find(Q2==3);
	if length(i1)>0; i=i1; end
end
