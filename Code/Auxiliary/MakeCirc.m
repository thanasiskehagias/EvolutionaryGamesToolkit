% auto circulant creation
function A=MakeCirc(r);
	M=length(r);
	A(1,:)=r;
	for m=2:M
		r0=r(M);r(2:M)=r(1:M-1);r(1)=r0;
		A(m,:)=r;
	end
end
