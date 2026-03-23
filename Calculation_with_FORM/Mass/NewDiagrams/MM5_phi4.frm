*diagram MM5 from 2 4-point LO interactions
*                             
*              / \ RR             
*              \ /              
*               x             
*              / \ PP              
*              \ /              
*  -------------x--------------------
* ext1                         ext2
* p1ext                        p2ext
* <---                           --->
*                                    

Off Statistics;

#include symbols.hf

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

load phi4_Theory.sav;




*we now create two copies of the same vertex
G MM5x`ext1'`ext2'`SX4'Upper = phi4Theory;
G MM5x`ext1'`ext2'`SX4'Lower = phi4Theory;


.sort


*there are 4 fields in the Lagrangian! We probbaly want to use different letters...
skip; 
nskip MM5x`ext1'`ext2'`SX4'Upper;
#call setmom(q,4)
.sort

skip; 
nskip MM5x`ext1'`ext2'`SX4'Lower;
#call setmom(p,4)
.sort 


#include takederiv.hf


.sort

*1) lets take the upper vertex and close the loop. We do not have to 
*skip another vertex because connectbubble.prc skips itself
#call connectbubble(QQ,q,qq,4,MM5x`ext1'`ext2'`SX4'Upper)



*2) Now we do 2 pickouts for the lower diagram 
#call pickout(`ext1',p1ext,p,pp,4,MM5x`ext1'`ext2'`SX4'Lower)
#call pickout(`ext2',p2ext,p,pp,3,MM5x`ext1'`ext2'`SX4'Lower)



*3) Now we have to connect the diagrams 
*First, we multiply the diagrams



G product =  MM5x`ext1'`ext2'`SX4'Upper *  MM5x`ext1'`ext2'`SX4'Lower;



.sort
#call connectvertex(RR,p,pp,2,q,qq,2, product)
#call connectvertex(PP,p,pp,2,q,qq,2, product)


*4) now we do the integrals

#include setprop.hf

Print;
.end
