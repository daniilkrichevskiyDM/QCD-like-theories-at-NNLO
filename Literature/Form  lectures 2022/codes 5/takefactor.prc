#procedure takefactor(G)
*
*   We try to divide out overal factors.
*   The set of equations is given in the macro TODO
*   The equations are marked as `G'<number>
*
.sort
PolyRatFun;
id  rat(x1?,x2?) = num(x1)*den(x2);
FactArg,num;
FactArg,den;
ChainOut num;
ChainOut den;
*id  num(x?number_) = x;
*id  den(x?number_) = 1/x;
*
.sort
*
*   The content_ function can handle only symbols. Hence:
*
ToPolynomial;
.sort
#do i = `TODO'
 #if ( `$exists`i'' > 0 )
 #if ( termsin(`G'`i') > 0 )
  #$content = content_(`G'`i');
*
*   Now exchange num and den. For this we should get rid of the extra symbols.
*
  #$match = 0;
  #inside $content
    FromPolynomial;
*    $ccc = 1/coeff_;
*    Multiply replace_(num,den,den,num)*$ccc^2;
    Multiply replace_(num,den,den,num);
    if ( count(num,1,den,1) ) $match = 1;
  #endinside
  #if ( `$match' > 0 )
      #write <> " content`i' = %$",$content
  #endif
  if ( expression(`G'`i') ) Multiply `$content';
 #endif
 #endif
#enddo
.sort
PolyRatFun rat,RAT;
*
*   Now back to normal. Get rid of the extra symbols in the expression.
*
FromPolynomial;
id  num(x?)*den(x?) = 1;
id  num(x?) = rat(x,1);
id  den(x?) = rat(1,x);
.sort
#endprocedure
