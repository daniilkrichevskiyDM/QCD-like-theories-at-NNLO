#define PEOPLE "10"
*
*	First we need names
*
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
*
*	Then we need e-mail addresses.
*
#define email1 "John@xyz.zz"
#define email2 "Jane@xyz.zz"
#define email3 "Carol@xyz.zz"
#define email4 "Pete@xyz.zz"
#define email5 "Fred@xyz.zz"
#define email6 "Lizzy@xyz.zz"
#define email7 "Mary@xyz.zz"
#define email8 "Frank@xyz.zz"
#define email9 "Bill@xyz.zz"
#define email10 "Astrid@xyz.zz"
*
*	Next we need to set the random number generator
*	Run program with: form -d INI=somenumber friend2
*
#ifdef `INI'
  #setrandom `INI'
#else
  #setrandom 13
#endif
*
Symbol x;
CFunction f;
CTable Allowed(1:`PEOPLE',1:`PEOPLE');
Fill Allowed(1,1) =
	 0,0,1,1,1,1,1,1,1,1
	,0,0,1,1,1,1,1,1,1,1
	,1,1,0,0,1,1,1,1,1,1
	,1,1,0,0,1,1,1,1,1,1
	,1,1,1,1,0,0,1,1,1,1
	,1,1,1,1,0,0,1,1,1,1
	,1,1,1,1,1,1,0,0,0,0
	,1,1,1,1,1,1,0,0,0,0
	,1,1,1,1,1,1,0,0,0,0
	,1,1,1,1,1,1,0,0,0,0;
Off Statistics;
#do ii = 1,1
	Local F = ranperm_(f,1,...,`PEOPLE');
	#do i = 1,`PEOPLE'
		id f(x?$to`i',?a) = Allowed(`i',x)*f(?a);
	#enddo
	.sort
	#if ( termsin(F) == 0 )
		#redefine ii "0"
	#endif
#enddo
#do i = 1,`PEOPLE'
	#write <`name`i''.sint> "This mail contains the name of the person to whom"
	#write <`name`i''.sint> "you should give the secret present."
	#write <`name`i''.sint> "Keep this name secret."
	#write <`name`i''.sint> "It is part of the mystery of Sinterklaas."
	#write <`name`i''.sint> "                                                "
	#write <`name`i''.sint> "              `name`i'' gives to `name`$to`i''' "
	#write <`name`i''.sint> "                                                "
	#close <`name`i''.sint>
*    #system mail -s "Sinterklaas" `email`i'' < name`i'.sint
*    #remove <`name`i''.sint>
#enddo
.end

