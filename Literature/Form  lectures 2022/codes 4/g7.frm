#-
#: LargeSize 1G
#: SmallSize 200M
#: TermsInSmall 2M
#: ScratchSize 1G
*--#[ Declarations :
Dimension 10;
S   rho,scqmu,cqmu,mu,q,L,d1,d1i,d2,d2i,sint1,cost1,sint2,cost2,n,u1,u2,u3;
CF  acc,sym,der,gamma,rem,Ric,Rim,den,den2;
CF	Conv,f1,f2,R;
F   epf;
AutoDeclare index i;
AutoDeclare symbol x;
AutoDeclare CFunction t,w,T,five;
Set params:q,L,mu,scqmu,cqmu;
Set vars:rho,sint1,cost1,sint2,cost2,u3;
CTable,zerofill,G(1:10,1:10);
CTable,zerofill,GI(1:10,1:10);
CTable,zerofill,Gamma(1:10,1:10,1:10);
CTable,zerofill,Five00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five00001(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five00011(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five00111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five01111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five11111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,HDfive00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00001(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00011(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive01111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive11111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CHDfive00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CA(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T000000(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T000001(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T100000(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T100100(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T000011(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110100(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110110(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111110(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111011(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T011111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T001111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110000(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111000(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Riemann(1:10,1:10,1:10,1:10);
CTable,zerofill,Ricci(1:10,1:10);
CTable,zerofill,Weyl0000(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1000(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl0001(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1100(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1010(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1001(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl0101(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1110(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl0111(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1011(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1111(1:10,1:10,1:10,1:10);
Format nospaces;
.global
*--#] Declarations : 
*--#[ Routines :
* 	#[ derivative :
*
#procedure derivative
*
*	Procedure takes the derivative for our special case.
*
id	der(x?,0) = 0;
id	der(x?,xx?params) = 0;
id	der(x?{1,5,6,7,8,9,10},?a) = 0;
.sort: derivative-1;
SplitArg,der;
repeat id der(x1?,x2?,x3?,?a) = der(x1,x2)+der(x1,x3,?a);
FactArg,der;
id	der(x?,?a,x1?number_,?b) = der(x,?a,?b)*x1;
repeat id der(x?,?a,xx?params,?b) = der(x,?a,?b)*xx;
repeat id der(x?,?a,1/xx?params,?b) = der(x,?a,?b)/xx;
id	der(x?) = 0;
*
*	chain rule:
*
repeat;
	id	der(x?,x1?,x2?,?a) = der(x,x1)*rem(x2,?a)+x1*der(x,x2,?a);
endrepeat;
repeat id rem(x?,?a) = x*rem(?a);
id	rem = 1;
id	der(x1?,i_) = 0;
id	der(x1?,1/x2?vars) = -der(x1,x2)/x2^2;
id	der(x1?,1/d1) = -der(x1,d1)/d1^2;
id	der(x1?,1/d1^2) = -2*der(x1,d1)/d1^3;
id	der(x1?,1/d2) = -der(x1,d2)/d2^2;
id	der(x1?,1/d2^2) = -2*der(x1,d2)/d2^3;
id	der(x1?,1/d2^3) = -3*der(x1,d2)/d2^4;
id  der(2,rho)  = 1;
id	der(2,d1) = 6*rho*(rho^2+q)^2-2*rho*mu*L^2;
id	der(2,d2) = 2*rho;
id  der(3,sint1)= cost1;
id  der(3,cost1)= -sint1;
id  der(3,d1)=0;
id  der(3,d2)=0;
id  der(4,sint2)= cost2;
id  der(4,cost2)= -sint2;
id  der(4,d1)=0;
id  der(4,d2)=0;
id	der(x1?{2,3,4},x2?vars) = 0;
#endprocedure
*
* 	#] derivative : 
* 	#[ sima :
*
#procedure sima
id scqmu^2=q*mu;
*id	q = d2-rho^2;
*.sort
*repeat id	d2^3/d1 = 1+mu*L^2*rho^2/d1;
*.sort
*id	d1 = d2^2-mu*L^2*rho^2;
*.sort
*id	d2 = rho^2+q;
**
**repeat id 1/d1/d2=(d2^2/d1-1/d2)/mu/L^2/rho^2;
**id	d2 = rho^2+q;
**.sort
**repeat id 1/d2*rho^2=1-q/d2;
**.sort
***repeat id 1/d1*rho^2= (1+(L^2*mu-q^2-2*q*rho^2)/d1)/rho^2;
***.sort
****repeat id 1/d1*rho^2=+rho^-2-1/d1*rho^-2*q^2+1/d1*rho^-2*L^2*mu-2/d1*q;
****.sort
**repeat id 1/d2/rho=-rho/q*(1/d2-1/rho^2);
**.sort
#endprocedure
*
* 	#] sima : 
* 	#[ simsincos :
*
#procedure simsincos
*
*	Tries to simplify sin^ and cos^ in the output
*
*
id	sint1^2 = 1-cost1^2;
id	sint2^2 = 1-cost2^2;
id	cost1^2 = 1-sint1^2;
id	cost2^2 = 1-sint2^2;

AB	sint1,cost1,sint2,cost2;
.sort: simplify;
*
*	Now we try to find the best configuration for sin and cos
*
Collect acc;
$ct1max = 0;
$st1max = 0;
$ct2max = 0;
$st2max = 0;
Argument acc;
	if ( count(sint1,-1) > $st1max ) $st1max = count_(sint1,-1);
	if ( count(sint2,-1) > $st2max ) $st2max = count_(sint2,-1);
	if ( count(cost1,-1) > $ct1max ) $ct1max = count_(cost1,-1);
	if ( count(cost2,-1) > $ct2max ) $ct2max = count_(cost2,-1);
EndArgument;
Multiply 1/sint1^$st1max/cost1^$ct1max/sint2^$st2max/cost2^$ct2max;
Argument acc;
	Multiply sint1^$st1max*cost1^$ct1max*sint2^$st2max*cost2^$ct2max;
	id	cost1^2 = 1-sint1^2;
	id	cost2^2 = 1-sint2^2;
EndArgument;
FactArg,acc;
Chainout,acc;
id	acc(-1+cost1)*acc(1+cost1) = -sint1^2;
id	acc(-1+cost2)*acc(1+cost2) = -sint2^2;
id	acc(-1+sint1)*acc(1+sint1) = -cost1^2;
id	acc(-1+sint2)*acc(1+sint2) = -cost2^2;
id	acc(x?) = x;
ModuleOption,local,$ct1max,$st1max,$ct2max,$st2max;
.sort
#endprocedure
*
* 	#] simsincos : 
* 	#[ simpli :
*
#procedure simpli(bra)
B	`bra';
*Print +f;
.sort:simpli;
Collect acc;
$d1max = 0;
$d2max = 0;
Argument,acc;
	if ( count(d1,-1) > $d1max ) $d1max = count_(d1,-1);
	if ( count(d2,-1) > $d2max ) $d2max = count_(d2,-1);
EndArgument;
Multiply 1/d1^$d1max/d2^$d2max;
Argument,acc;
	Multiply d1^$d1max*d2^$d2max;
	id	d2 = rho^2+q;
	id	d1 = q^3+3*q*rho^4+3*rho^2*q^2+rho^6-L^2*rho^2*mu;
EndArgument;
FactArg,acc;
ChainOut acc;
id	acc(x?number_) = x;
id	acc(x?symbol_) = x;
id	acc(1/x?symbol_) = 1/x;
id	acc(q+rho^2) = d2;
id	acc(-q^3+mu*L^2*rho^2-3*rho^2*q^2-3*rho^4*q-rho^6) = -d1;
Argument,acc;
	id	rho^2 = d2-q;
	id	mu*rho^2*L^2 = d2^3-d1;
EndArgument;
id	acc(x?) = x;
ModuleOption,local,$d1max,$d2max;
.sort:simpli1;
#endprocedure
* 	#] simpli : 
*--#] Routines : 
*--#[ Definition g, gi :
L   Fg =  
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

L   Fgi = 
          +tgi(1,1)*(-L^2*d2^2/d1)
          +tgi(2,2)*(d2^2*L^-2*rho^-2-mu/d2)
          +tgi(3,3)*(L^-2)
          +tgi(4,4)*(L^-2*sint1^-2)
          +tgi(5,5)*(L^-2*cost1^-2-q*mu/d1)
          +tgi(6,6)*(L^-2*sint1^-2*cost2^-2-q*mu/d1)
          +tgi(7,7)*(L^-2*sint1^-2*sint2^-2-q*mu/d1)
          +tgi(8,8)*(1/d2)
          +tgi(9,9)*(1/d2)
          +tgi(10,10)*(1/d2)
          +(tgi(5,1)+tgi(1,5))*(-L*scqmu*d2/d1)
          +(tgi(6,1)+tgi(1,6))*(-L*scqmu*d2/d1)
          +(tgi(7,1)+tgi(1,7))*(-L*scqmu*d2/d1)
          +(tgi(5,6)+tgi(6,5))*(-mu*q/d1)
          +(tgi(6,7)+tgi(7,6))*(-mu*q/d1)
          +(tgi(7,5)+tgi(5,7))*(-mu*q/d1)
        ;
B	tg,tgi;
.sort
Fillexpression G = Fg(tg);
Fillexpression GI = Fgi(tgi);
Drop;
.sort
*--#] Definition g, gi : 
*--#[ Test of g, gi :
L	Fone = tone(i1,i3)*G(i1,i2)*GI(i2,i3);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
#call sima
#call simsincos
#call simpli(tone)
#call simsincos
B	tone;
Print +f;
.sort
Drop;
.sort
*--#] Test of g, gi : 
*--#[ Gamma :

L   FGamma = +1/2*tgamma(i1,i2,i3)*GI(i1,i4)*der(i2,G(i4,i3))
		     +1/2*tgamma(i1,i2,i3)*GI(i1,i4)*der(i3,G(i2,i4))
		     -1/2*tgamma(i1,i2,i3)*GI(i1,i4)*der(i4,G(i2,i3));

Sum i1,1,...,10;
Sum i4,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
#call derivative
#call sima
#call simsincos
#call simpli(tgamma)
#call simsincos
B	tgamma;
.sort
Fillexpression Gamma = FGamma(tgamma);
Drop;
.sort
*--#] Gamma : 
*--#[ Riemann tensor :
*
*	Set up the Riemann tensor. When we sum over the indices we take into
*	account that in FGamma all elements with 8,9,10 are zero. Hence we have
*	to sum only till 7. This saves much time.
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
#call sima
#call simsincos
#call simpli(triemann)
#call simsincos

B	triemann;
.sort
FillExpression Riemann = FRiemann(triemann);
Drop;
.sort
*--#] Riemann tensor : 
*--#[ Ricci tensor :
L   FRicci  = tricci(i1,i2)*Riemann(i3,i1,i3,i2); 
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
#call sima
#call simsincos
#call simpli(tricci)
#call simsincos
 
B	 tricci;
*Print +f;
.sort
FillExpression Ricci = FRicci(tricci);
Drop;
.sort
L	FR = tr*GI(i1,i2)*Ricci(i1,i2);
Sum i1,1,...,10;
Sum i2,1,...,10;
#call sima
#call simsincos
#call simpli(tr)
#call simsincos
B	tr;
Print +f +s;
.sort
Hide FR;
*--#] Ricci tensor : 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
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
*#call sima
*#call simsincos
*#call simpli(tweyl)
*#call simsincos
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
 
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
 
#call sima
#call simsincos
#call simpli(tweyl)
#call simsincos
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tfive)
#call simsincos
 
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
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
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
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
b	tt;
.sort
FillExpression T000000 = FT000000(tt);
Drop;
.sort
L	FT100000 = tt(i1,i2,i3,i4,i5,i6)*T000000(i7,i2,i3,i4,i5,i6)*GI(i1,i7);
L	FT000001 = tt(i6,i2,i3,i4,i5,i1)*T000000(i6,i2,i3,i4,i5,i7)*GI(i1,i7);
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i1,1,...,10;
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T100000 = FT100000(tt);
FillExpression T000001 = FT000001(tt);
Drop;
.sort
L	FT100100 = tt(i1,i2,i3,i4,i5,i6)*T100000(i1,i2,i3,i7,i5,i6)*GI(i4,i7);
L	FT000011 = tt(i1,i2,i3,i5,i4,i6)*T000001(i1,i2,i3,i5,i7,i6)*GI(i4,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i4,1,...,10;
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T100100 = FT100100(tt);
FillExpression T000011 = FT000011(tt);
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
#call sima
#call simsincos 
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T110100 = FT110100(tt);
Drop;
.sort
L	FT110000 = tt(i1,i2,i3,i4,i5,i6)*T110100(i1,i2,i3,i7,i5,i6)*G(i4,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i4,1,...,10;
#call sima
#call simsincos 
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T110000 = FT110000(tt);
Drop;
.sort
L	FT111000 = tt(i1,i2,i3,i4,i5,i6)*T110000(i1,i2,i7,i4,i5,i6)*GI(i3,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i3,1,...,10;
#call sima
#call simsincos 
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T111000 = FT111000(tt);
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
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T110110 = FT110110(tt);
Drop;
.sort
L	FT111110 = tt(i1,i2,i3,i4,i5,i6)*T110110(i1,i2,i7,i4,i5,i6)*GI(i3,i7);
L	FT110111 = tt(i1,i2,i6,i4,i5,i3)*T110110(i1,i2,i6,i4,i5,i7)*GI(i3,i7);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i3,1,...,10;
#call sima
#call simsincos 
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T111110 = FT111110(tt);
FillExpression T110111 = FT110111(tt);
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
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T111111 = FT111111(tt);
Drop;
.sort
L	FT011111 = tt(i1,i2,i3,i4,i5,i6)*T111111(i7,i2,i3,i4,i5,i6)*G(i1,i7);
L	FT111011 = tt(i4,i2,i3,i1,i5,i6)*T111111(i4,i2,i3,i7,i5,i6)*G(i1,i7);
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i1,1,...,10;
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T011111 = FT011111(tt);
FillExpression T111011 = FT111011(tt);
Drop;
.sort
L	FT001111 = tt(i1,i2,i3,i4,i5,i6)*T011111(i1,i7,i3,i4,i5,i6)*G(i2,i7);
Sum i1,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i2,1,...,10;
#call sima
#call simsincos
#call simpli(tt)
#call simsincos
 
B	tt;
.sort
FillExpression T001111 = FT001111(tt);
Drop;
.sort
*--#] Ttensor : 
*--#[ Invariants :
* 	#[ Invariant 1 :
L	Finv1 = -43008*Weyl0000(i1,i2,i3,i4)*
	               Weyl1100(i1,i2,i5,i6)*
	               Weyl1100(i3,i5,i7,i8)*
	               Weyl1111(i4,i7,i6,i8);
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
.sort
Sum i7,1,...,10;
Sum i8,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)

Print +f +s;
.sort
Hide Finv1;
* 	#] Invariant 1 : 
* 	#[ Invariant 2 :
L	Finv2 = 86016*Weyl0000(i1,i2,i3,i4)*
	              Weyl1010(i1,i5,i3,i6)*
	              Weyl1010(i2,i7,i5,i8)*
	              Weyl1111(i4,i7,i6,i8);
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
Sum i5,1,...,10;
Sum i6,1,...,10;
.sort
Sum i7,1,...,10;
Sum i8,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv2;
* 	#] Invariant 2 : 
* 	#[ Invariant 3 :
L	Finv3 = 129024*Weyl1111(i1,i2,i3,i4)*
	               Weyl0101(i1,i5,i6,i7)*
	               Weyl0111(i2,i6,i8,i9)*
	               T000000(i3,i4,i5,i7,i8,i9);
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
.sort
Sum i7,1,...,10;
Sum i8,1,...,10;
Sum i9,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
Sum i6,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv3;
* 	#] Invariant 3 : 
* 	#[ Invariant 4 :
L	Finv4 =  30240*Weyl0000(i1,i2,i3,i4)*
	               Weyl1111(i1,i2,i3,i5)*
	               T111111(i4,i6,i7,i8,i9,i10)*
	               T000000(i5,i6,i8,i7,i9,i10);
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i4,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv4;
* 	#] Invariant 4 : 
* 	#[ Invariant 5 :
L	Finv5 =   7392*Weyl0000(i1,i2,i3,i4)*
	               Weyl1111(i1,i2,i5,i6)*
	               T111111(i3,i4,i7,i8,i9,i10)*
	               T000000(i5,i6,i7,i8,i9,i10);
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv5;
* 	#] Invariant 5 : 
* 	#[ Invariant 6 :
L	Finv6 =  -4032*Weyl0001(i1,i2,i3,i4)*
	               Weyl1011(i1,i5,i3,i6)*
	               T111111(i2,i5,i7,i8,i9,i10)*
	               T000000(i4,i6,i7,i8,i9,i10);
Sum i4,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i2,1,...,10;
Sum i5,1,...,10;
.sort
Sum i1,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv6;
* 	#] Invariant 6 : 
* 	#[ Invariant 7 :
L	Finv7 =  -4032*Weyl0000(i1,i2,i3,i4)*
	               Weyl1111(i1,i5,i3,i6)*
	               T111111(i2,i7,i8,i4,i9,i10)*
	               T000000(i5,i7,i8,i6,i9,i10);
Sum i5,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i2,1,...,10;
Sum i4,1,...,10;
.sort
Sum i1,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv7;
* 	#] Invariant 7 : 
* 	#[ Invariant 8 :
L	Finv8 =-118272*Weyl0001(i1,i2,i3,i4)*
	               Weyl1011(i1,i5,i6,i7)*
	               T111111(i2,i3,i5,i8,i9,i10)*
	               T000000(i4,i6,i8,i7,i9,i10);
Sum i4,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i1,1,...,10;
Sum i5,1,...,10;
.sort
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv8;
* 	#] Invariant 8 : 
* 	#[ Invariant 9 :
L	Finv9 = -26880*Weyl0001(i1,i2,i3,i4)*
	               Weyl1011(i1,i5,i6,i7)*
	               T111111(i2,i3,i5,i8,i9,i10)*
	               T000000(i4,i8,i9,i6,i7,i10);
Sum i4,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i1,1,...,10;
Sum i5,1,...,10;
.sort
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv9;
* 	#] Invariant 9 : 
* 	#[ Invariant 10 :
L	Finv10 =112896*Weyl1001(i1,i2,i3,i4)*
	               Weyl0101(i1,i5,i6,i7)*
	               T111111(i2,i3,i6,i8,i9,i10)*
	               T000000(i4,i5,i8,i7,i9,i10);
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i1,1,...,10;
Sum i6,1,...,10;
.sort
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv10;
* 	#] Invariant 10 : 
* 	#[ Invariant 11 :
L	Finv11 =-96768*Weyl0001(i1,i2,i3,i4)*
	               Weyl1011(i1,i5,i6,i7)*
	               T111111(i2,i3,i8,i5,i9,i10)*
	               T000000(i4,i6,i8,i7,i9,i10);
Sum i4,1,...,10;
Sum i6,1,...,10;
Sum i7,1,...,10;
.sort
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i1,1,...,10;
Sum i5,1,...,10;
.sort
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv11;
* 	#] Invariant 11 : 
* 	#[ Invariant 12 :
L	Finv12 =  1344*Weyl0000(i1,i2,i3,i4)*
	               T111111(i1,i2,i5,i6,i7,i8)*
	               T110111(i3,i4,i5,i9,i10,i11)*
	               T000000(i6,i7,i8,i9,i10,i11);

Sum i6,1,...,10;
Sum i7,1,...,10;
Sum i8,1,...,10;
.sort
Sum i9,1,...,10;
Sum i10,1,...,10;
Sum i11,1,...,10;
.sort
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i5,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv12;
* 	#] Invariant 12 : 
* 	#[ Invariant 13 :
L	Finv13 =-12096*Weyl0000(i1,i2,i3,i4)*
	               T111111(i1,i2,i5,i6,i7,i8)*
	               T110111(i3,i4,i6,i9,i10,i11)*
	               T000000(i5,i7,i8,i9,i10,i11);
Sum i5,1,...,10;
Sum i7,1,...,10;
Sum i8,1,...,10;
.sort
Sum i9,1,...,10;
Sum i10,1,...,10;
Sum i11,1,...,10;
.sort
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i6,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv13;
* 	#] Invariant 13 : 
* 	#[ Invariant 14 :
L	Finv14 =-48384*Weyl0000(i1,i2,i3,i4)*
	               T111111(i1,i2,i5,i6,i7,i8)*
	               T110111(i3,i4,i6,i9,i10,i11)*
	               T000000(i5,i7,i9,i8,i10,i11);
Sum i5,1,...,10;
Sum i7,1,...,10;
Sum i8,1,...,10;
.sort
Sum i9,1,...,10;
Sum i10,1,...,10;
Sum i11,1,...,10;
.sort
Sum i3,1,...,10;
Sum i4,1,...,10;
Sum i6,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv14;
* 	#] Invariant 14 : 
* 	#[ Invariant 15 :
L	Finv15 = 24192*Weyl0001(i1,i2,i3,i4)*
	               T110111(i1,i2,i5,i6,i7,i8)*
	               T110111(i3,i5,i6,i9,i10,i11)*
	               T000000(i4,i7,i8,i9,i10,i11);
Sum i4,1,...,10;
Sum i7,1,...,10;
Sum i8,1,...,10;
.sort
Sum i9,1,...,10;
Sum i10,1,...,10;
Sum i11,1,...,10;
.sort
Sum i3,1,...,10;
Sum i5,1,...,10;
Sum i6,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv15;
* 	#] Invariant 15 : 
* 	#[ Invariant 16 :
L	Finv16 =  2386*T000011(i1,i2,i3,i4,i5,i6)*
	               T111111(i1,i2,i3,i4,i7,i8)*
	               T001111(i5,i7,i9,i10,i11,i12)*
	               T000000(i6,i9,i10,i8,i11,i12);
Sum i6,1,...,10;
Sum i8,1,...,10;
Sum i9,1,...,10;
.sort
Sum i10,1,...,10;
Sum i11,1,...,10;
Sum i12,1,...,10;
.sort
Sum i5,1,...,10;
Sum i7,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
Sum i4,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv16;
* 	#] Invariant 16 : 
* 	#[ Invariant 17 :
L	Finv17 = -3669*T111111(i1,i2,i3,i4,i5,i6)*
	               T000011(i1,i2,i3,i7,i8,i9)*
	               T001111(i4,i5,i10,i7,i11,i12)*
	               T000000(i6,i8,i11,i9,i10,i12);
Sum i6,1,...,10;
Sum i8,1,...,10;
Sum i9,1,...,10;
.sort
Sum i10,1,...,10;
Sum i11,1,...,10;
Sum i12,1,...,10;
.sort
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i7,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv17;
* 	#] Invariant 17 : 
* 	#[ Invariant 18 :
L	Finv18 = -1296*T000001(i1,i2,i3,i4,i5,i6)*
	               T111011(i1,i2,i3,i7,i8,i9)*
	               T111111(i4,i7,i10,i5,i11,i12)*
	               T000000(i6,i8,i10,i9,i11,i12);
Sum i6,1,...,10;
Sum i8,1,...,10;
Sum i9,1,...,10;
.sort
Sum i10,1,...,10;
Sum i11,1,...,10;
Sum i12,1,...,10;
.sort
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i7,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv18;
* 	#] Invariant 18 : 
* 	#[ Invariant 19 :
L	Finv19 = 10368*T000001(i1,i2,i3,i4,i5,i6)*
	               T111011(i1,i2,i3,i7,i8,i9)*
	               T111111(i4,i7,i10,i5,i11,i12)*
	               T000000(i6,i8,i11,i9,i10,i12);
Sum i6,1,...,10;
Sum i8,1,...,10;
Sum i9,1,...,10;
.sort
Sum i10,1,...,10;
Sum i11,1,...,10;
Sum i12,1,...,10;
.sort
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i7,1,...,10;
.sort
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv19;
* 	#] Invariant 19 : 
* 	#[ Invariant 20 :
L	Finv20 =  2688*T000000(i1,i2,i3,i4,i5,i6)*
	               T100100(i1,i7,i8,i4,i9,i10)*
	               T110110(i2,i7,i11,i5,i9,i12)*
	               T111111(i3,i8,i11,i6,i10,i12);
Sum i1,1,...,10;
Sum i2,1,...,10;
Sum i3,1,...,10;
.sort
Sum i4,1,...,10;
Sum i5,1,...,10;
Sum i6,1,...,10;
.sort
Sum i7,1,...,10;
Sum i8,1,...,10;
Sum i9,1,...,10;
Sum i10,1,...,10;
.sort
Sum i11,1,...,10;
Sum i12,1,...,10;
.sort
#call sima
#call simsincos
#call simpli(u3)
#call simsincos
#call simpli(u3)
 
Print +f +s;
.sort
Hide Finv20;
* 	#] Invariant 20 : 
*--#] Invariants : 
G	Total = <x1*Finv1>+...+<x20*Finv20>;
.sort
#call sima
#call simsincos

*id	x?{x1,...,x20} = 1;
*#call simsincos
*#call simpli(tt)
 
Print +f +s;
.store
Save Total.sav;
.end
