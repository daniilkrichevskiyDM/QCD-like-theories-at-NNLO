#-
#: WorkSpace 1G
#: LargeSize 2G
#: SmallSize 200M
#: TermsInSmall 20M
#: ScratchSize 2G

* Calculates the integral Euler Characteristic of Out(F_n) where n = chi + 1

#define chi "10"

#define m "{`chi'*2}"
#define n "{`chi'*6}"

*	Note that n is always even.

CFunction mu;
*Symbol i,j,n,n1,n2,y,x,z(-`chi':`m'),w,g,l({-2*`m'}:`n');
Symbol i,j,n,n1,n2,y,x,z(-`chi':`m'),w,g,l(:`n');
Symbol x1,...,x`n';
Symbol c1,...,c`n';
AutoDeclare CFunction F;
.global
* Moebius function:
* Def:
* mu(1) = 1
* \sum_{d divides n} \mu(d) = 0 if n > 1
*
* Code uses the identity:
* \sum_{k=1}^n \floor{n/k} \mu(k) = 1
Off Statistics;
Local M = sum_(j,1,`n',mu(j)*x^j);
Bracket x;
.sort
#do j = 1,`n'
    id mu(`j') = 1-sum_(j,1,`j'-1,integer_(`j'/j)*M[x^j]);

    Bracket x;
    .sort
#enddo
Hide;
L	LE = sum_(j,0,`n',x^j*invfac_(j));
#do i = `n',1,-1
    id,once,x^`i'*l^n? = x^`i'/x*l^n*sum_(j,1,`m'-n,F(-1,j)*l^j);
.sort:three-`i';
#enddo
On Statistics;
repeat id F(n1?,x?)*F(n2?,x?) = F(n1+n2,x);
id	l^n?odd_ = 0;
id	l = 1;
*B	l;
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
        + M[x^{`k'/`j'}]/{`k'/`j'} *
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
*	This should be done slowly to avoid building up to many terms.
*	Each time we try to eliminate the respective c`i' as quickly as possible.
*
On Statistics;
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
L	L = LE;
*
*	Now the real stuff starts
*
#do i = `n',1,-1
#if ( termsin(L`i') > 0 )
  #$pass = 0;
  #do ii = 1,1
	#$success = 0;
	#$pass = $pass+1;
	id,once,ifnomatch->nomatch,F(n?neg_,x?) = (L`i'[l^x]+FF(-1,x))^-n;
	repeat id FF(n1?,x?)*FF(n2?,x?) = FF(n1+n2,x);
	label success;
	if ( count(F,1) ) $success = 1;
	label nomatch;
	ModuleOption maximum,$success;
	.sort: pass`i'-`$pass';
	#if ( `$success' == 1 )
		#redefine ii "0"
	#endif
  #enddo
  Multiply replace_(FF,F);
  #if ( {`i'%2} != 0 )
    id c`i' = x`i';
  #else
    id c`i' = x`i' + z^{-`i'/2};
  #endif
  id	x`i'^n?odd_ = 0;
  id	x`i'^n?pos_ = fac_(n)*invfac_(n/2)/2^(n/2)*`i'^(n/2)/z^(`i'*n/2);
  .sort:five-`i';
#endif
#enddo
*
*	Now there is still the L0.
*
id	F(n?,x?) = L0[l^x]^-n;

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

L C = sum_(j,1,`chi', sum_(l,1,integer_(`chi'/j),z^(-l*j) * M[x^l]/l * Log[z^(-j)]));
id	z^n? = 1/z^n;
Print +f +s;
.sort:six;
.end
