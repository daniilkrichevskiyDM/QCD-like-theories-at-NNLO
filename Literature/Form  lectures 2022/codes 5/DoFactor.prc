#procedure DoFactor()
	.sort:DoFactor-0;
	PolyRatFun;
	id	rat(x1?,x2?) = num(x1)*den(x2);
	FactArg num;
	FactArg den;
	ChainOut num;
	ChainOut den;
	id	num(1) = 1;
	id	den(1) = 1;
	id	num(-1) = -1;
	id	den(-1) = -1;
	id	num(x?neg_) = -num(-x);
	id	den(x?neg_) = -den(-x);
	.sort:DoFactor-1;
	InParallel;
	Skip;
	#do i = 1,`$numeq'
	  #if ( `$exists`i'' )
		#if ( termsin(G`i') > 0 )
			G	H`i' = content_(G`i');
		#endif
	  #endif
	#enddo
	Multiply replace_(num,den,den,num);
	.sort
	#do i = 1,`$numeq'
	  #if ( `$exists`i'' )
	   #if ( termsin(G`i') > 0 )
		if ( expression(H`i') );
			if ( count(num,1,den,1) )
					Print +f "<<`i'>> %t";
			Multiply G`i';
		endif;
	   #endif
	  #endif
	#enddo
	if ( expression(H1,...,H`$numeq') );
	id	num(x?)*den(x?) = 1;
	repeat id num(x1?)*num(x2?) = num(x1*x2);
	repeat id den(x1?)*den(x2?) = den(x1*x2);
	id	num(x1?) = rat(x1,1);
	id	den(x1?) = rat(1,x1);
	id	rat(1,x2?)*rat(x1?,1) = rat(x1,x2);
	endif;
	.sort:DoFactor-2;
	PolyRatFun rat,RAT;
	InParallel;
	Drop H1,...,H`$numeq';
	#do i = 1,`$numeq'
	  #if ( `$exists`i'' )
	   #if ( termsin(G`i') > 0 )
		G	G`i' = H`i';
	   #endif
	  #endif
	#enddo
	.sort:DoFactor-3;
#endprocedure
