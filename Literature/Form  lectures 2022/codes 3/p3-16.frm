Symbols a1,...,a4;
CFunction f,g;
Local F = f(a1,a3,a4,a2)*g(a3,a4,a2,a1);
Print;
.sort
if ( match(f?$fun(?a,a1?$arg,?b)) );
	print "   --- The program took $fun = %$ and $arg = %$",$fun,$arg;
endif;
.end
