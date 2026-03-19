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
#include setexternal.hf




*#define ext1 "1"
*#define ext2 "1"
*#define SX4 "SP4"

#define diagram "4Mp2" 
*we take here the 4-point  LO (p^2) Lagrangian  


load ../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagram'`SX4'.sav;

*2 vertices, 3 propagators, 2 integrals
G ComplexUnitFactor = i_^2 * i_^3 * i_^2;  



*we now create two copies of the same vertex
G MM5x`ext1'`ext2'`SX4'Upper = vertex`diagram'`SX4';
G MM5x`ext1'`ext2'`SX4'Lower = vertex`diagram'`SX4';

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



G product = SymmetryFactorMass5 * ComplexUnitFactor * MM5x`ext1'`ext2'`SX4'Upper *  MM5x`ext1'`ext2'`SX4'Lower;



.sort
#call connectvertex(RR,p,pp,2,q,qq,2, product)
#call connectvertex(PP,p,pp,2,q,qq,2, product)



*4) now we do the integrals

#include setprop.hf



#call dointA(QQ)
#call dointB0(RR,PP)
.sort

*5) final refinements and save

G MM5x`ext1'`ext2'`SX4' = product;

id p2ext = -p1ext;
b i_,F,A,B;
print +s;

.store
save save/MM5_`ext1'`ext2'`SX4'.sav 
   MM5x`ext1'`ext2'`SX4';

.end