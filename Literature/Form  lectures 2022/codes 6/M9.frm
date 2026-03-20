#-
#: WorkSpace 1G
#: LargeSize 2G
#: SmallSize 200M
#: TermsInSmall 20M
#: ScratchSize 2G
*
* Calculates the integral Euler Characteristic of Out(F_n) where n = chi + 1

#define chi "20"

#define m "{`chi'*2}"
#define n "{`chi'*6}"
*	Note that n is always even.
*--#[ Declarations :
CFunction mu;
*       Symbol i,j,n,n1,n2,y,x,z(-`chi':`m'),w,g,l({-2*`m'}:`n');
Symbol i,j,m,n,n1,n2,y,x,zsq(-{2*`m'}:`m'),z(:`m'),w,g,l(:`n');
Symbol x1,...,x`n';
Symbol c0,...,c`n';
AutoDeclare CFunction F;
*PolyFun Fz;
Table num(x?);
Fill num = x;
* Moebius function:
* Def:  mu(1) = 1   \sum_{d divides n} \mu(d) = 0 if n > 1
* Code uses the identity:
*       \sum_{k=1}^n \floor{n/k} \mu(k) = 1
Table mobius(1:`n');
Fill mobius(1) = 1;
#do j = 2,`n'
  #$m = 1-sum_(j,1,`j'-1,integer_(`j'/j)*mobius(j));
  Fill mobius(`j') = `$m';
#enddo
*--#[ reduction :
#procedure reduction(i,par)
 #if ( termsin(L`i') > 0 )
  #if ( `par' == 0 )
	#$uplim = $Fcount;
  #else
	#$uplim = 1;
  #endif
  Multiply replace_(FF,F);
  #do ii = 1,`$uplim'
	#if ( `par' == 0 )
	id,once,ifnomatch->nomatch,F(n?neg_,x?) = (Ltab`i'(x)+FF(-1,x))^-n;
	repeat id FF(n1?,x?)*FF(n2?,x?) = FF(n1+n2,x);
	#else
	id,F(n?neg_,x?) = (Ltab`i'(x))^-n;
	#endif
	label nomatch;
	#if ( ( `ii' == `$uplim' ) && ( `i' != 0 ) )
		B	c`i';
	#endif
	.sort: pass`i'-`ii';
  #enddo
  #if ( `i' != 0 )
   Keep Brackets;
   #if ( {`i'%2} != 0 )
    id	c`i'^n?odd_ = 0;
    id	c`i'^n?pos_ = 
		num(fac_(n)*invfac_(n/2)/2^(n/2)*`i'^(n/2));
   #else
	id	c`i'^n? = num(fac_(n)*sum_(j,0,integer_(n/2),invfac_(n-2*j)*
					invfac_(j)*{`i'/2}^j));
   #endif
  #endif
  .sort:remove-c`i';
 #endif
#endprocedure
*--#] reduction : 
*--#[ rangereduction :
#procedure rangereduction(imin,imax)
*
*	Similar to the reduction procedure, but now it eliminates a range
*	of c`imin' to c`imax' parameters in one go.
*	This is useful in the beginning of the reductions when the overhead
*	of the sorting is enormous compared to the amount of action needed for
*	the elimination of a single variable.
*
  Multiply replace_(FF,F);
  #$pass = 0;
  #do ii = 1,`$Fcount'
	#$pass = $pass+1;
	id,once,ifnomatch->nomatch,F(n?neg_,x?) = (<Ltab`imin'(x)>+...+<Ltab`imax'(x)>+FF(-1,x))^-n;
	repeat id FF(n1?,x?)*FF(n2?,x?) = FF(n1+n2,x);
	label nomatch;
	#if ( `ii' == `$Fcount' )
	   B	<c`imin'>,...,<c`imax'>;
	#endif
	.sort: pass`imin'/`imax'-`ii';
  #enddo
   Keep Brackets;
   #do i = `imin',`imax'
   #if ( {`i'%2} != 0 )
    id	c`i'^n?odd_ = 0;
    id	c`i'^n?pos_ = num(fac_(n)*invfac_(n/2)/2^(n/2)*`i'^(n/2));
   #else
	id	c`i'^n? = num(fac_(n)*sum_(j,0,integer_(n/2),invfac_(n-2*j)*
					invfac_(j)/2^j*`i'^j));
   #endif
   #enddo
  .sort:remove-c`imin'-c`imax';
#endprocedure
*--#] rangereduction : 
*--#] Declarations :
.global
Off Statistics;
Local LL =
  #do j = 1,`m'
    + g^`j' * z^`j' / `j' * ( 
    	c`j' + c`j'^2/2 
    	#if {2*`j'} <= `n'
        	- c{2*`j'} / 2
	    #endif
    	- (1+c`j') * (
	      #do k = `j',`n',`j'
    	    + mobius({`k'/`j'})/{`k'/`j'} *
        	  sum_(j,`k',`n',`k',-sign_(j/`k') * c`k'^(j/`k')/(j/`k'))
	      #enddo
    	)
    )
  #enddo
        ;
id	z = 1/zsq^2;
*
* Still some corner cutting:
*
#do j = `n',{`n'/2+1},-2
    id c{`j'} = l^`j'*zsq^`j';
#enddo
#do j = `n'-1,{`n'/2+1},-2
    id c{`j'} = 0;
#enddo
#do j = 1,`n'
    id c`j' = l^`j' * c`j'*zsq^`j';
#enddo
*
* I don't really need to keep the g. It is has 'weight' -2:
*
id g = l^(-2);
*id	zsq^n? = Fz(zsq^n);
B	zsq,l;
.sort
Hide LL;
.sort
*----------------------------------------------------------------------
*
*	Now we have to set up a loop in which we work our way down from the
*	high c`i' to the c1.
*	This should be done slowly to avoid building up too many terms.
*	Each time we try to eliminate the respective c`i' as quickly as possible.
*
Off Statistics;
L	L0 = LL;
.sort
#do i = `n'/2,1,-1
L	L`i' = L0;
if ( expression(L`i') );
	if ( count(c`i',1) == 0 ) Discard;
else;
	id	c`i' = 0;
endif;
*Print +f L`i';
B+	l;
.sort:L`i';
Table,zerofill,Ltab`i'(0:`n');
FillExpression Ltab`i' = L`i'(l);
Hide L`i';
#enddo
B	l;
.sort
Table,zerofill,Ltab0(0:`n');
FillExpression Ltab0 = L0(l);
Hide L0;
.sort
*------------------------------------------------------------
*
*	Here we take the exponent of the L`i' (or Ltab`i').
*	It can become a bit slow, but not as bad as the next step.
*
On Statistics;
#do i = 0,`n'/2
L	G`i' = sum_(j,0,`m',x^j*invfac_(j));
#do ii = `m',1,-1
    id,once,x^`ii'*l^n? = x^`ii'/x*l^n*sum_(j,1,`m'-n,Ltab`i'(j)*l^j);
.sort:exponent-`i'-`ii';
#enddo
id	l^n? = 1;
B+	zsq;
*Print +f G`i';
.sort
Table,zerofill,Gtab`i'(0:{2*`chi'});
FillExpression Gtab`i' = G`i'(zsq);
Hide G`i';
.sort
#enddo
*------------------------------------------------------------
*
*	The next step is the most expensive step. Specially for i=6.
*	Basically we are just multiplying two polynomials.
*	It is just that the coefficients can have lots of terms for the lower i.
*
L	L = G0;
#do i = `n'/2,1,-1
id	zsq^n? = zsq^n*sum_(j,0,2*`chi'-n,zsq^j*Gtab`i'(j));
*Print +f;
B	c`i';
.sort
*------------------------------------------------------------
*
*	The bracket in c`i' and the keep brackets make that we have
*	to evaluate each c`i'^n only once. Hence this step is rather fast.
*
   Keep Brackets;
   #if ( {`i'%2} != 0 )
    id	c`i'^n?odd_ = 0;
    id	c`i'^n?pos_ = 
		num(fac_(n)*invfac_(n/2)/2^(n/2)*`i'^(n/2));
   #else
	id	c`i'^n? = num(sum_(j,0,integer_(n/2),fac_(n)*invfac_(n-2*j)*
					invfac_(j)*{`i'/2}^j));
   #endif
B	z;
*Print +f;
.sort:remove-c`i';
#enddo
id	zsq^2 = z;
Print +f;
Bracket z;
.sort:z-expansion;
Off Statistics;
L Log = sum_(j,1,`chi', -sign_(j) * y^j/j );
#do j = 1,`chi'
    id once y = L-1;
    .sort
#enddo
B z;
.sort
On Statistics;
Hide Log;
*L C = sum_(j,1,`chi', sum_(l,1,integer_(`chi'/j),z^(-l*j) * mobius(l)/l * Log[z^(-j)]));
L C = sum_(j,1,`chi', sum_(l,1,integer_(`chi'/j),z^(l*j) * mobius(l)/l * Log[z^j]));
Print +f +s;
.end:result;

