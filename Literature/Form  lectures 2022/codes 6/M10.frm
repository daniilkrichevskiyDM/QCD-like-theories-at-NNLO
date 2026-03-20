#-
#: WorkSpace 1G
#: LargeSize 20G
#: SmallSize 2G
#: TermsInSmall 200M
#: ScratchSize 2G
*
* Calculates the integral Euler Characteristic of Out(F_n) where N = chi + 1
*
#define chi "40"
*
*--#[ Declarations :
*
#define M "{`chi'*2}"
#define N "{`chi'*6}"
Symbol j,n,y,x,zsq(-{2*`M'}:`M'),z(:`M'),g,l(:`N');
Symbol c0,...,c`N';
*--#] Declarations :
.global
Off Statistics;
Local L0 =
  #do j = 1,`M'
    + g^`j' * z^`j' / `j' * ( 
    	c`j' + c`j'^2/2 
    	#if {2*`j'} <= `N'
        	- c{2*`j'} / 2
	    #endif
    	- (1+c`j') * (
	      #do k = `j',`N',`j'
    	    + moebius_({`k'/`j'})/{`k'/`j'} *
        	  sum_(j,`k',`N',`k',-sign_(j/`k') * c`k'^(j/`k')/(j/`k'))
	      #enddo
    	)
    )
  #enddo
        ;
id	z = 1/zsq^2;
*
*	Some corner cutting:
*
#do j = `N',{`N'/2+1},-2
    id c{`j'} = l^`j'*zsq^`j';
#enddo
#do j = `N'-1,{`N'/2+1},-2
    id c{`j'} = 0;
#enddo
#do j = 1,`N'
    id c`j' = l^`j' * c`j'*zsq^`j';
#enddo
*
*	We don't really need to keep the g. It is has 'weight' -2:
*
id g = l^(-2);
B	zsq,l;   * in case we would like to print the expression.
.sort
*
*	Now we have to set up a loop in which we work our way down from the
*	high c`i' to the c1.
*	This should be done slowly to avoid building up too many terms.
*	Each time we try to eliminate the respective c`i' as quickly as possible.
*
Off Statistics;
#do i = `N'/2,1,-1
L	L`i' = L0;
#$minl`i' = `N';
if ( expression(L`i') );
	if ( count(c`i',1) == 0 ) Discard;
	if ( count(l,1) < $minl`i' ) $minl`i' = count_(l,1);
else;
	id	c`i' = 0;
endif;
*Print +f L`i';
B+	l;
ModuleOption minimum,$minl`i';
.sort:L`i';
Table,zerofill,Ltab`i'(0:`N');
FillExpression Ltab`i' = L`i'(l);
Hide L`i';
#enddo
#$minl0 = `N';
if ( count(l,1) < $minl0 ) $minl0 = count_(l,1);
B	l;
*Print +f;
ModuleOption minimum,$minl0;
.sort
Table,zerofill,Ltab0(0:`N');
FillExpression Ltab0 = L0(l);
Hide L0;
.sort
*
*	Now we construct G`i' = exp(L`i').
*	This step uses a manipulation of the summation bounds due to
*	the fact that most L`i' have a minimum power of l that is 
*	bigger than one.
*
On Statistics;
#do i = 0,`N'/2
L	G`i' = sum_(j,0,{`M'/`$minl`i''},x^j*invfac_(j));
#do ii = `M'/`$minl`i'',1,-1
    id,once,x^`ii'*l^n? = x^`ii'/x*l^n*
		sum_(j,1,{`M'-`$minl`i''*(`ii'-1)}-n,Ltab`i'(j)*l^j);
.sort:G`i'-`ii';
#enddo
id	l^n? = 1;
B+	zsq;
.sort
Hide G`i';
.sort
#enddo
*
*	Here we set up tables for the powers of the c`i'.
*
#do i = `N'/2,1,-1
Table,zerofill,Ctab`i'(1:{`N'/`i'});
#do in = 1,`N'/`i'
	#if ( {`i'%2} != 0 )
		#if ( {`in'%2} != 0 )
			#$t = 0;
		#else
			#$t = fac_(`in')*invfac_(`in'/2)/2^(`in'/2)*`i'^(`in'/2);
		#endif
	#else
		#$t = sum_(j,0,integer_(`in'/2),fac_(`in')*invfac_(`in'-2*j)*invfac_(j)*{`i'/2}^j);
	#endif
	Fill Ctab`i'(`in') = `$t';
#enddo
#enddo
*
*	The idea here is to multiply in such a way that we can
*	substitute the powers of c`i' immediately. To avoid too much
*	work we bracket in c`i' and zsq.
*	Yet the number of terms generated is enormous, specially compared
*	to the number of terms remaining after sorting.
*	The worst step is for c6.
*
L	L = G0;
#do i = `N'/2,1,-1
B	zsq,c`i';
.sort:remove-c{`i'+1};
Keep Brackets;
id	zsq^n? = zsq^n*sum_(j,0,2*`chi'-n,zsq^j*G`i'[zsq^j]);
id	c`i'^n?pos_ = Ctab`i'(n);
#enddo
id	zsq^2 = z;
Print +f;
Bracket z;
.sort:z-expansion;
*
*	And now the final steps
*
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
L C = sum_(j,1,`chi', sum_(l,1,integer_(`chi'/j),z^(l*j) * moebius_(l)/l * Log[z^j]));
Print +f +s;
.end:result;
