function [P,S]=EGTMarkP(B,Dynamic,M,N,eta)
% computes the transition probability matrix of an evolutionary game
% !!! only works for M=3 strategies!!!
% INPUT:
%	B:			payoff matrix
%	Dynamic: 	The dynamic used by the volutionary game
%				admissible values: 'BR', 'BNN', 'Logit', 'Rep1', 'Rep2', 'Smith'
%	M:			Number of strategies
%	N:			Number of players
%	eta:		Noise parameter for Logit dynamics; for other dynamics set to []
% OUTPUT:
%	P:			Transition probability matrix
%	S:			Strategy state space matrix with L rows, 3 columns; every row is an s state

	L=(N+1)*(N+2)/2;
	P=sparse(zeros(L,L));
	S=MakeS(N); 
	Q=MakeQ(B,S,M);
	BS=MakeBS(Q);
	for l0=1:L 
		P(l0,:)=zeros(1,L);
		s0=S(l0,:);
		disp(['Looking at State ' num2str(s0)])
		x=s0/sum(s0);
		if contains(Dynamic,'BNN')
			r=MakeRateBNN(Q(l0,:),x);
		elseif contains(Dynamic,'BR')
			r=MakeRateBR(Q(l0,:));
		elseif contains(Dynamic,'Logit')
			r=MakeRateLogit(Q(l0,:),x,eta);
		elseif contains(Dynamic,'Rep1')
			r=MakeRateRep1(Q(l0,:),x);
		elseif contains(Dynamic,'Smith')
			r=MakeRateSmith(Q(l0,:));
		else
			disp('You have not provided a valid Dynamic');
		end
		if s0(1)==N | s0(2)==N | s0(3)==N 
			P(l0,l0)=1;
		elseif s0(1)==0
			%s11=s0; s11(1)=s11(1)-1; s11(1)=s11(1)+1; l11=MakeNumState(s11,S); P(l0,l11)=P(l0,l11)+x(1)*r(1,1);
			%s12=s0; s12(1)=s12(1)-1; s12(2)=s12(2)+1; l12=MakeNumState(s12,S); P(l0,l12)=P(l0,l12)+x(1)*r(1,2);
			%s13=s0; s13(1)=s13(1)-1; s13(3)=s13(3)+1; l13=MakeNumState(s13,S); P(l0,l13)=P(l0,l13)+x(1)*r(1,3);
			%s21=s0; s21(2)=s21(2)-1; s21(1)=s21(1)+1; l21=MakeNumState(s21,S); P(l0,l21)=P(l0,l21)+x(2)*r(2,1);
			s22=s0; s22(2)=s22(2)-1; s22(2)=s22(2)+1; l22=MakeNumState(s22,S); P(l0,l22)=P(l0,l22)+x(2)*r(2,2);
			s23=s0; s23(2)=s23(2)-1; s23(3)=s23(3)+1; l23=MakeNumState(s23,S); P(l0,l23)=P(l0,l23)+x(2)*r(2,3);
			%s31=s0; s31(3)=s31(3)-1; s31(1)=s31(1)+1; l31=MakeNumState(s31,S); P(l0,l31)=P(l0,l31)+x(3)*r(3,1);
			s32=s0; s32(3)=s32(3)-1; s32(2)=s32(2)+1; l32=MakeNumState(s32,S); P(l0,l32)=P(l0,l32)+x(3)*r(3,2);
			s33=s0; s33(3)=s33(3)-1; s33(3)=s33(3)+1; l33=MakeNumState(s33,S); P(l0,l33)=P(l0,l33)+x(3)*r(3,3);
		elseif s0(2)==0
			s11=s0; s11(1)=s11(1)-1; s11(1)=s11(1)+1; l11=MakeNumState(s11,S); P(l0,l11)=P(l0,l11)+x(1)*r(1,1);
			%s12=s0; s12(1)=s12(1)-1; s12(2)=s12(2)+1; l12=MakeNumState(s12,S); P(l0,l12)=P(l0,l12)+x(1)*r(1,2);
			s13=s0; s13(1)=s13(1)-1; s13(3)=s13(3)+1; l13=MakeNumState(s13,S); P(l0,l13)=P(l0,l13)+x(1)*r(1,3);
			%s21=s0; s21(2)=s21(2)-1; s21(1)=s21(1)+1; l21=MakeNumState(s21,S); P(l0,l21)=P(l0,l21)+x(2)*r(2,1);
			%s22=s0; s22(2)=s22(2)-1; s22(2)=s22(2)+1; l22=MakeNumState(s22,S); P(l0,l22)=P(l0,l22)+x(2)*r(2,2);
			%s23=s0; s23(2)=s23(2)-1; s23(3)=s23(3)+1; l23=MakeNumState(s23,S); P(l0,l23)=P(l0,l23)+x(2)*r(2,3);
			s31=s0; s31(3)=s31(3)-1; s31(1)=s31(1)+1; l31=MakeNumState(s31,S); P(l0,l31)=P(l0,l31)+x(3)*r(3,1);
			%s32=s0; s32(3)=s32(3)-1; s32(2)=s32(2)+1; l32=MakeNumState(s32,S); P(l0,l32)=P(l0,l32)+x(3)*r(3,2);
			s33=s0; s33(3)=s33(3)-1; s33(3)=s33(3)+1; l33=MakeNumState(s33,S); P(l0,l33)=P(l0,l33)+x(3)*r(3,3);
		elseif s0(3)==0
			s11=s0; s11(1)=s11(1)-1; s11(1)=s11(1)+1; l11=MakeNumState(s11,S); P(l0,l11)=P(l0,l11)+x(1)*r(1,1);
			s12=s0; s12(1)=s12(1)-1; s12(2)=s12(2)+1; l12=MakeNumState(s12,S); P(l0,l12)=P(l0,l12)+x(1)*r(1,2);
			%s13=s0; s13(1)=s13(1)-1; s13(3)=s13(3)+1; l13=MakeNumState(s13,S); P(l0,l13)=P(l0,l13)+x(1)*r(1,3);
			s21=s0; s21(2)=s21(2)-1; s21(1)=s21(1)+1; l21=MakeNumState(s21,S); P(l0,l21)=P(l0,l21)+x(2)*r(2,1);
			s22=s0; s22(2)=s22(2)-1; s22(2)=s22(2)+1; l22=MakeNumState(s22,S); P(l0,l22)=P(l0,l22)+x(2)*r(2,2);
			%s23=s0; s23(2)=s23(2)-1; s23(3)=s23(3)+1; l23=MakeNumState(s23,S); P(l0,l23)=P(l0,l23)+x(2)*r(2,3);
			%s31=s0; s31(3)=s31(3)-1; s31(1)=s31(1)+1; l31=MakeNumState(s31,S); P(l0,l31)=P(l0,l31)+x(3)*r(3,1);
			%s32=s0; s32(3)=s32(3)-1; s32(2)=s32(2)+1; l32=MakeNumState(s32,S); P(l0,l32)=P(l0,l32)+x(3)*r(3,2);
			%s33=s0; s33(3)=s33(3)-1; s33(3)=s33(3)+1; l33=MakeNumState(s33,S); P(l0,l33)=P(l0,l33)+x(3)*r(3,3);
		else
			s11=s0; s11(1)=s11(1)-1; s11(1)=s11(1)+1; l11=MakeNumState(s11,S); P(l0,l11)=P(l0,l11)+x(1)*r(1,1);
			s12=s0; s12(1)=s12(1)-1; s12(2)=s12(2)+1; l12=MakeNumState(s12,S); P(l0,l12)=P(l0,l12)+x(1)*r(1,2);
			s13=s0; s13(1)=s13(1)-1; s13(3)=s13(3)+1; l13=MakeNumState(s13,S); P(l0,l13)=P(l0,l13)+x(1)*r(1,3);
			s21=s0; s21(2)=s21(2)-1; s21(1)=s21(1)+1; l21=MakeNumState(s21,S); P(l0,l21)=P(l0,l21)+x(2)*r(2,1);
			s22=s0; s22(2)=s22(2)-1; s22(2)=s22(2)+1; l22=MakeNumState(s22,S); P(l0,l22)=P(l0,l22)+x(2)*r(2,2);
			s23=s0; s23(2)=s23(2)-1; s23(3)=s23(3)+1; l23=MakeNumState(s23,S); P(l0,l23)=P(l0,l23)+x(2)*r(2,3);
			s31=s0; s31(3)=s31(3)-1; s31(1)=s31(1)+1; l31=MakeNumState(s31,S); P(l0,l31)=P(l0,l31)+x(3)*r(3,1);
			s32=s0; s32(3)=s32(3)-1; s32(2)=s32(2)+1; l32=MakeNumState(s32,S); P(l0,l32)=P(l0,l32)+x(3)*r(3,2);
			s33=s0; s33(3)=s33(3)-1; s33(3)=s33(3)+1; l33=MakeNumState(s33,S); P(l0,l33)=P(l0,l33)+x(3)*r(3,3);
		end
	end
end
