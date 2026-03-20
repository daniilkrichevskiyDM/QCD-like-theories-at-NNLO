#procedure addone(x,n)
#if ( {`n'} > 0 )
  id  `x' = `x'+1;
  #call addone(`x',`n'-1)
#endif
#endprocedure

Symbol x;
Local F = x;
#call addone(x,10)
Print;
.end

