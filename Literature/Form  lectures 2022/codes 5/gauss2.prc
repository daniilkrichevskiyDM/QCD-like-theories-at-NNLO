#procedure gauss2(NUM,C)
*
*   Procedure takes a system of NUM equations named G1,...,G`NUM'.
*   Eliminates all integrals of complexity C.
*   Second attempt in the Gauss elimination: we take the term
*   with weight C but with the simplest coefficient.
*
#do i = 1,`NUM'
#if ( termsin(G`i') > 0 )
    #$expr = G`i';
    #inside $expr
        if ( match(Z(-`C',?a)) );
            id  Z(-`C',?a)*rat(x1?,x2?) = Z(-`C',nterms_(x1)+nterms_(x2),nterms_(x1),?a)*rat(x1,x2);
        endif;
    #endinside
*
*   Having sorted $expr the 'simplest' term is now first
*
    #$lhs = firstterm_($expr);
    #$match = 0;
    #inside $lhs
        if ( match(Z(-`C',?a)) );
            id  Z(x1?,x2?,x3?,n1?,...,n5?) = Z(x1,n1,...,n5);
            id  rat(x1?$x1,x2?$x2) = 1;
            $match = 1;
        endif;
    #endinside
    #if ( `$match' > 0 )
        #$rhs = -($expr*rat($x2,$x1)-$lhs);
        #inside $rhs
            id  Z(x1?,x2?,x3?,n1?,...,n5?) = Z(x1,n1,...,n5);
        #endinside
        id  `$lhs' = $rhs;
        #$factors = acc($x1);
        #inside $factors
            FactArg,acc;
            ChainOut acc;
            id  acc(x?number_) = 1;
            id  acc(x?symbol_) = x;
        #endinside
        #write "Taking out %$, factors = %$",$lhs,$factors
        .sort
    #endif
#endif
#enddo
#endprocedure

