#procedure contract11(Expr,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14)
#do j = 1,14
#if ( `i`j'' == 0 )
 id	scqmu^2  = q*mu;
 id	scqmu^-2 = 1/q/mu;
 .sort
#else
 sum `i`j'',1,...,10;
#endif
#enddo
id	scqmu^2  = q*mu;
id	scqmu^-2 = 1/q/mu;
.sort
#call simd1d2
id	d1 = d2^3-rho^2*L^2*mu;
id	rho^2 = d2-q;
Print +f +s;
.sort
Hide `Expr';
#endprocedure
