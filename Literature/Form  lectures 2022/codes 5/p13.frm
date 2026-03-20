#-
#: LargeSize 5G
#: SmallSize 500M
#: ScratchSize 2G
#: MaxTermSize 50M
#: WorkSpace 3000M
#: SubTermsInSmall 1M
#: SubSmallSize 500M
#: SubSmallExtension 1000M
#: SubLargeSize 1000M
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
#opendictionary LHS
	#do j = 1,5
		#add m`j': "m`j'?"
		#add n`j'p0: "n`j'?"
		#add n`j'm0: "n`j'?"
		#add n`j'p1: "n`j'?{>1}"
		#add n`j'm1: "n`j'?neg0_"
		#add n`j'p2: "n`j'?{>2}"
		#add n`j'm2: "n`j'?neg_"
	#enddo
#closedictionary
#write <reduceT1.prc> "#procedure reduceT1"
#write <reduceT1.prc> "*\n*  Procedure automatically created `date_'\n*"
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
#define TODO "1,`$numeq'"
#$numc2 = 0;
#do i = `INCCOMPLEXITY'+2,1,-1
#call gauss4(G,`i')
  #write "--------------After gauss4(`i',1): `time_' sec."
.sort
#enddo
#do i = 1,`$numeq'
#if ( `$exists`i'' > 0 )
	#if ( termsin(G`i') > 0 )
		Print +s G`i';
	#endif
#endif
#enddo
*
*	And now the tail of the reduceT1.prc procedure
*
Format 120;
#write <reduceT1.prc> "goto looplabel2;"
#write <reduceT1.prc> "label looplabel;"
#write <reduceT1.prc> "id  num(x?)*den(x?) = 1;"
#write <reduceT1.prc> "id  num(x?) = rat(x,1);"
#write <reduceT1.prc> "id  den(x?) = rat(1,x);"
#write <reduceT1.prc> "*id num(x?number_) = x;"
#write <reduceT1.prc> "*id den(x?number_) = 1/x;"
#write <reduceT1.prc> "$loopaction = 1;"
#write <reduceT1.prc> "label looplabel2;"
#write <reduceT1.prc> "ModuleOption Maximum,$loopaction;"
#write <reduceT1.prc> ".sort:reduceT1-loop \`$numloop\';"
#write <reduceT1.prc> "#if ( \`$loopaction\' == 1 )"
#write <reduceT1.prc> "    #redefine inumloop \"0\""
#write <reduceT1.prc> "#endif"
#write <reduceT1.prc> "#enddo"
#write <reduceT1.prc> "#if ( \`whichbasis\' == 1 ) "
#write <reduceT1.prc> "id  Z(0,m1?,1,m2?,1,m3?,1,m4?,1,m5?) ="
#write <reduceT1.prc> "    +Z(1,m1,1,m2,1,m3,0,m4,1,m5)*num(m3-m1)*den(1+m5+m4+m3)"
#write <reduceT1.prc> "    +Z(1,m1,1,m2,0,m3,1,m4,1,m5)*num(1+m5+m3+m2)*num(-1+2*ep+"
#write <reduceT1.prc> "    ep*m5+ep*m3+ep*m2)*den(1+m5+m4+m3)*den(-1+2*ep+ep*m5+ep*m4+ep*m1)"
#write <reduceT1.prc> "    -Z(1,m1,1,m2,1,m3,1,m4,1,m5)*num(ep)*num(m3-m1)*den(-1+2"
#write <reduceT1.prc> "    *ep+ep*m5+ep*m4+ep*m1);"
#write <reduceT1.prc> "id  num(x?)*den(x?) = 1;"
#write <reduceT1.prc> "id  num(x?) = rat(x,1);"
#write <reduceT1.prc> "id  den(x?) = rat(1,x);"
#write <reduceT1.prc> "id  Z(1,m1?,1,m1?,1,m1?,0,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> "id  Z(1,m1?,1,m1?,0,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> "id  Z(1,m1?,0,m1?,1,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> ".sort:reduceT1-basis-1;"
#write <reduceT1.prc> "#elseif ( \`whichbasis\' == 2 ) "
#write <reduceT1.prc> "id  Z(0,m1?,1,m2?,1,m3?,1,m4?,1,m5?) = den(1+m5+m4+m3)*"
#write <reduceT1.prc> "        den(-1+3*ep+2*ep*m5+ep*m4+ep*m3+ep*m2+ep*m1)*("
#write <reduceT1.prc> "    +Z(1,m1,1,m2,1,m3,1,m4,0,m5)*num(1+m5+m3+m2)*"
#write <reduceT1.prc> "        num(-1+2*ep+ep*m5+ep*m3+ep*m2)"
#write <reduceT1.prc> "    -Z(1,m1,1,m2,1,m3,0,m4,1,m5)*num(1+m5+m2+m1)*"
#write <reduceT1.prc> "        num(-1+3*ep+2*ep*m5+ep*m4+ep*m3+ep*m2+ep*m1)"
#write <reduceT1.prc> "    +Z(1,m1,1,m2,1,m3,1,m4,1,m5)*num(1+m5+m2+m1)*"
#write <reduceT1.prc> "        num(1+m5+m4+m3)*num(ep) );"
#write <reduceT1.prc> "id  num(x?)*den(x?) = 1;"
#write <reduceT1.prc> "id  num(x?) = rat(x,1);"
#write <reduceT1.prc> "id  den(x?) = rat(1,x);"
#write <reduceT1.prc> "id  Z(1,m1?,1,m1?,1,m1?,0,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> "id  Z(1,m1?,1,m1?,0,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> "id  Z(1,m1?,0,m1?,1,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> ".sort:reduceT1-basis-2;"
#write <reduceT1.prc> "#endif"
#write <reduceT1.prc> "id  Z(1,m1?,1,m1?,1,m1?,0,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> "id  Z(1,m1?,1,m1?,0,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> "id  Z(1,m1?,0,m1?,1,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <reduceT1.prc> "id	Z(n1?,m1?,n2?,m2?,n3?,m3?,n4?,m4?,n5?neg0_,0) = Y(n1,m1,n2,m2,n3,m3,n4,m4,n5,0);"
#write <reduceT1.prc> "id	Z(n1?,m1?,n2?,m2?,n3?,m3?,n4?neg0_,0,n5?,m5?) = Y(n1,m1,n2,m2,n3,m3,n4,0,n5,m5);"
#write <reduceT1.prc> "id	Z(n1?,m1?,n2?,m2?,n3?neg0_,0,n4?,m4?,n5?,m5?) = Y(n1,m1,n2,m2,n3,0,n4,m4,n5,m5);"
#write <reduceT1.prc> "id	Z(n1?,m1?,n2?neg0_,0,n3?,m3?,n4?,m4?,n5?,m5?) = Y(n1,m1,n2,0,n3,m3,n4,m4,n5,m5);"
#write <reduceT1.prc> "id	Z(n1?neg0_,0,n2?,m2?,n3?,m3?,n4?,m4?,n5?,m5?) = Y(n1,0,n2,m2,n3,m3,n4,m4,n5,m5);"
#write <reduceT1.prc> ".sort:reduceT1-basis-3;"
#write <reduceT1.prc> "*"
#write <reduceT1.prc> "#endprocedure"

.end

