Symbols ep,x,n,n1,...,n5,m1,...,m5;
CFunctions Z,Y,rat,RAT,num,den;
PolyRatFun rat;
Format nospaces;
.global
Local F = Z(2,1,2,1,2,0,2,0,2,0);
#call reduceT1(0)
Print +f +s;
.sort
PolyRatFun rat(expand,ep,10);
Print +f +s;
.end
