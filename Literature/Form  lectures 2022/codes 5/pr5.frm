#: MaxTermSize 1M
#: MaxTermSize 1M
#: SubTermsInSmall 1M
#: SubSmallSize 100M
#: SubLargeSize 1000M
#define INCCOMPLEXITY "2"
Symbols D,ep,n1,n2,n3,n4,n5;
Dimension D;
Symbols x,x1,x2,x3,x4,x5;
Vector Q,p,p1,p2,p3,p4,p5;
CFunction der,del,Z,Y,inc,inc1;
Off Statistics;
Format nospaces;
.global
#define N "5"
#call IBPforT1
.sort
Local A1 = A1-A2;
Local A3 = A3-A2;
Local A4 = A4-A6;
Local A5 = A5-A6;
Bracket Z;
.sort
CFunction acc, rat,RAT,num,den;
PolyRatFun rat;
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
Multiply inc;
repeat id inc(?a)*inc1(x1?,?b) = (inc(?a,x1)+inc(?a,-x1))*inc1(?b);
id	inc1 = 1;
*if ( match(inc(?a,x?{2,-2},?b)) ) Discard;
*if ( match(inc(?a,1,?b,1,?c)) ) Discard;
*if ( match(inc(?a,-1,?b,-1,?c)) ) Discard;
.sort
DropCoefficient;
.sort
Hide;
#$numeq = 0;
#do oneterm = FC
Global G{`$numeq'+1} = A1*`oneterm';
Global G{`$numeq'+2} = A2*`oneterm';
Global G{`$numeq'+3} = A3*`oneterm';
Global G{`$numeq'+4} = A4*`oneterm';
Global G{`$numeq'+5} = A5*`oneterm';
Global G{`$numeq'+6} = A6*`oneterm';
#$numeq = $numeq+6;
#enddo
id	inc(x1?,...,x5?) = replace_(<n1,n1+x1>,...,<n5,n5+x5>);
#call ResetComplexity(`N',1)
Multiply replace_(D,4-2*ep);
.sort
#do c = `INCCOMPLEXITY'+2,1,-1
#call gauss1(`$numeq',`c')
#enddo
#do i = 1,`$numeq'
#if ( termsin(G`i') > 0 )
	Print +s G`i';
#endif
#enddo
.end

