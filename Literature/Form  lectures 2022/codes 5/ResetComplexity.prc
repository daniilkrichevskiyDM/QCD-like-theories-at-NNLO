#procedure ResetComplexity(N,par)
*
#if ( `par' == 0 )
	id	Z(x?,x1?,...,x`N'?) = Z(x1,...,x`N');
#elseif ( `par' == 1 )
	id	Z(x?,x1?,...,x`N'?) = Z(x1,...,x`N');
	id	Z(x1?,...,x`N'?) =
		Z(-(<abs_(n1-x1)>+...+<abs_(n`N'-x`N')>),x1,...,x`N');
#endif
*
#endprocedure

