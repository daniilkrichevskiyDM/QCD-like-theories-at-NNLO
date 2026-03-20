#define N "20"
Symbol x,m1,m2;
CFunction den;
Off Statistics;
Local F = <den(x+1)^1>*...*<den(x+`N')^`N'>;
SplitArg,den;
id,once,den(m1?!{m2?},x)*den(m2?!{m1?},x) =
         (den(m1,x)-den(m2,x))/(m2-m1);
#do i = 1,1
 id,once,den(m1?!{m2?},x)*den(m2?!{m1?},x) =
         (den(m1,x)-den(m2,x))/(m2-m1);
 if ( match(den(m1?!{m2?},x)*den(m2?!{m1?},x)) );
   redefine i "0";
 endif;
 .sort
#enddo
On Statistics;
.end

