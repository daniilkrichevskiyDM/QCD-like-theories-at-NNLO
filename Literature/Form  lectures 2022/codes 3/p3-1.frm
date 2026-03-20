#define N "10"
Symbol x,m1,m2;
CFunction den;
Local F = <den(x+1)>*...*<den(x+`N')>;
Print "<1> %t";
SplitArg,den;
Print "<2> %t";
repeat id den(m1?,x)*den(m2?,x) = (den(m1,x)-den(m2,x))/(m2-m1);
Print +s;
.end
