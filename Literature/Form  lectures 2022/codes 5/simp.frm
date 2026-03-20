#-
S	n1,...,n5,ep;
CF	Z,rat,RAT;
PolyRatFun rat,RAT;
Off Statistics;
Format nospaces;
.global
L	G1 = Z(-1,-1+n1,n2,n3,n4,n5) + RAT(2*ep+n1+n4+n5-4,1)*(
      +Z(-1,n1,-1+n2,n3,n4,n5)*rat(2*ep+n2+n3+n5-4,1)
      +Z(-1,n1,n2,-1+n3,n4,n5)*rat(-2*ep-n2-n3-n5+4,1)
      +Z(-1,n1,n2,n3,-1+n4,n5)*rat(-2*ep-n1-n4-n5+4,1)
      +Z(0,n1,n2,n3,n4,n5)*rat(-n1-n2+n3+n4,1)
      );
L	G2 = Z(-1,n1,-1+n2,n3,n4,n5) + RAT(2*ep+2*n3+2*n4+2*n5-6,1)*(
      +Z(-1,n1,n2,-1+n3,n4,n5)*rat(6*ep+2*n1+4*n2+2*n3+4*n5-14,1)
      +Z(-1,n1,n2,n3,-1+n4,n5)*rat(4*ep+2*n1+2*n4+2*n5-8,1)
      +Z(-1,n1,n2,n3,n4,-1+n5)*rat(-4*ep-2*n1-2*n4-2*n5+8,1)
      +Z(0,n1,n2,n3,n4,n5)*rat(-2*ep-2*n3-2*n4-2*n5+6,1)
      );
L	G3 = Z(-1,n1,n2,n3,n4,-1+n5) + RAT(-8*ep-4*n2-4*n3-4*n5+16,1)*(
      +Z(-1,n1,n2,-1+n3,n4,n5)*rat(24*ep^2+8*ep*n1+20*ep*n2+20*ep*n3+8*
      ep*n4+28*ep*n5-104*ep+4*n1*n2+4*n1*n3+4*n1*n5-16*n1+4*n2^2+8*n2*
      n3+4*n2*n4+12*n2*n5-44*n2+4*n3^2+4*n3*n4+12*n3*n5-44*n3+4*n4*n5-
      16*n4+8*n5^2-60*n5+112,2*ep+n1+n4+n5-4)
      +Z(-1,n1,n2,n3,-1+n4,n5)*rat(12*ep+4*n1+4*n2+4*n3+4*n4+8*n5-28,1)
      +Z(0,n1,n2,n3,n4,n5)*rat(-8*ep^2-12*ep*n3-12*ep*n4-12*ep*n5+40*ep
      -4*n3^2-8*n3*n4-8*n3*n5+28*n3-4*n4^2-8*n4*n5+28*n4-4*n5^2+28*n5-
      48,2*ep+n1+n4+n5-4)
      );
if ( expression(G3) == 0 )
id	Z(-1,n1,n2,n3,n4,-1+n5) = -(
      +Z(-1,n1,n2,-1+n3,n4,n5)*rat(-n1-n2-n3-n4-2*n5-3*ep+7,n1+n4+n5+2*
      ep-4)
      +Z(-1,n1,n2,n3,-1+n4,n5)*rat(-n1-n2-n3-n4-2*n5-3*ep+7,n2+n3+n5+2*
      ep-4)
      +Z(0,n1,n2,n3,n4,n5)*rat(n3^2+2*n3*n4+2*n3*n5+3*n3*ep-7*n3+n4^2+2
      *n4*n5+3*n4*ep-7*n4+n5^2+3*n5*ep-7*n5+2*ep^2-10*ep+12,n1*n2+n1*n3
      +n1*n5+2*n1*ep-4*n1+n2*n4+n2*n5+2*n2*ep-4*n2+n3*n4+n3*n5+2*n3*ep-
      4*n3+n4*n5+2*n4*ep-4*n4+n5^2+4*n5*ep-8*n5+4*ep^2-16*ep+16)
      );

Print +f +s;
.sort
if ( expression(G2) == 0 )
id	Z(-1,n1,-1+n2,n3,n4,n5) = -(
      +Z(-1,n1,n2,-1+n3,n4,n5)*rat(n2-n4,n3+n4+n5+ep-3)
      +Z(-1,n1,n2,n3,-1+n4,n5)*rat(-n1^2-2*n1*n4-2*n1*n5-3*n1*ep+7*n1-
      n4^2-2*n4*n5-3*n4*ep+7*n4-n5^2-3*n5*ep+7*n5-2*ep^2+10*ep-12,n2*n3
      +n2*n4+n2*n5+n2*ep-3*n2+n3^2+n3*n4+2*n3*n5+3*n3*ep-7*n3+n4*n5+2*
      n4*ep-4*n4+n5^2+3*n5*ep-7*n5+2*ep^2-10*ep+12)
      +Z(0,n1,n2,n3,n4,n5)*rat(-n2+n4,n2+n3+n5+2*ep-4)
      );
Multiply replace_(n1,1+ep,n2,1+ep,n3,1+ep,n4,1+ep,n5,1+ep);
Print +f +s;
.end




Multiply replace_(n1,1+ep,n2,1+ep,n3,1+ep,n4,1+ep,n5,1+ep);
Print +f +s;
.sort
id	Z(-1,1+ep,ep,1+ep,1+ep,1+ep) = -(
      +Z(-1,1+ep,1+ep,1+ep,1+ep,ep)*rat(-5*ep+1,4*ep)
      +Z(-1,1+ep,1+ep,1+ep,ep,1+ep)*rat(5*ep-1,4*ep)
      +Z(-1,1+ep,1+ep,ep,1+ep,1+ep)*rat(9*ep-1,4*ep)
      +Z(0,1+ep,1+ep,1+ep,1+ep,1+ep)*rat(-1,1));
Print +f +s;
.end


id	Z(-1,n1,-1+n2,n3,n4,n5) = -(
      +Z(-1,n1,n2,-1+n3,n4,n5)*rat(n1+2*n2+n3+2*n5+3*ep-7,n3+n4+n5+ep-3
      )
      +Z(-1,n1,n2,n3,-1+n4,n5)*rat(n1+n4+n5+2*ep-4,n3+n4+n5+ep-3)
      +Z(-1,n1,n2,n3,n4,-1+n5)*rat(-n1-n4-n5-2*ep+4,n3+n4+n5+ep-3)
      +Z(0,n1,n2,n3,n4,n5)*rat(-1,1)
      );

Print +f +s;
.end
