Symbols a1,...,a4;
CFunction f,g;
Local F = f(a1,a3,a4,a2);
Print;
.sort
$num = 0;
repeat;
  if ( match(f(a1?,?a)) );
    $num = $num+1;
    id f(a1?,?a) = g($num,a1)*f(?a);
  endif;
endrepeat;
id f = 1;
Print;
.sort
#do i = 1,`$num'
	id g(`i',a1?$arg`i') = 1;
#enddo
Print;
.sort
Drop F;
#do i = 1,`$num'
	#write "       Argument `i' = `$arg`i''"
#enddo
.end
