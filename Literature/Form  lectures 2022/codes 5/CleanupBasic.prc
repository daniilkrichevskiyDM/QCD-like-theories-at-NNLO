#procedure CleanupBasic(N)
*
*	After generating the IBP equations we 'clean up' the system a bit
*	eliminating many terms from most equations in a kind of Gaussian
*	elimination. The input is supposed to be A1,...,A`N'. The output is
*	the set B1,...,B`N'. When there are equations of complexity zero at
*	most, they are not treated and the corresponding A-equation survives.
*	This is usually the case when there is a trivial reduction.
*
*	The procedure generates also the files stat for inclusion in the
*	reduction algorithm and shorter.hh for use later in the program.
*	It should be noted however that often handwork in constructing these
*	files gives better results. The files reflect the B-equations and
*	how they can be used to speed up the reduction algorithms.
*
PolyRatfun,rat,RAT;
Multiply replace_(D,4-2*ep);
id,many,x?{n1,...,n`N',D,ep} = rat(x,1);
.sort
id	rat(?a) = C(?a);
.sort
id	C(?a) = rat(?a);
.sort
#call ResetComplexity(`N',1)
.sort
#do i = 1,`NUMEQ'
G	B`i' = A`i';
#enddo
#call Cleanup(A,B,`N',3)
Print +f;
B	Z;
.end
.sort
#write <> "------------------------------------------------------------"
id	rat(?a) = C(?a);
.sort
id	C(?a) = rat(?a);
.sort
#call MakeSimpler(B,`N')
#call PreWork(B,`N',stat)
#endprocedure

