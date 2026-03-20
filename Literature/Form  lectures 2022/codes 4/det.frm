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
#call determ(Fdet,G,10)
.sort
id	scqmu^2 = mu*q;
repeat id d2^3 = d1+mu*L^2*(d2-q);
AB	sint1,cost1,sint2,cost2;
.sort
CFunction acc;
Collect acc;
FactArg acc;
ChainOut acc;
id	acc(x?symbol_) = x;
id	acc(1/x?symbol_) = 1/x;
id	acc(x?number_) = x;
Argument acc;
	id	sint2^2 = 1-cost2^2;
	id	sint1^2 = 1-cost1^2;
EndArgument;
id	acc(x?number_) = x;
Print +f +s;
.end
