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
Print +f;
Bracket tg;
.end
