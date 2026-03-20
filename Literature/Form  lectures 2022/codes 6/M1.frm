#-
#: WorkSpace 1G

* Calculates the integral Euler Characteristic of Out(F_n) where n = chi + 1

#define chi "10"

#define m "{`chi'*2}"
#define n "{`chi'*6}"

CFunction mu;
Symbol i,j,n,y,x,z(-`chi':`m'),w,g,l({-2*`m'}:`n');

CF F;

* Moebius function:
* Def:
* mu(1) = 1
* \sum_{d divides n} \mu(d) = 0 if n > 1
*
* Code uses the identity:
* \sum_{k=1}^n \floor{n/k} \mu(k) = 1

Local M = sum_(j,1,`n',mu(j)*x^j);

#do j = 1,`n'
    id mu(`j') = 1-sum_(j,1,`j'-1,integer_(`j'/j)*M[x^j]);

    Bracket x;
    .sort
#enddo
Bracket x;
.sort
Hide M;
.sort

Symbol x1,...,x`n';
Symbol c1,...,c`n';

Local L1 =
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

* Still some corner cutting:
#do j = `n',{`n'/2+1},-2
    id c{`j'} = l^`j' * z^{-`j'/2};
#enddo
#do j = `n'-1,{`n'/2+1},-2
    id c{`j'} = 0;
#enddo

#do j = 1,`n'
    id c`j' = l^`j' * c`j';
#enddo

* I don't really need to keep the g. It is has 'weight' -2:
id g = l^(-2);
B	l;
.sort
Hide L1;

L	L = sum_(j,0,`n',x^j*invfac_(j));

#do i = `n',1,-1
    id,once,x^`i'*l^n? = x^`i'/x*l^n*sum_(j,1,`m'-n,F(j)*l^j);
.sort:three-`i';
#enddo
id	l^n?odd_ = 0;
id	l = 1;
.sort:three;
*
*	This is the most expensive step. Specially if we do it this way:
*	id	F(n?) = L1[l^n];
*	The problem is that there are products of brackets and potentially
*	even high powers.
*
#do ii = 1,1
	#$success = 0;
	id,once,ifnomatch->nomatch,F(x?) = L1[l^x];
	if ( count(F,1) ) $success = 1;
	label nomatch;
	.sort
	#if ( `$success' == 1 )
		#redefine ii "0"
	#endif
#enddo
.sort:four;
*
*	In the next recursion we use the function num, because (n-1) at ground
*	level gives two terms, and if we go m times through the resursion we
*	will get 2^m terms. This way we keep it one term.
*	One can also work with factorials etc, but that does not gain much more.
*	This is simpler.
*
CF num;
#do j = `n',1,-1
* This step was also very expensive.
* It is faster if one cleans up right afterwards.
    #if {`j'%2} == 0
        id c`j' = x`j' + z^{-`j'/2};
    #else
        id c`j' = x`j';
    #endif


	id	x`j'^n?odd_ = 0;
	repeat;
		id x`j'^n?pos_ = num(n-1)*x`j'^n/x`j'^2/z^`j'*`j';
		id	num(x?) = x;
	endrepeat;
    .sort:five-`j';
#enddo

Bracket z;
Print +f;
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
id	z^n? = z^-n;
Print +f +s;
.end
