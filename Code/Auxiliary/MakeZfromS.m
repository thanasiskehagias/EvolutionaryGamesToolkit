function z=MakeZfromS(s)
% Produces a population vector from a strategy vector 
% INPUT:
%	z:		A population vector
% OUTPUT:
%	s:		A strategy vector

	M=length(s);
	z=[]; 
	for m=1:M
		z=[z m*ones(1,s(m))]; 
	end
end
