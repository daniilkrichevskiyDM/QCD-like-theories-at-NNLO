#-

* Calculates the integral Euler Characteristic of Out(F_n) where n = chi + 1

#define chi "20"

#define m "{`chi'*2}"
#define n "{`chi'*6}"
*	Note that n is always even.

*--#[ Declarations :
CFunction mu;
*Symbol i,j,n,n1,n2,y,x,z(-`chi':`m'),w,g,l({-2*`m'}:`n');
Symbol i,j,n,n1,n2,y,x,z(:`m'),w,g,l(:`n');
Symbol x1,...,x`n';
Symbol c0,...,c`n';
AutoDeclare CFunction F;
Table num(x?);
Fill num = x;
* Moebius function:
* Def:
* mu(1) = 1
* \sum_{d divides n} \mu(d) = 0 if n > 1
*
* Code uses the identity:
* \sum_{k=1}^n \floor{n/k} \mu(k) = 1
Table mobius(1:`n');
Fill mobius(1) = 1;
#do j = 2,`n'
#$m = 1-sum_(j,1,`j'-1,integer_(`j'/j)*mobius(j));
Fill mobius(`j') = `$m';
#enddo
#procedure reduction(i,par)
#if ( termsin(L`i') > 0 )
  Multiply replace_(FF,F);
  #$pass = 0;
  #do ii = 1,1
	#$success = 0;
	#$pass = $pass+1;
	#if ( `par' == 0 )
	id,once,ifnomatch->nomatch,F(n?neg_,x?) = (L`i'[l^x]+FF(-1,x))^-n;
	repeat id FF(n1?,x?)*FF(n2?,x?) = FF(n1+n2,x);
	#else
	id,F(n?neg_,x?) = (L`i'[l^x])^-n;
	#endif
	label success;
	if ( count(F,1) ) $success = 1;
	label nomatch;
	ModuleOption maximum,$success;
	.sort: pass`i'-`$pass';
	#if ( `$success' == 1 )
		#redefine ii "0"
	#endif
  #enddo
  #if ( `i' != 0 )
  B	c`i';
  .sort:bracket-c`i';
  Keep Brackets;
  #if ( {`i'%2} != 0 )
    id	c`i'^n?odd_ = 0;
    id	c`i'^n?pos_ = num(fac_(n)*invfac_(n/2)/2^(n/2)*`i'^(n/2))/z^(`i'*n/2);
  #else
	id	c`i'^n? = num(fac_(n)*sum_(j,0,integer_(n/2),invfac_(n-2*j)*
					invfac_(j)/2^j*`i'^j))
					/z^({`i'/2}*n);
  #endif
  #endif
  .sort:remove-c`i';
#endif
#endprocedure
*--#] Declarations :
.global
L	LE = 1+sum_(j,2,`m',2,FF(j));
#do i = `m',2,-1
	id	FF(n?pos_) = sum_(j,`i',n,`i',FF(n-j)*F(j/`i',`i'))+FF(n);
#enddo
id	FF(n?) = F(n,1);
id	F(0,x?) = 1;
id	F(n?,x?) = F(-n,x)*invfac_(n);
.sort:three;
Hide;
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
        sum_(j,`k',`n',`k',(-1)^(j/`k'+1) * c`k'^(j/`k')/(j/`k'))
    #enddo
    )
    )
  #enddo
        ;
*
* Still some corner cutting:
*
#do j = `n',{`n'/2+1},-2
    id c{`j'} = l^`j' * z^{-`j'/2};
#enddo
#do j = `n'-1,{`n'/2+1},-2
    id c{`j'} = 0;
#enddo
#do j = 1,`n'
    id c`j' = l^`j' * c`j';
#enddo
*
* I don't really need to keep the g. It is has 'weight' -2:
*
id g = l^(-2);
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
#do i = `n',1,-1
L	L`i' = L0;
if ( expression(L`i') );
	if ( count(c`i',1) == 0 ) Discard;
else;
	id	c`i' = 0;
endif;
B+	l;
.sort:L`i';
Hide L`i';
#enddo
Hide L0;
.sort
On Statistics;
L	L = LE;
#call reduction(0,0)
#do ij = `n',2,-1
  #call reduction(`ij',0)
#enddo
#call reduction(1,1)
*
*	Now there is still the L0.
*
*id	F(n?,x?) = L0[l^x]^-n;

Print +f;
Bracket z;
.sort:six;

L Log = sum_(j,1,`chi', (-1)**(j+1) * y^j/j );

#do j = 1,`chi'
    id once y = L-1;

    .sort
#enddo

B z;
.sort
Hide Log;

L C = sum_(j,1,`chi', sum_(l,1,integer_(`chi'/j),z^(-l*j) * mobius(l)/l * Log[z^(-j)]));
id	z^n? = 1/z^n;
Print +f +s;
.sort:six;
.end
