Symbol n,x1,x2;
CFunction f,fib;
Local F = f(10,1,1);
repeat;
	id	f(0,?a) = fib(?a);
	id	f(n?,?a,x1?,x2?) = f(n-1,?a,x1,x2,x1+x2);
endrepeat;
Print;
.end
