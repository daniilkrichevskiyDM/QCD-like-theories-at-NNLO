#procedure gauss5(G,c)
*
*   This procedure does a Gaussian elimination for terms
*   with complexity `c'.
*   The equations containing the elements that are
*   eliminated are lost.
*   We assume that there are $numeq equations, 
*   named `G'1,...,`G'`$numeq'.
*   There is also an array $exists1,...,$exists`$numeq'
*   that tells whether an equation still exists.
*
.sort
#message Procedure gauss5 dealing with complexity `c'
*
*   Suborder Z by the number of terms in rat.
*
if ( match(Z(-`c',?a)) );
    id  Z(-`c',?a)*rat(x1?,x2?) = Z(-`c',
                 nterms_(x1)+nterms_(x2),?a)*rat(x1,x2);
endif;
B   Z;
.sort
#$numc`c' = 0;
#do j = 1,1
  #if ( `c' <= 2 )
    #$numc`c' = $numc`c'+1;
    #message $numc`c' = `$numc`c''
  #endif
*
*   Start with counting:
*   The number of terms with leading complexity in $nn
*   The number of terms with subleading complexity in $ns
*   The number of terms in rat in the whole expression in $nc
*   The number of terms in rat in the first term in $nc
*   The total number of terms of the expression in $nt
*
  #do i = `TODO'
    #if ( `$exists`i'' )
      #$nn`i' = 0;
      #$ns`i' = 0;
      #$nx`i' = 0;
      #$nt`i' = termsin_(`G'`i');
      #$nc`i' = 0;
    #endif
  #enddo
  if ( match(Z(-`c',?a)) );
    #do i = `TODO'
      #if ( `$exists`i'' )
        if ( expression(`G'`i') );
            $nn`i' = $nn`i'+1;
            id  rat(x1?$x1,x2?$x2) = rat(x1,x2);
*            $nc`i' = $nc`i'+ termsin_($x1)+termsin_($x2);
            if ( $nn`i' == 1 );
                id  rat(x1?$x1,x2?$x2) = rat(x1,x2);
                $nx`i' = termsin_($x1)+termsin_($x2);
            endif;
        endif;
      #endif
    #enddo
  elseif ( match(Z(-`c'+1,?a)) );
    #do i = `TODO'
      #if ( `$exists`i'' )
        if ( expression(`G'`i') ) $ns`i' = $ns`i'+1;
      #endif
    #enddo
  endif;
  #do i = `TODO'
    #if ( `$exists`i'' )
      if ( expression(`G'`i') );
        id  rat(x1?$x1,x2?$x2) = rat(x1,x2);
        $nc`i' = $nc`i'+ termsin_($x1)+termsin_($x2);
      endif;
    #endif
  #enddo
  B   Z;
  .sort
*
*   Get now the totals of all our variables.
*
  #$nnsum = 1;
  #$nssum = 1;
  #$ntsum = 1;
  #$nxsum = 1;
  #do i = `TODO'
    #if ( `$exists`i'' )
      #$nnsum = $nnsum+`$nn`i'';
      #$nssum = $nssum+`$ns`i'';
      #$ntsum = $ntsum+`$nt`i'';
      #$nxsum = $nxsum+`$nx`i'';
    #endif
  #enddo
  #if ( `$nnsum' > 1 )
    #$imin = 0;
*
*   Starting value that is bigger than any weight
*
    #$nmin = 1000*`$nnsum'+40*`$nssum'+`$ntsum'\
                          +40*`$nxsum'+1000000;
    #do i = `TODO'
     #if ( `$exists`i'' )
*      #if ( `$nc`i'' > 100000 )
*        #call Drop(`i')
*      #elseif ( `$nn`i'' > 0 )
      #if ( `$nn`i'' > 0 )
*
*       Finally the weight function
*
        #$n = 100*`$nn`i''+4*`$ns`i''+`$nt`i''\
                          +4*`$nx`i''+`$nc`i'';
        #if ( `$n' < `$nmin' )
            #$imin = `i';
            #$nmin = $n;
        #endif
      #endif
     #endif
    #enddo
*
*   At this point we see $imin as optimal.
*
    #if ( `c' ==  2 )
      Print +f +s `G'`$imin';
      B   Z;
      .sort
    #endif
    #$eq = `G'`$imin';
*
    #$lhs = FirstBracket_(`G'`$imin'); * object to replace
    #$lhsc = `G'`$imin'[`$lhs'];       * coefficient
    #$xxx = $lhs*$lhsc-`G'`$imin';
    #inside $lhsc;
      id    rat(x1?$x1,x2?$x2) = rat(x2,x1);
    #endinside;
    #write <> "Eliminating `$imin' ((`$nn`$imin'',`$ns`$imin''\
                    ,`$nt`$imin'',`$nx`$imin'',`$nc`$imin''))"
    #$xxx = $xxx*$lhsc;      * the right hand side
*
*   PolyRatFun does not work inside dollars.
*   Manually simplify the rat functions a bit.
*
    #inside $xxx
      id  Z(-`c',x?,n1?,...,n`N'?) = Z(-`c',n1,...,n`N');
      id  rat(x1?,x2?)*rat(x3?,x4?) = rat1(x1,x4)*rat2(x3,x2);
      id  rat1(x1?,x2?) = rat1(x1,x2,gcd_(x1,x2));
      id  rat2(x1?,x2?) = rat2(x1,x2,gcd_(x1,x2));
      id  rat1(x1?,x2?,x3?) = rat(div_(x1,x3),div_(x2,x3));
      id  rat2(x1?,x2?,x3?) = rat(div_(x1,x3),div_(x2,x3));
      id  rat(x1?,x2?)*rat(x3?,x4?) = rat(x1*x3,x2*x4);
      id  rat(x1?number_,x2?number_) = x1/x2;
    #endinside
    #call Drop(`$imin')
	#$match = 0;
	#if ( `c' <= 1 )
		#$numout = $numout+1;
        G  H`$numout' = `$lhs'-`$xxx';
		#$match = 1;
	#elseif ( `c' == 2 )
		#inside $lhs
			if ( match(Z(-2,?a,-1+n1,?b)) || match(Z(-2,?a,-1+n4,?b))
			|| match(Z(-2,?a,-2+n1,?b))
			|| match(Z(-2,?a,-2+n4,?b)) ) $match = 1;
		#endinside
		#if ( `$match' > 0 )
			#$numout = $numout+1;
    	    G  H`$numout' = `$lhs'-`$xxx';
		#endif
	#endif
*
*   Back to the regular form of the Z.
*   Then we write to the .log file what we will replace.
*
    id  Z(-`c',x?,n1?,...,n`N'?) = Z(-`c',n1,...,n`N');
    #write "id  `$lhs' ="
    #inside $lhs;
      id  Z(-`c',x?,n1?,...,n`N'?) = Z(-`c',n1,...,n`N');
    #endinside;
*
*   And this is the statement that eliminates this integral.
*
	#if ( `c' <= 2 )
		if ( ( $match == 1 ) && ( expression(H`$numout') == 0 ) )
	#endif;
          id  `$lhs' = `$xxx';
    .sort
*
*   Now knock out expressions that become zero accidentally.
*
    #do ijj = `TODO'
      #if ( `$exists`ijj'' != 0 )
        #if ( termsin(`G'`ijj') == 0 )
            #call Drop(`ijj')
        #endif
      #endif
    #enddo
*
*   Divide out overal factors.
*
    #if ( `c' <= `INCCOMPLEXITY' )
      #call takefactor(`G')
    #endif
    id  Z(-`c',?a)*rat(x1?,x2?) = Z(-`c',
                   nterms_(x1)+nterms_(x2),?a)*rat(x1,x2);
    B   Z;
    .sort
    #redefine j "0"
  #endif
#enddo
#endprocedure
