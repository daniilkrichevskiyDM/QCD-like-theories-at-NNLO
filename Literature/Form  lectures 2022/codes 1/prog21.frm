Symbol a1,a2,a3,a4,a5,a6;
CFunction f,g;
Local F = f(a1,a2,a3,a4)*f(a1,a3,a2,a1,a4,a5,a6);
id	f(?a,a3,?b) = g(?b,a3,?a);
Print +s;
.end
