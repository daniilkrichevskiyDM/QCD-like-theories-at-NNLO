#define INCCOMPLEXITY "4"
CF	inc,inc1;
Symbol x1,...,x5;
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
.sort
DropCoefficient;
Print +f +s;
.end
