#define PEOPLE "10"
#define name1 "John"
#define name2 "Jane"
#define name3 "Carol"
#define name4 "Pete"
#define name5 "Fred"
#define name6 "Lizzy"
#define name7 "Mary"
#define name8 "Frank"
#define name9 "Bill"
#define name10 "Astrid"
Symbol x;
CFunction f;
Off Statistics;
#do ii = 1,1
	Local F = ranperm_(f,1,...,`PEOPLE');
	#do i = 1,`PEOPLE'
		id f(x?$to`i',?a) = deltap_(`i'-x)*f(?a);
	#enddo
	.sort
	#if ( termsin(F) == 0 )
		#redefine ii "0"
	#endif
#enddo
#do i = 1,`PEOPLE'
	#write <> "      `name`i'' gives to `name`$to`i'''"
#enddo
.end

