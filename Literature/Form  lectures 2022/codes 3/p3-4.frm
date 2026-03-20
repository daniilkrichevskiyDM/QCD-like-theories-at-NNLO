#define N "24"
Symbol x,m1,m2;
CFunction den;
Local F = <den(x+1)>*...*<den(x+`N')>;
SplitArg,den;

#do i = 1,`N'
 id,once,den(m1?,x)*den(m2?,x) = (den(m1,x)-den(m2,x))/(m2-m1);
 .sort
#enddo
Print +f +s;
.end

