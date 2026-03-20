#procedure Cleanup(A,B,n,k)
*
*	Gaussian elimination for CleanupBasic.
*
B	Z;
.sort
#do j = 1,1
*
*	Start with counting:
*	The number of terms with leading complexity in $nn
*	The number of terms with subleading complexity in $ns
*	The total number of terms of the expression in $nt
*
#do i = 1,`NUMEQ'
	#$nna`i' = 0;
	#$nnb`i' = 0;
	#$nnc`i' = 0;
	#$nt`i' = termsin_(`A'`i');
	if ( expression(`A'`i') );
		if ( match(Z(-2,?a)) );
			$nna`i' = $nna`i'+1;
		elseif ( match(Z(-1,?a)) );
			$nnb`i' = $nnb`i'+1;
		elseif ( match(Z(0,?a)) );
			$nnc`i' = $nnc`i'+1;
		endif;
	endif;
#enddo
B	Z;
.sort
*
*	Count what is still to go. Add one as a nice starting value for minimization
*
#$nnsum = 1;
#$nssum = 1;
#$ntsum = 1;
#do i = 1,`NUMEQ'
	#$nnsum = $nnsum+`$nna`i'';
	#$nssum = $nssum+`$nnb`i'';
	#$ntsum = $ntsum+`$nt`i'';
#enddo
#if ( {`$nnsum'+`$nssum'} > 2 )
*
*	Here we still have work to do
*	First we have to find out at what 'level'
*	We prefer of course complexity 1 with one term only with only one n+1
*	The order:
*		One term at subleading and none at leading  -> $level = 1
*		With leading terms  -> $level = 2
*		only subleading terms, more than one  -> $level = 3
*
    #$imin = 0;
	#$level = 10;
    #$nmin = 100*`$nnsum'+10*`$nssum'+`$ntsum';
    #do i = 1,`NUMEQ'
	  #if ( `$nna`i'' > 0 )
		#if ( `$level' > 2 )
		  #$level = 2;
		  #$imin = `i';
		  #$nmin = 100*`$nna`i''+10*`$nnb`i''+`$nt`i'';
		#elseif ( `$level' == 2 )
		  #$n = 100*`$nna`i''+10*`$nnb`i''+`$nt`i'';
		  #if ( `$n' < `$nmin' )
			#$imin = `i';
			#$nmin = $n;
		  #endif
		#endif
	  #elseif ( `$nnb`i'' == 1 )
		#if ( `$level' > 1 )
		  #$level = 1;
		  #$imin = `i';
		  #$nmin = 10*`$nnb`i''+`$nt`i'';
		#elseif ( `$level' == 1 )
		  #$n = 10*`$nnb`i''+`$nt`i'';
		  #if ( `$n' < `$nmin' )
			#$imin = `i';
			#$nmin = $n;
		  #endif
		#endif
	  #elseif ( `$nnb`i'' > 1 )
		#if ( `$level' > 3 )
		  #$level = 1;
		  #$imin = `i';
		  #$nmin = 10*`$nnb`i''+`$nt`i'';
		#elseif ( `$level' == 1 )
		  #$n = 10*`$nnb`i''+`$nt`i'';
		  #if ( `$n' < `$nmin' )
			#$imin = `i';
			#$nmin = $n;
		  #endif
		#endif
	  #endif
    #enddo
*
*	At this point we see i as optimal.
*
	#if ( ( `$nna`$imin'' == 0 ) && ( `$nnb`$imin'' == -10 ) )
		#$exp = `A'`$imin';
		#inside $exp
			if ( match(Z(-1,?a)) );
			  #do nn = 1,`n'
				#redefine extn`nn' "?"
				if ( match(Z(-1,?a,1+n`nn',?b)) );
						redefine extn`nn' "`nsign`nn''1";
				endif;
			  #enddo
			  id Z(-1,?a) = 1;
			  id rat(x1?$x1,x2?$x2) = 0;
			endif;
			id	Z(x?,?a) = Z(c+x+1,?a);
		#endinside
		if ( expression(`A'`$imin') ) discard;
		if ( expression(`B'`$imin') == 0 )
			repeat id	Z(c?neg0_
				#do nn = 1,`n'
					,n`nn'`extn`nn''
				#enddo
					) = -rat($x2,$x1)*(`$exp');
				#do nn = 1,`n'
				#enddo
	#elseif ( ( `$nna`$imin'' == 0 ) && ( `$nnb`$imin'' > 1 ) )
		if ( expression(`A'`$imin') ) Discard;
	#elseif ( `$nna`$imin'' > 1 )
*
*		Now we should look for an integral with ki+1
*
		#$exp = `A'`$imin';
		#$kterm = -1;
		#$ktermn = 0;
		#do kk = `ORDER'
		 #if ( ( `$nsign`kk'' == -1 ) && ( `$ktermn' == 0 ) )
		  #inside $exp
			if ( match(Z(-2,?a)) );
				if ( $ktermn == 0 );
				  if ( match(Z(-2,?a,n`kk'-1,?b)) );
					$ktermn = 1;
					id	rat(x1?$x1,x2?$x2) = 1;
					$kterm = term_;
					Discard;
				  endif;
				endif;
			endif;
		  #endinside
		 #endif
		#enddo
		#if ( `$ktermn' == 1 )
			if ( expression(`B'`$imin') == 0 );
				id	`$kterm' = -rat(`$x2',`$x1')*(`$exp');
			endif;
		#else
		    #$lhs = FirstBracket_(`A'`$imin');
    		#$lhsc = `A'`$imin'[`$lhs'];
	    	#inside $lhsc;
			  id	rat(x1?,x2?) = rat(x2,x1);
		    #endinside;
			if ( expression(`B'`$imin') == 0 )
	    		id	`$lhs' = `$lhs'-`A'`$imin'*`$lhsc';
		#endif
	#else
	    #$lhs = FirstBracket_(`A'`$imin');
    	#$lhsc = `A'`$imin'[`$lhs'];
	    #inside $lhsc;
		  id	rat(x1?,x2?) = rat(x2,x1);
	    #endinside;
		if ( expression(`B'`$imin') == 0 )
	    	id	`$lhs' = `$lhs'-`A'`$imin'*`$lhsc';
	#endif
    B	Z;
    .sort
    #redefine j "0"
#endif
#enddo
#endprocedure

