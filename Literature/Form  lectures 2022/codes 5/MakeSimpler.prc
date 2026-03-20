#procedure MakeSimpler(B,N)
*
*	Creates the file shorter.hh which can be used after the main Gaussian
*	eliminations when we have gone to higher complexity equations.
*	It eliminates many terms in the complexity 1 integrals.
*
#do i = 1,`NUMEQ'
#$done`i' = 0;
#enddo
#write <shorter.hh> "*\n*   File with substitutions in topology `TOPO'(`SIGNS')."
#write <shorter.hh> "*   File created on `date_' by the forcer program.\n*"
#do j = 1,1
*
*	Start with counting:
*	The number of terms with leading complexity in $nn
*	The number of terms with subleading complexity in $ns
*	The total number of terms of the expression in $nt
*
#do i = 1,`NUMEQ'
#$maxc`i' = 100;
#$nn`i' = 0;
#$nm`i' = 0;
#$ns`i' = 0;
#if ( `$done`i'' == 0 )
	#$nt`i' = termsin_(`B'`i');
#endif
#enddo
if ( match(Z(x?$x,?a)) );
#do i = 1,`NUMEQ'
	if ( ( $done`i' == 0 ) && expression(`B'`i') && ( $x < $maxc`i' ) ) $maxc`i' = $x;
#enddo
endif;
if ( match(Z(-3,?a)) );
#do i = 1,`NUMEQ'
	if ( ( $done`i' == 0 ) && expression(`B'`i') ) $nm`i' = $nm`i'+1;
#enddo
elseif ( match(Z(-2,?a)) );
#do i = 1,`NUMEQ'
	if ( ( $done`i' == 0 ) && expression(`B'`i') ) $nn`i' = $nn`i'+1;
#enddo
elseif ( match(Z(-1,?a)) );
#do i = 1,`NUMEQ'
	if ( ( $done`i' == 0 ) && expression(`B'`i') ) $ns`i' = $ns`i'+1;
#enddo
endif;
B	Z;
.sort
#$nmsum = 1;
#$nnsum = 1;
#$nssum = 1;
#$ntsum = 1;
#do i = 1,`NUMEQ'
	#$nmsum = $nmsum+`$nm`i'';
	#$nnsum = $nnsum+`$nn`i'';
	#$nssum = $nssum+`$ns`i'';
	#$ntsum = $ntsum+`$nt`i'';
#enddo
#if ( `$nnsum' > 1 )
    #$imin = 0;
    #$nmin = 10000*`$nnsum'+100*`$nssum'+`$ntsum';
    #do i = 1,`NUMEQ'
	  #if ( {`$nn`i''+`$ns`i''} > 0 )
		#$n = 10000*`$nn`i''+100*`$ns`i''+`$nt`i'';
		#if ( `$n' < `$nmin' )
			#$imin = `i';
			#$nmin = $n;
		#endif
	  #endif
    #enddo
*
*	At this point we see i as optimal.
*	Now the challenge is to write it away as a proper id statement
*	to a file that can be used at a later stage in the program.
*	Everything should be 'normalized' to complexity 1.
*
  #if ( ( `$nn`$imin'' > 0 ) && ( `$nm`$imin'' == 0 ) )
	#$exp = `B'`$imin';
	#$donefirstinexp = 0;
	#$c = -2;
	#do n = 1,`N'
		#redefine extn`n' "?"
	#enddo
	#do n = `ORDER'
	  #if ( ( `$nsign`n'' == -1 ) && ( `$donefirstinexp' == 0 ) )
		#inside $exp
		  if ( match(Z(-2,?a,n`n'-1,?b)) && ( $donefirstinexp == 0 ) );
			$donefirstinexp = 1;
			id	rat(x1?$x1,x2?$x2) = 1;
			#do nn = 1,`N'
				if ( match(Z(?a,n`nn'`nsign`nn''1,?b)) );
					redefine extn`nn' "`nsign`nn''1";
				endif;
			#enddo
			Discard;
		  endif;
		#endinside
	  #endif
	#enddo
	#inside $exp
		id	Z(x?,?a) = Z(c+x-$c,?a);
	#endinside
	#if ( `$donefirstinexp' )
		#write <shorter.hh> "*   `B'`$imin'"
		#write <shorter.hh> "id	Z(c?neg_%"
	  #if ( `TOPO' == bebe )
	  #do nn = 1,`N'
		#if ( ( `nn' == 1 ) || ( `nn' == 3 ) )
			#write <shorter.hh> ",1%"
		#else
		#write <shorter.hh> ",n`nn'`extn`nn''%"
		#endif
	  #enddo
	  #else
	  #do nn = 1,`N'
		#write <shorter.hh> ",n`nn'`extn`nn''%"
	  #enddo
	  #endif
		#write <shorter.hh> ") =\n   -rat(%$,%$)*(%3$);",$x2,$x1,$exp
	#endif
  #endif
    B	Z;
    .sort
    #redefine j "0"
	#$done`$imin' = 1;
#endif
#enddo
#close <shorter.hh>
#endprocedure

