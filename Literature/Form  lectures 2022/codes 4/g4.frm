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
.end

