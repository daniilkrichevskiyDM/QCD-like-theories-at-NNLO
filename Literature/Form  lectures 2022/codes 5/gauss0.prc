#procedure gauss0(NUM,C)
*
*	Procedure takes a system of NUM equations named G1,...,G`NUM'.
*	Eliminates all integrals of complexity C.
*	We use the most trivial variety of a Gaussian elimination
*
#do i = 1,`NUM'
  #if ( termsin(G`i') > 0 )
	#$lhs = firstterm_(G`i');
	#$match = 0;
	#inside $lhs
		if ( match(Z(-`C',?a)) );
			id	rat(x1?$x1,x2?$x2) = 1;
			$match = 1;
		endif;
	#endinside
	#if ( `$match' > 0 )
		#$rhs = -(G`i'*rat($x2,$x1)-$lhs);
		id	`$lhs' = $rhs;
		.sort
	#endif
  #endif
#enddo
#endprocedure
