#define N "20"
Symbol x,m1,m2;
CFunction den;
Off Statistics;
Local F = <den(x+1)^1>*...*<den(x+`N')^`N'>;
SplitArg,den;
id,once,den(m1?!{m2?},x)*den(m2?!{m1?},x) =
         (den(m1,x)-den(m2,x))/(m2-m1);
#do i = 1,1
 id,ifmatch->1,once,den(m1?!{m2?},x)*den(m2?!{m1?},x) =
         (den(m1,x)-den(m2,x))/(m2-m1);
 goto 2;
 label 1;
 redefine i "0";
 label 2;
 .sort
#enddo
On Statistics;
.end

