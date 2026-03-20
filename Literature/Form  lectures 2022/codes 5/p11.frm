#: MaxTermSize 1M
#: Workspace 100M
#define INCCOMPLEXITY "4"
Symbols D,ep,n1,n2,n3,n4,n5;
Dimension D;
Symbols x,x1,x2,x3,x4,x5;
Vector Q,p,p1,p2,p3,p4,p5;
CFunction der,del,Z,Y,inc,inc1,rat1,rat2,C;
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
.sort
id rat(?a) = C(?a);
.sort
id C(?a) = rat(?a);
.sort
#$numc2 = 0;
#do i = `INCCOMPLEXITY'+2,2,-1
#call gauss3(`i')
  #write "--------------After gauss3(`i',1): `time_' sec."
.sort
id rat(?a) = C(?a);
.sort
id C(?a) = rat(?a);
.sort
#enddo
#do i = 1,`$numeq'
#if ( `$exists`i' > 0 )
	#if ( termsin(G`i') > 0 )
		Print +s G`i';
	#endif
#endif
#enddo
.end

