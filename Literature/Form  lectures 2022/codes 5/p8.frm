#define INCCOMPLEXITY "6"
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
CFunction acc, rat;
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
#case 5
if ( match(inc(?a,x?{5,4,-5,-4},?b)) ) Discard;
if ( match(inc(?a,3,?b,x?{1,2},?c)) ) Discard;
if ( match(inc(?a,-3,?b,x?{-1,-2},?c)) ) Discard;
if ( match(inc(?a,x?{1,2},?b,3,?c)) ) Discard;
if ( match(inc(?a,x?{-1,-2},?b,-3,?c)) ) Discard;
if ( match(inc(?a,2,?b,2,?c)) ) Discard;
if ( match(inc(?a,-2,?b,-2,?c)) ) Discard;
if ( match(inc(?a,2,?b)) && match(inc(?a,1,?b,1,?c)) ) Discard;
if ( match(inc(?a,-2,?b)) && match(inc(?a,-1,?b,-1,?c)) ) Discard;
if ( match(inc(?a,1,?b,1,?c,1,?d,1,?e)) ) Discard;
if ( match(inc(?a,-1,?b,-1,?c,-1,?d,-1,?e)) ) Discard;
#break
#case 6
if ( match(inc(?a,x?{6,5,4,-6,-5,-4},?b)) ) Discard;
if ( match(inc(?a,3,?b,x?{1,2,3},?c)) ) Discard;
if ( match(inc(?a,-3,?b,x?{-1,-2,-3},?c)) ) Discard;
if ( match(inc(?a,x?{1,2,3},?b,3,?c)) ) Discard;
if ( match(inc(?a,x?{-1,-2,-3},?b,-3,?c)) ) Discard;
if ( match(inc(?a,2,?b,2,?c)) ) Discard;
if ( match(inc(?a,-2,?b,-2,?c)) ) Discard;
if ( match(inc(?a,2,?b)) && match(inc(?a,1,?b,1,?c)) ) Discard;
if ( match(inc(?a,-2,?b)) && match(inc(?a,-1,?b,-1,?c)) ) Discard;
if ( match(inc(?a,1,?b,1,?c,1,?d,1,?e)) ) Discard;
if ( match(inc(?a,-1,?b,-1,?c,-1,?d,-1,?e)) ) Discard;
#break
#endswitch
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
id	Z(n1?,...,n5?)*inc(x1?,...,x5?) = Z(<n1+x1>,...,<n5+x5>);
#call ResetComplexity(`N',1)
Multiply replace_(D,4-2*ep);
Print +s;
.end

