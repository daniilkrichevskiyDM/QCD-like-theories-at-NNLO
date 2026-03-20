#procedure derivative
*
*	Procedure takes the derivative for our metric.
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
*id	der(x1?,1/d1^2) = -2*der(x1,d1)/d1^3;
id	der(x1?,1/d2) = -der(x1,d2)/d2^2;
*id	der(x1?,1/d2^2) = -2*der(x1,d2)/d2^3;
*id	der(x1?,1/d2^3) = -3*der(x1,d2)/d2^4;
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

