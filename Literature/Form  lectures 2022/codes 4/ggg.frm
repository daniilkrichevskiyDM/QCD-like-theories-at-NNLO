#-
#include declare.h
*
Local Fg =  
      +tg(1,1)*(-d2/L^2+mu/d2)
      +tg(2,2)*(L^2*d2*rho^2/d1)
      +tg(3,3)*(L^2)
      +tg(4,4)*(L^2*sint1^2)
      +tg(5,5)*(L^2*cost1^2)
      +tg(6,6)*(L^2*cost2^2*sint1^2)
      +tg(7,7)*(L^2*sint1^2*sint2^2)
      +tg(8,8)*(d2)
      +tg(9,9)*(d2)
      +tg(10,10)*(d2)
      +(tg(1,5)+tg(5,1))*(-L*scqmu*cost1^2/d2)
      +(tg(1,6)+tg(6,1))*(-L*scqmu*cost2^2*sint1^2/d2)
      +(tg(1,7)+tg(7,1))*(-L*scqmu*sint2^2*sint1^2/d2)
        ;
Bracket tg;
.sort
FillExpression G = Fg(tg);
Drop;
.sort
#call minors(Finv,G,tgi,10)
.sort
#call simd1d2
Format 64;
Print +f;
B	tgi;
.sort
Local Finv = Finv/(Finv[tgi(0,0)])-tgi(0,0);
B	tgi;
.sort
FillExpression GI = Finv(tgi);
Drop;
.sort
Local Fone = tone(i1,i3)*G(i1,i2)*GI(i2,i3);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
#call simd1d2
B	tone;
Print +f;
.sort
Drop;
L   FGamma = +1/2*tgamma(i1,i2,i3)*GI(i1,i4)*der(i2,G(i4,i3))
		     +1/2*tgamma(i1,i2,i3)*GI(i1,i4)*der(i3,G(i2,i4))
		     -1/2*tgamma(i1,i2,i3)*GI(i1,i4)*der(i4,G(i2,i3));

Sum i1,1,...,10;
Sum i4,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
#call derivative
#call simd1d2
B	tgamma;
.sort
Fillexpression Gamma = FGamma(tgamma);
Drop;
*
*	Set up the Riemann tensor.
*	Note that the first index is upper, the other three lower.
*
L   FRiemann =
		+triemann(i1,i2,i3,i4)*der(i3,Gamma(i1,i2,i4))
		-triemann(i1,i2,i4,i3)*der(i3,Gamma(i1,i2,i4))
		+triemann(i1,i2,i4,i3)*Gamma(i1,i4,i5)*Gamma(i5,i3,i2)
		-triemann(i1,i2,i3,i4)*Gamma(i1,i4,i5)*Gamma(i5,i3,i2);
if ( count(der,1) );
	Sum i1,1,...,10;
	Sum i2,1,...,10;
	Sum i4,1,...,10;
	id	der(?a,0) = 0;
else;
	Sum i1,1,...,10;
	Sum i5,1,...,10;
	Sum i4,1,...,10;
endif;
.sort
if ( count(der,1) );
	Sum i3,1,...,10;
else;
	Sum i2,1,...,10;
	Sum i3,1,...,10;
endif;
#call derivative
#call simd1d2
B	triemann;
.sort
FillExpression Riemann = FRiemann(triemann);
Drop;
.sort
L   FRicci  = tricci(i1,i2)*Riemann(i3,i1,i3,i2); 
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	 tricci;
Print +f;
.sort
FillExpression Ricci = FRicci(tricci);
Drop;
.sort
L	FR = tr*GI(i1,i2)*Ricci(i1,i2);
Sum i1,1,...,10;
Sum i2,1,...,10;
#call simd1d2
B	tr;
Print +f +s;
.sort
Hide FR;
*--#[ Weyl tensor :
*
*	The Weyl tensor is defined (Wikipedia) by
*	W(i1,i2,i3,i4)=R(i1,i2,i3,i4)-1/(n-2)*(Ric-s/n*g)#g-s/(2*n*(n-1))g#g
*	(A#B)(i1,i2,i3,i4) = A(i1,i3)*B(i2,i4)+A(i2,i4)*B(i1,i3)
*		-A(i1,i4)*B(i2,i3)-A(i2,i3)*B(i1,i4)
*	The scalar curvature s is defined by R or FR
*	Note that we have to worry about upper and lower indices.
*	The version Fweyl has one upper and three lower indices.
*	The version Fweyl2 has four lower indices.
*
*	Note that the weyl tensor is symmetric in the (1,2)(3,4) pair
*	and antisymmetric inside those pairs
*
L	Fweyl0000 = tweyl(i1,i2,i3,i4)*(G(i1,i5)*Riemann(i5,i2,i3,i4)
			-1/8*Conv(Ricci,G,i1,i2,i3,i4)
			+R/80*Conv(G,G,i1,i2,i3,i4)
			-R/180*Conv(G,G,i1,i2,i3,i4));
id	Conv(f1?,f2?,i1?,i2?,i3?,i4?) =
			+f1(i1,i3)*f2(i2,i4)+f1(i2,i4)*f2(i1,i3)
			-f1(i1,i4)*f2(i2,i3)-f1(i2,i3)*f2(i1,i4);
.sort
if ( count(Riemann,1) );
	Sum i5,1,...,10;
endif;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i1,1,...,10;
.sort:weyl-3;
id	R = FR[tr];
#call simd1d2
B	tweyl;
.sort
FillExpression Weyl0000 = Fweyl0000(tweyl);
Drop;
.sort
**
**	Test1: Check that it is traceless in all combinations.
**
*L	Trace1 = tweyl(i1,i2)*Weyl0000(i1,i2,i3,i4)*GI(i3,i4);
*L	Trace2 = tweyl(i1,i3)*Weyl0000(i1,i2,i3,i4)*GI(i2,i4);
*L	Trace3 = tweyl(i1,i4)*Weyl0000(i1,i2,i3,i4)*GI(i2,i3);
*L	Trace4 = tweyl(i2,i3)*Weyl0000(i1,i2,i3,i4)*GI(i1,i4);
*L	Trace5 = tweyl(i2,i4)*Weyl0000(i1,i2,i3,i4)*GI(i1,i3);
*L	Trace6 = tweyl(i3,i4)*Weyl0000(i1,i2,i3,i4)*GI(i1,i2);
*Sum i1,1,...,10;
*Sum i2,1,...,10;
*Sum i3,1,...,10;
*Sum i4,1,...,10;
*.sort
*#call simd1d2
* 
*B	tweyl;
*.sort
*Drop;
L	Fweyl0001 = tweyl(i1,i2,i3,i4)*GI(i4,i5)*Weyl0000(i1,i2,i3,i5);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl0001 = Fweyl0001(tweyl);
Drop;
.sort
L	Fweyl1000 = tweyl(i1,i2,i3,i4)*GI(i1,i5)*Weyl0000(i5,i2,i3,i4);
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i1,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl1000 = Fweyl1000(tweyl);
Drop;
.sort
L	Fweyl1100 = tweyl(i1,i2,i3,i4)*GI(i2,i5)*Weyl1000(i1,i5,i3,i4);
Sum i1,1,...,10;
Sum i5,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i2,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl1100 = Fweyl1100(tweyl);
Drop;
.sort
L	Fweyl1010 = tweyl(i1,i2,i3,i4)*GI(i3,i5)*Weyl1000(i1,i2,i5,i4);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl1010 = Fweyl1010(tweyl);
Drop;
.sort
L	Fweyl1001 = tweyl(i1,i2,i3,i4)*GI(i4,i5)*Weyl1000(i1,i2,i3,i5);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl1001 = Fweyl1001(tweyl);
Drop;
.sort
L	Fweyl0101 = tweyl(i1,i2,i3,i4)*GI(i2,i5)*Weyl0001(i1,i5,i3,i4);
Sum i1,1,...,10;
Sum i5,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i2,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl0101 = Fweyl0101(tweyl);
Drop;
.sort
L	Fweyl1110 = tweyl(i1,i2,i3,i4)*GI(i3,i5)*Weyl1100(i1,i2,i5,i4);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl1110 = Fweyl1110(tweyl);
Drop;
.sort
L	Fweyl1011 = tweyl(i1,i2,i3,i4)*GI(i3,i5)*Weyl1001(i1,i2,i5,i4);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl1011 = Fweyl1011(tweyl);
Drop;
.sort
L	Fweyl0111 = tweyl(i1,i2,i3,i4)*GI(i3,i5)*Weyl0101(i1,i2,i5,i4);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	tweyl;
.sort
FillExpression Weyl0111 = Fweyl0111(tweyl);
Drop;
.sort
L	Fweyl1111 = tweyl(i1,i2,i3,i4)*GI(i4,i5)*Weyl1110(i1,i2,i3,i5);
Sum i5,1,...,10;
Sum i4,1,...,10;
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
 
#call simd1d2
B	tweyl;
.sort
FillExpression Weyl1111 = Fweyl1111(tweyl);
Drop;
.sort
*--#] Weyl tensor : 
*--#[ Definition of the five form :
*
*	We define the nonzero elements up to antisymmetrization
*
L	Ffive00000 =
      +tfive(1,2,8,9,10)*( 4*rho*(rho^2+q)/L)
      +tfive(3,5,8,9,10)*( 2*L^2*cost1*sint1*scqmu)
      +tfive(3,6,8,9,10)*(-2*L^2*cost1*sint1*cost2^2*scqmu)
      +tfive(3,7,8,9,10)*(-2*L^2*cost1*sint1*sint2^2*scqmu)
      +tfive(4,6,8,9,10)*( 2*L^2*sint1^2*sint2*cost2*scqmu)
      +tfive(4,7,8,9,10)*(-2*L^2*sint1^2*sint2*cost2*scqmu)
		;
id	scqmu^2=mu*q;

*
*	Now generate all antisymmetric permutations:
*
id	tfive(i1?,...,i5?) = e_(i1,...,i5)*e_(i6,...,i10)*tfive(i6,...,i10);
Contract;
#call simd1d2
B tfive;
Print +f;
.sort
FillExpression Five00000 = Ffive00000(tfive);
Drop;
.sort
L	Ffive00001 = tfive(i1,i2,i3,i4,i5)*Five00000(i1,i2,i3,i4,i6)*GI(i5,i6);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i6,1,...,10;
Sum i5,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression Five00001=Ffive00001(tfive);
Drop;
.sort
L	Ffive00011 = tfive(i1,i2,i3,i4,i5)*Five00001(i1,i2,i3,i6,i5)*GI(i4,i6);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i6,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression Five00011=Ffive00011(tfive);
Drop;
.sort
L	Ffive00111 = tfive(i1,i2,i3,i4,i5)*Five00011(i1,i2,i6,i4,i5)*GI(i3,i6);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i6,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression Five00111=Ffive00111(tfive);
Drop;
.sort
L	Ffive01111 = tfive(i1,i2,i3,i4,i5)*Five00111(i1,i6,i3,i4,i5)*GI(i2,i6);
Sum i1,1,...,10;
Sum i6,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i2,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression Five01111=Ffive01111(tfive);
Drop;
.sort
L	Ffive11111 = tfive(i1,i2,i3,i4,i5)*Five01111(i6,i2,i3,i4,i5)*GI(i1,i6);
Sum i6,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i1,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression Five11111=Ffive11111(tfive);
Drop;
.sort
L	F55 = Five00000(i1,i2,i3,i4,i5)*Five11111(i1,i2,i3,i4,i5);
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i1,1,...,10;
#call simd1d2
Print +f +s;
.sort
Drop;
.sort
on statistics;

L   FHDfive00000=u3*L^5*tfive(i1,i2,i3,i4,i5)*((1/120)*rho*(q+rho^2)*cost1*sint1^3*sint2*cost2)*e_(i1,...,i10)*Five11111(i6,...,i10);
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;

id 	e_(1,2,3,4,5,6,7,8,9,10)=i_;
#call simd1d2
 
B	tfive;
.sort
FillExpression HDfive00000=FHDfive00000(tfive);
Drop;
.sort
L   FCfive00000=tfive(i1,i2,i3,i4,i5)*(Five00000(i1,...,i5)+HDfive00000(i1,...,i5));
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression CFive00000=FCfive00000(tfive);
Drop;
.sort
L	FCfive00001 = tfive(i1,i2,i3,i4,i5)*CFive00000(i1,i2,i3,i4,i6)*GI(i5,i6);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i6,1,...,10;
Sum i5,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression CFive00001=FCfive00001(tfive);
Drop;
.sort
L	FCfive00011 = tfive(i1,i2,i3,i4,i5)*CFive00001(i1,i2,i3,i6,i5)*GI(i4,i6);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i6,1,...,10;
Sum i5,1,...,10;
Sum i4,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression CFive00011=FCfive00011(tfive);
Drop;
.sort
L	FCfive00111 = tfive(i1,i2,i3,i4,i5)*CFive00011(i1,i2,i6,i4,i5)*GI(i3,i6);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i6,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression CFive00111=FCfive00111(tfive);
Drop;
.sort
L	FCfive01111 = tfive(i1,i2,i3,i4,i5)*CFive00111(i1,i6,i3,i4,i5)*GI(i2,i6);
Sum i1,1,...,10;
Sum i6,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i2,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression CFive01111=FCfive01111(tfive);
Drop;
.sort
L	FCfive11111 = tfive(i1,i2,i3,i4,i5)*CFive01111(i6,i2,i3,i4,i5)*GI(i1,i6);
Sum i6,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i1,1,...,10;
#call simd1d2
 
B	tfive;
.sort
FillExpression CFive11111=FCfive11111(tfive);
Drop;
.sort

*L	Ffivetest = tt*Five00000(i1,i2,i3,i4,i5)*Five11111(i1,i2,i3,i4,i5);
*Sum i1,1,...,10;
*Sum i2,1,...,10;
*Sum i3,1,...,10;
*Sum i4,1,...,10;
*Sum i5,1,...,10;
*.sort
*#call simsincos
*Print +f;
*B	tt;
*.sort
*Drop;
*--#] Definition of the five form : 
*--#[ Ttensor :
*
L	FT000000 =
	+i_*der(i1,CFive00000(i2,i3,i4,i5,i6))*tt(i1,i2,i3,i4,i5,i6)
	-i_*Gamma(i7,i1,i2)*CFive00000(i7,i3,i4,i5,i6)*tt(i1,i2,i3,i4,i5,i6)
	-i_*Gamma(i7,i1,i2)*CFive00000(i3,i7,i4,i5,i6)*tt(i1,i3,i2,i4,i5,i6)
	-i_*Gamma(i7,i1,i2)*CFive00000(i4,i3,i7,i5,i6)*tt(i1,i4,i3,i2,i5,i6)
	-i_*Gamma(i7,i1,i2)*CFive00000(i5,i3,i4,i7,i6)*tt(i1,i5,i3,i4,i2,i6)
	-i_*Gamma(i7,i1,i2)*CFive00000(i6,i3,i4,i5,i7)*tt(i1,i6,i3,i4,i5,i2)
	+1/16*CFive00000(i1,i2,i3,i7,i8)*CFive00011(i4,i5,i6,i7,i8)*tt(i1,i2,i3,i4,i5,i6)
	-3/16*CFive00000(i1,i2,i3,i7,i8)*CFive00011(i4,i5,i6,i7,i8)*tt(i1,i2,i6,i4,i5,i3)
	;
.sort
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i6,1,...,10;
.sort
if ( count(der,1) );
	Sum i2,1,...,10;
	Sum i3,1,...,10;
	id	der(x?,0) = 0;
	id	der(i?,0) = 0;
elseif ( count(Gamma,1) );
	Sum i3,1,...,10;
	Sum i7,1,...,10;
else;
	Sum i7,1,...,10;
	Sum i8,1,...,10;
endif;
.sort
if ( count(Gamma,1) );
	Sum i1,1,...,10;
	Sum i2,1,...,10;
elseif ( count(der,1) );
	Sum i1,1,...,10;
else;
	Sum i1,1,...,10;
	Sum i2,1,...,10;
	Sum i3,1,...,10;
endif;
.sort
#call derivative
#call simd1d2
.sort
*
*	Now we impose the symmetries.
*
id	tt(x1?,x2?,x3?,?a) = (tt(x1,x2,x3,?a)-tt(x2,x1,x3,?a)+tt(x2,x3,x1,?a)
		-tt(x3,x2,x1,?a)+tt(x3,x1,x2,?a)-tt(x1,x3,x2,?a))/6;
.sort
id	tt(?a,x1?,x2?,x3?) = (tt(?a,x1,x2,x3)-tt(?a,x2,x1,x3)+tt(?a,x2,x3,x1)
		-tt(?a,x3,x2,x1)+tt(?a,x3,x1,x2)-tt(?a,x1,x3,x2))/6;
.sort
id	tt(x1?,x2?,x3?,x4?,x5?,x6?) = (tt(x1,x2,x3,x4,x5,x6)+tt(x4,x5,x6,x1,x2,x3))/2;
#call simd1d2
b	tt;
.sort
FillExpression T000000 = FT000000(tt);
Drop;
.sort
L	FT100000 = tt(i1,i2,i3,i4,i5,i6)*T000000(i7,i2,i3,i4,i5,i6)*GI(i1,i7);
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i1,1,...,10;
#call simd1d2
 
B	tt;
.sort
FillExpression T100000 = FT100000(tt);
Drop;
.sort
L	FT100100 = tt(i1,i2,i3,i4,i5,i6)*T100000(i1,i2,i3,i7,i5,i6)*GI(i4,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i4,1,...,10;
#call simd1d2
 
B	tt;
.sort
FillExpression T100100 = FT100100(tt);
Drop;
.sort
L	FT110100 = tt(i1,i2,i3,i4,i5,i6)*T100100(i1,i7,i3,i4,i5,i6)*GI(i2,i7);
Sum i1,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i2,1,...,10;
#call simd1d2
 
B	tt;
.sort
FillExpression T110100 = FT110100(tt);
Drop;
.sort
L	FT110110 = tt(i1,i2,i3,i4,i5,i6)*T110100(i1,i2,i3,i4,i7,i6)*GI(i5,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
Sum i4,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i5,1,...,10;
#call simd1d2
 
B	tt;
.sort
FillExpression T110110 = FT110110(tt);
Drop;
.sort
L	FT111110 = tt(i1,i2,i3,i4,i5,i6)*T110110(i1,i2,i7,i4,i5,i6)*GI(i3,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i3,1,...,10;
#call simd1d2
 
B	tt;
.sort
FillExpression T111110 = FT111110(tt);
Drop;
.sort
L	FT111111 = tt(i1,i2,i3,i4,i5,i6)*T111110(i1,i2,i3,i4,i5,i7)*GI(i6,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i7,1,...,10;
Sum i6,1,...,10;
#call simd1d2
 
B	tt;
.sort
FillExpression T111111 = FT111111(tt);
Drop;
.end

