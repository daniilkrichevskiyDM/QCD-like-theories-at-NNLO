Symbols a1,...,a4,n;
CFunction f,g;
Off Statistics;
Local F = f(a1,a3,a4,a2);
Print;
.sort
id	f(?a) = f(nargs_(?a),?a);
Print;
.sort
id	f(n?$num,?a) = f(?a);
Print;
.sort
id	f(<a1?$arg1>,...,<a`$num'?$arg`$num'>) = 1;
Print;
.sort
Drop F;
#do i = 1,`$num'
	#write "       Argument `i' = `$arg`i''"
#enddo
.end

