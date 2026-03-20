#procedure TakeSome(c,num)
*
*	This procedure does a Gaussian elimination for terms with complexity `c'.
*	The parameter num is obsolete.
*	The equations containing the elements that are eliminated are lost.
*
*	We assume that there are $numeq equations, named G1,...,G`$numeq'.
*	There is also an array $exists1,...,$exists`$numeq' that tells whether
*	an equation still exists.
*
.sort
#message c = `c'
if ( match(Z(-`c',?a)) );
	id	Z(-`c',?a)*rat(x1?,x2?) = Z(-`c',nterms_(x1)+nterms_(x2),?a)*rat(x1,x2);
endif;
B	Z;
.sort
#do j = 1,1
#if ( `c' == 2 )
	#$numc2 = $numc2+1;
	#message $numc2 = `$numc2'
#endif
*
*	Start with counting:
*	The number of terms with leading complexity in $nn
*	The number of terms with subleading complexity in $ns
*	The total number of terms of the expression in $nt
*
#do i = 1,`$numeq'
 #if ( `$exists`i'' )
  #$nn`i' = 0;
  #$ns`i' = 0;
  #$nx`i' = 0;
  #$nt`i' = termsin_(G`i');
  #$nc`i' = 0;
 #endif
#enddo
if ( match(Z(-`c',?a)) );
#do i = 1,`$numeq'
  #if ( `$exists`i'' )
	if ( expression(G`i') );
		$nn`i' = $nn`i'+1;
		id	rat(x1?$x1,x2?$x2) = rat(x1,x2);
		$nc`i' = $nc`i'+ termsin_($x1)+termsin_($x2);
		if ( $nn`i' == 1 );
			id	rat(x1?$x1,x2?$x2) = rat(x1,x2);
			$nx`i' = termsin_($x1)+termsin_($x2);
		endif;
	endif;
  #endif
#enddo
elseif ( match(Z(-`c'+1,?a)) );
#do i = 1,`$numeq'
  #if ( `$exists`i'' )
	if ( expression(G`i') ) $ns`i' = $ns`i'+1;
  #endif
#enddo
endif;
#do i = 1,`$numeq'
  #if ( `$exists`i'' )
	if ( expression(G`i') );
		id	rat(x1?$x1,x2?$x2) = rat(x1,x2);
		$nc`i' = $nc`i'+ termsin_($x1)+termsin_($x2);
	endif;
  #endif
#enddo
*#if ( `c' == 2 )
*.sort
*#do i = 1,`$numeq'
*  #if ( `$exists`i'' )
*	#write <> " $nc`i' = %$",$nc`i'
*  #endif
*#enddo
*Print +f +s;
*.end
*#endif
B	Z;
.sort
#$nnsum = 1;
#$nssum = 1;
#$ntsum = 1;
#$nxsum = 1;
#do i = 1,`$numeq'
  #if ( `$exists`i'' )
	#$nnsum = $nnsum+`$nn`i'';
	#$nssum = $nssum+`$ns`i'';
	#$ntsum = $ntsum+`$nt`i'';
	#$nxsum = $nxsum+`$nx`i'';
  #endif
#enddo
#if ( `$nnsum' > 1 )
    #$imin = 0;
    #$nmin = 1000*`$nnsum'+40*`$nssum'+`$ntsum'+40*`$nxsum'+1000000;
    #do i = 1,`$numeq'
     #if ( `$exists`i'' )
	  #if ( `$nc`i'' > 100000 )
		#call Drop(`i')
	  #elseif ( `$nn`i'' > 0 )
		#$n = 100*`$nn`i''+4*`$ns`i''+`$nt`i''+4*`$nx`i''+`$nc`i'';
		#if ( `$n' < `$nmin' )
			#$imin = `i';
			#$nmin = $n;
		#endif
	  #endif
     #endif
    #enddo
*
*	At this point we see $imin as optimal.
*
#if ( ( `TOPO' == t1 ) && ( `c' ==  2 ) )
	Print +f +s G`$imin';
	B	Z;
	.sort
#endif
	#if ( ( `$nn`$imin'' == 1 ) )
		#call PrintId(G`$imin',`c',stat`c')
	#endif
	#$eq = G`$imin';
*
*	Look for the term that has tot complexity and the largest number of
*	objects that are not a single symbol.
*
*----------------------------------
#if(1==0)
	#$mnum = -1;
	#$lhs = 0;
	#inside $eq
		if ( match(Z(-`c',?a)) );
			$nnn = 0;
#do nnn = 1,`N'
			if ( match(Z(?a,n`nnn',?b)) ) $nnn = $nnn+1;
#enddo
			if ( $nnn > $mnum );
				$mnum = $nnn;
				$lhs = term_;
			endif;
		endif;
	#endinside
	#inside $lhs
		id	rat(x1?$x1,x2?$x2) = 1;
	#endinside
	InParallel;
	#call Drop(`$imin')
*#message    id	`$lhs' = `$lhs'-$eq*rat(`$x2',`$x1');

    id	`$lhs' = `$lhs'-$eq*rat(`$x2',`$x1');
*--------------------------------------
#else

    #$lhs = FirstBracket_(G`$imin');
    #$lhsc = G`$imin'[`$lhs'];
	#$xxx = $lhs*$lhsc-G`$imin';
    #inside $lhsc;
	  id	rat(x1?$x1,x2?$x2) = rat(x2,x1);
    #endinside;
    #write <> "Eliminating `$imin' ((`$nn`$imin'',`$ns`$imin'',`$nt`$imin'',`$nx`$imin'',`$nc`$imin''))"
	#$xxx = $xxx*$lhsc;
	#inside $xxx
		id	Z(-`c',x?,n1?,...,n`N'?) = Z(-`c',n1,...,n`N');
		id	rat(x1?,x2?)*rat(x3?,x4?) = rat1(x1,x4)*rat2(x3,x2);
		id	rat1(x1?,x2?) = rat1(x1,x2,gcd_(x1,x2));
		id	rat2(x1?,x2?) = rat2(x1,x2,gcd_(x1,x2));
		id	rat1(x1?,x2?,x3?) = rat(div_(x1,x3),div_(x2,x3));
		id	rat2(x1?,x2?,x3?) = rat(div_(x1,x3),div_(x2,x3));
		id	rat(x1?,x2?)*rat(x3?,x4?) = rat(x1*x3,x2*x4);
	#endinside
	InParallel;
	#call Drop(`$imin')
	id	Z(-`c',x?,n1?,...,n`N'?) = Z(-`c',n1,...,n`N');
#write "id	`$lhs' ="
    #inside $lhs;
		id	Z(-`c',x?,n1?,...,n`N'?) = Z(-`c',n1,...,n`N');
    #endinside;
#write <subs> "id	`$lhs' = %$;\n",$xxx
    id	`$lhs' = `$xxx';
#endif
	.sort
*
*	Now knock out expressions that become zero accidentally.
*
#do ijj = 1,`$numeq'
	#if ( `$exists`ijj'' != 0 )
		#if ( termsin(G`ijj') == 0 )
			#call Drop(`ijj')
		#endif
	#endif
#enddo
#if ( `c' <= 2 )
	#call DoFactor()
#endif
	id	Z(-`c',?a)*rat(x1?,x2?) = Z(-`c',nterms_(x1)+nterms_(x2),?a)*rat(x1,x2);
    B	Z;
    .sort
    #redefine j "0"
#endif
#enddo
#endprocedure

