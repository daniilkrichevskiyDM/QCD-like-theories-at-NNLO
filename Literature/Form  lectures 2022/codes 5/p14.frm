#-
#: LargeSize 3G
#: SmallSize 500M
#: ScratchSize 2G
#: MaxTermSize 60M
#: WorkSpace 3000M
#: SubTermsInSmall 1M
#: SubSmallSize 400M
#: MaxNumberSize 50K
*#: SubSmallExtension 1000M
#: SubLargeSize 800M
#define INCCOMPLEXITY "3"
Symbols D,ep,n1,n2,n3,n4,n5,m1,m2,m3,m4,m5;
Dimension D;
Symbols x,x1,x2,x3,x4,x5;
Vector Q,p,p1,p2,p3,p4,p5;
CFunction der,del,Z,Y,inc,inc1,rat1,rat2,C;
#do j = 1,5;
#do k = 0,5
Symbols n`j'p`k',n`j'm`k';
#enddo
#enddo
Off Statistics;
Format nospaces;
Format 80;
.global
#define N "5"
#call IBPforT1
.sort
Local A1 = A1-A2;
Local A3 = A3-A2;
Local A4 = A4-A6;
Local A5 = A5-A6;
.sort
Local A6 = A2+A6;
Local A4 = A1+A4;
Bracket Z;
.sort
CFunction acc, rat,RAT,num,den;
PolyRatFun rat,RAT;
Collect acc;
id	acc(x?) = rat(x,1);
.sort
Hide;
Local FC =
#do i1 = 0,`INCCOMPLEXITY'
#do i2 = 0,`INCCOMPLEXITY'-`i1'
#do i3 = 0,`INCCOMPLEXITY'-`i1'-`i2'
#do i4 = 0,`INCCOMPLEXITY'-`i1'-`i2'-`i3'
#do i5 = 0,`INCCOMPLEXITY'-`i1'-`i2'-`i3'-`i4'
	+inc1(`i1',`i2',`i3',`i4',`i5')
#enddo
#enddo
#enddo
#enddo
#enddo
	;
if ( match(inc1(?a,x?{>{(`INCCOMPLEXITY'+1)/2}},?b)) ) Discard;
Multiply inc;
repeat id inc(?a)*inc1(x1?,?b) = (inc(?a,x1)+inc(?a,-x1))*inc1(?b);
id	inc1 = 1;
#switch `INCCOMPLEXITY'
#case 1
#break
#case 2
if ( match(inc(?a,x?{2,-2},?b)) ) Discard;
if ( match(inc(?a,1,?b,1,?c)) ) Discard;
if ( match(inc(?a,-1,?b,-1,?c)) ) Discard;
#break
#case 3
if ( match(inc(?a,x?{3,-3},?b)) ) Discard;
if ( match(inc(?a,2,?b,1,?c)) ) Discard;
if ( match(inc(?a,1,?b,2,?c)) ) Discard;
if ( match(inc(?a,1,?b,1,?c,1,?d)) ) Discard;
if ( match(inc(?a,-2,?b,-1,?c)) ) Discard;
if ( match(inc(?a,-1,?b,-2,?c)) ) Discard;
if ( match(inc(?a,-1,?b,-1,?c,-1,?d)) ) Discard;
#break
#case 4
if ( match(inc(?a,x?{4,3,-4,-3},?b)) ) Discard;
if ( match(inc(?a,2,?b,x?{1,2},?c)) ) Discard;
if ( match(inc(?a,1,?b,2,?c)) ) Discard;
if ( match(inc(?a,1,?b,1,?c,1,?d)) ) Discard;
if ( match(inc(?a,-2,?b,x?{-1,-2},?c)) ) Discard;
if ( match(inc(?a,-1,?b,-2,?c)) ) Discard;
if ( match(inc(?a,-1,?b,-1,?c,-1,?d)) ) Discard;
#break
#endswitch
.sort
DropCoefficient;
id	rat(?a) = 1;
.sort
Hide;
#$numeq = 0;
#do oneterm = FC
#do i = 1,6
#$numeq = $numeq+1;
#$exists`$numeq' = 1;
Global G`$numeq' = A`i'*`oneterm';
#enddo
#enddo
id	inc(x1?,...,x5?) = replace_(<n1,n1+x1>,...,<n5,n5+x5>);
#call ResetComplexity(`N',1)
Multiply replace_(D,4-2*ep);
*
*	Now we define the basis (with the benefit of hindsight)
*	All integrals can be expressed into these three.
*
id	Z(0,n1,n2,n3,n4,n5) = Y(n1,n2,n3,n4,n5);
id	Z(-1,n1-1,n2,n3,n4,n5) = Y(n1-1,n2,n3,n4,n5);
id	Z(-1,n1,n2,n3,n4-1,n5) = Y(n1,n2,n3,n4-1,n5);
.sort
#$numout = 0;
#define TODO "1,`$numeq'"
#$numc2 = 0;
#do i = `INCCOMPLEXITY'+2,1,-1
#call gauss5(G,`i')
  #write "--------------After gauss5(`i',1): `time_' sec."
.sort
#enddo
PolyRatFun,rat,RAT;
.sort
PolyRatFun;
id	rat(x1?,x2?) = num(x1)*den(x2);
FactArg,num;
FactArg,den;
ChainOut,num;
ChainOut,den;
id	num(x?number_) = x;
id	den(x?number_) = 1/x;
Print +f +s H1,...,H`$numout';
.sort
#call CreatePRC(reduceT1,H,`$numout')
.end

