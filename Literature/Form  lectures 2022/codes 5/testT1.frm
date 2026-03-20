Symbols ep,x,n,n1,...,n5,m1,...,m5;
CFunctions Z,Y,rat,RAT,num,den;
PolyRatFun rat;
Format nospaces;
.global
Local F = Z(2,1,2,2,2,3,2,4,2,5);
#call reduceT1
id	num(x?) = rat(x,1);
id	den(x?) = rat(1,x);
Print +f +s;
.sort
PolyRatFun rat(expand,ep,10);
Print +f +s;
.end
