*diagram from  4-point LO interaction + 2 - point NLO interaction

*               x             
*           QQ / \ PP              
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

*the diagrams are always the same
#define diagramLower "4Mp2" 
#define diagramUpper "2Mp4" 

*we take here the 4-point  LO (p^2)   
* and the 2 - point NLO (p^4)

load ../../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagramLower'`SX4'.sav;
load ../../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagramUpper'`SX4'.sav;

*2 vertices, 2 propagators, 1 integrals
G ComplexUnitFactor = i_^2 * i_^2 * i_^1;  


* modify it!!!!!
G SymmetryMM6 =1; 


*we now create two copies of the same vertex
G MM6x`ext1'`ext2'`SX4'`diagramUpper' = vertex`diagramUpper'`SX4';
G MM6x`ext1'`ext2'`SX4'`diagramLower' = vertex`diagramLower'`SX4';

.sort

* We want to use different letters...
* 2 fields in the upper one
skip; 
nskip MM6x`ext1'`ext2'`SX4'`diagramUpper';
#call setmom(q,2)
.sort

* 2 fields in the lower one
skip; 
nskip MM6x`ext1'`ext2'`SX4'`diagramLower';
#call setmom(p,4)
.sort



#include takederiv.hf
.sort

*1) Now we do 2 pickouts for the lower diagram 
#call pickout(`ext1',p1ext,p,pp,4,MM6x`ext1'`ext2'`SX4'`diagramLower')
#call pickout(`ext2',p2ext,p,pp,3,MM6x`ext1'`ext2'`SX4'`diagramLower')

*2)Now we have to connect the diagrams 
*First, we multiply the diagrams

G product = SymmetryMM6 * ComplexUnitFactor * MM6x`ext1'`ext2'`SX4'`diagramUpper' *  MM6x`ext1'`ext2'`SX4'`diagramLower';


.sort
#call connectvertex(RR,p,pp,2,q,qq,2, product)
#call connectvertex(PP,p,pp,2,q,qq,2, product)


* 3)now we do the integrals

#include setprop.hf

#call dointB0(RR,PP)

.sort


*4) final refinements and save

G MM6x`ext1'`ext2'`SX4'`diagramLower'`diagramUpper' = product;

id p2ext = -p1ext;
b i_,F,A,B;
print +s;

.store
save save/MM6_`ext1'`ext2'`SX4'.sav 
   MM6x`ext1'`ext2'`SX4'`diagramLower'`diagramUpper';



.end