* makes the full vertices in terms of the phi fields
*Daniil: this code gets rid of traces from the Lagrangian
#include symbols.hf

#define MAXTRACE "10"

* we comment this on if use the bash file

* choose your vertex
* SP4 or SO4

*we comment this out if use the bash file

*choose e.g. for Sp4
*#define SX4 "SP4" 

* type of vertex, choose e.g. 2Mp2
*#define VERTEX "2Mp2" 


*Global expression for the terms in the Lagrangian. *Here we call the procedure file; 
*These procedures do not have any arguments

#include Lagrangians/vertex`VERTEX'.prc
G vertex`VERTEX'`SX4' = 
#call vertex`VERTEX'
 ;

*counting the number of elements in a trace
*in symbols.hf we have (a set matrixfields which has Chi and so on ) ;
id tr(?a)= tr(0,aa,?a);
repeat;
  id tr(aa1?,?a,aa,M?matrixfields(?b),?c) = tr(aa1+1,?a,M(?b),aa,?c);
  id tr(?a,aa) = tr(?a);
endrepeat;
.sort
**********************************************************************************************************
* testing code now commented out
**********************************************************************************************************
* L V2 = V`VERTEX';
* .sort
* hide V1;
* .sort
* * brute force, could probably be done smarter
* id tr(0) = 4;
* id tr(1,M1?(?a)) = sum_(f1,1,4,M(?a,f1,f1));
* id tr(2,M1?(?a1),M2?(?a2)) = sum_(f1,1,4,sum_(f2,1,4,M1(?a1,f1,f2)*M2(?a2,f2,f1)));
* id tr(3,M1?(?a1),M2?(?a2),M3?(?a3)) = sum_(f1,1,4,sum_(f2,1,4,sum_(f3,1,4,
*   M1(?a1,f1,f2)*M2(?a2,f2,f3)*M3(?a3,f3,f1))));
* id tr(4,M1?(?a1),M2?(?a2),M3?(?a3),M4?(?a4)) = sum_(f1,1,4,sum_(f2,1,4,sum_(f3,1,4,sum_(f4,1,4,
*   M1(?a1,f1,f2)*M2(?a2,f2,f3)*M3(?a3,f3,f4)*M4(?a4,f4,f1)))));
* id tr(5,M1?(?a1),M2?(?a2),M3?(?a3),M4?(?a4),M5?(?a5)) = sum_(f1,1,4,sum_(f2,1,4,sum_(f3,1,4,sum_(f4,1,4,sum_(f5,1,4,
*   M1(?a1,f1,f2)*M2(?a2,f2,f3)*M3(?a3,f3,f4)*M4(?a4,f4,f5)*M5(?a5,f5,f1))))));

* #include setMChiSP4.hf
* .sort
* hide V2;
* .sort
* unhide V`VERTEX';
*.sort
***********************************************************************************************************
* worked out in general for all possible size traces
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

*now we read the header files with the elements of the matrix M. 
*So we get in the end just terms of the expanded Lagrangian  with fields phi.
#include setMChi`SX4'.hf


id 1/sqrt2^2 = 1/2;
.sort

* the testing code
*L V3 = V`VERTEX'-V2;

*Bracket phi i.e. factor Phi
b phi;
print;
.store
save Saved_Lagrangians/vertex`VERTEX'`SX4'.sav vertex`VERTEX'`SX4';
.end