#procedure simd1d2
*
id	scqmu^2  = q*mu;
id	scqmu^-2 = 1/q/mu;
id	d1 = d2^3-rho^2*L^2*mu;
id	d2 = q+rho^2;
.sort: simd1d2-1;
#call simsincos
AntiBracket d1,d2,L,mu,q,rho,sint1,sint2,cost1,cost2;
.sort: simd1d2-2;
Collect acc;
#do d = {d1,d2,rho,L,sint1,cost1,sint2,cost2}
  $`d' = 0;
#enddo
Argument acc;
  #do d = {d1,d2,rho,L,sint1,cost1,sint2,cost2}
	if ( count(`d',-1) > $`d' ) $`d' = count_(`d',-1);
  #enddo
EndArgument;
Multiply 1
  #do d = {d1,d2,rho,L,sint1,cost1,sint2,cost2}
	*`d'^$`d'/d`d'^$`d'
  #enddo
    ;
id	acc(x?) = x;
id	q = d2-rho^2;
id	d2^3 = d1+rho^2*L^2*mu;
.sort: simd1d2-3;
#call simsincos
AntiBracket d1,d2,L,mu,q,rho;
.sort: simd1d2-4;
Collect acc;
FactArg acc;
ChainOut acc;
id	acc(x?number_) = x;
id	acc(x?symbol_) = x;
Argument acc;
	id q = d2-rho^2;
	repeat id d2^3 = d1+rho^2*L^2*mu;
EndArgument;
FactArg acc;
ChainOut acc;
id	acc(x?symbol_) = x;
id	acc(x?number_) = x;
Argument acc;
	id	d2*L^2*mu = rho^2*L^2*mu+q*L^2*mu;
	id	rho^2*L^2*mu = d2^3 - d1;
	if ( count(L,1,mu,1) == 0 ) id rho^2 = d2-q;
EndArgument;
FactArg acc;
ChainOut acc;
id	acc(x?symbol_) = x;
id	acc(x?number_) = x;
*id	acc(x?) = x;
#call simsincos
#do d = {d1,d2,rho,L,sint1,cost1,sint2,cost2}
	id d`d'^x? = `d'^x;
#enddo
#endprocedure

	if ( count(d1,-1) > $d1 ) $d1 = count_(d1,-1);
	if ( count(d2,-1) > $d2 ) $d2 = count_(d2,-1);
	if ( count(rho,-1) > $rho ) $rho = count_(rho,-1);
	if ( count(L,-1) > $L ) $L = count_(L,-1);
	if ( count(sint1,-1) > $sint1 ) $sint1 = count_(sint1,-1);
	if ( count(cost1,-1) > $cost1 ) $cost1 = count_(cost1,-1);
	if ( count(sint2,-1) > $sint2 ) $sint2 = count_(sint2,-1);
	if ( count(cost2,-1) > $cost2 ) $cost2 = count_(cost2,-1);

Multiply d1^$d1/dd1^$d1*d2^$d2/dd2^$d2*rho^$rho/rrho^$rho*L^$L/LL^$L;
Multiply sint1^$sint1/ssint1^$sint1*cost1^$cost1/ccost1^$cost1*
         sint2^$sint2/ssint2^$sint2*cost2^$cost2/ccost2^$cost2;

id	dd1^x? = d1^x;
id	dd2^x? = d2^x;
id	rrho^x? = rho^x;
id	LL^x? = L^x;
id	ssint1^x? = sint1^x;
id	ccost1^x? = cost1^x;
id	ssint2^x? = sint2^x;
id	ccost2^x? = cost2^x;

