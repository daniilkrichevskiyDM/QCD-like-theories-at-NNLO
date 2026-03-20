#define N "20"
Symbol x,m1,m2;
CFunction den;
Local F = <den(x+1)>*...*<den(x+`N')>;
SplitArg,den;
id,once,den(m1?,x)*den(m2?,x) = (den(m1,x)-den(m2,x))/(m2-m1);
#do i = 1,1
 id,once,den(m1?,x)*den(m2?,x) = (den(m1,x)-den(m2,x))/(m2-m1);
 if ( count(den,1) > 1 );
   redefine i "0";
 endif;
 .sort
#enddo
.end

