Off statistics;
#include symbols.hf
symbol P2, n, m1, m2, m3, m4,n;
function ABar, LOmass, L, log, LOmass,Ab, Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd,H22d;
cfunction func;

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

L aux1 =2*H21(mp2,mp2,mp2,P2)*P2^2*F^-4 ;
print aux1;


#procedure derivative(expr,var)
.sort
skip;
nskip `expr';
multiply aa;

#define letterd "d"
* derivative of powers
*id `var'^n? = n*`var'^(n-1);
*id aa*func?{H,H21,H22}(m1?,m2?,m3?,`var') = func`letterd'(m1,m2,m3,`var') + func(m1,m2,m3,`var')*aa;
id aa*H(m1?,m2?,m3?,`var') = Hd(m1,m2,m3,`var') + H(m1,m2,m3,`var')*aa;
id aa*H21(m1?,m2?,m3?,`var') = H21d(m1,m2,m3,`var') + H21(m1,m2,m3,`var')*aa;
id aa*H22(m1?,m2?,m3?,`var') = H22d(m1,m2,m3,`var') + H22(m1,m2,m3,`var')*aa;
id aa*`var'^n? = n*`var'^(n-1) + `var'^n*aa;
.sort
id aa = 0; 
#endprocedure


#call derivative(aux1,P2)
.sort

print aux1;
.end