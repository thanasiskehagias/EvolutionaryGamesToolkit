function s=MakeSfromZ(z,M)
% Produces a strategy vector from a population vector
% INPUT:
%	z:		A population vector
%	M:		Number of strategies
% OUTPUT:
%	s:		A strategy vector

	for m=1:M
		s(1,m)=length(find(z==m)); 
	end
end
