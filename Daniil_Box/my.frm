*try here for Sp(4), 2 point vertex from LO Lagrangian (L_2)

#include symbols.hf

*maximal number if elements in the trace:
#define MAXTRACE "10" 

*theory:
#define SX4 "Sp4" 

*vertex
#define VERTEX "2Mp2" 

#procedure Myvertex2Mp2()
(
    + 1/2*tr(M(mu),M(mu))
    - 1/2*tr(Chi,M,M)
)
#endprocedure

G vertex = 
#call Myvertex2Mp2()
;

*counting the number of elements in a trace. 
*It adds a number of elements in the beginning of the trace

* aa is some symbol, which is used to mark the beginning of the trace.
*in symbols.hf we have (a set matrixfields which has Chi and so on );
* we count the number of fields and write down the number of fileds.
id tr(?a)= tr(0,aa,?a); 
repeat;
  id tr(aa1?,?a,aa,M?matrixfields(?b),?c) = tr(aa1+1,?a,M(?b),aa,?c);
  id tr(?a,aa) = tr(?a);
endrepeat;
.sort

*now we can rewrite the trace as a sum over actual indices.

*trace with 0 elements is 4
id tr(0) = 4;  

* put in maximum number of elements in traces here
#do i=1,`MAXTRACE'
id tr(`i',<M1?(?a1)>,...,<M`i'?(?a`i')>) = 
#do j=1,`i'
  sum_(f`j',1,4,
#enddo  
  1
#do j=1,{`i'-1}
   *M`j'(?a`j',f`j',f{`j'+1})
#enddo  
   *M`i'(?a`i',f`i',f1)
#do j=1,`i'
  )
#enddo  
 ;
#enddo
.sort

*just a error in case not all the traces were eliminated;
if (match(tr(?a))) exit "traces left, increase MAXTRACE=`MAXTRACE' happened for vertex`VERTEX'`SX4'";

*now we read the header files with the Lagrangian;
#include setMChi`SX4'.hf


id 1/sqrt2^2 = 1/2;
.sort


Print;
.end


