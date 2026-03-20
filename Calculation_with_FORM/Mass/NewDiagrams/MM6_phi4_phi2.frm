*diagram MM6 from  4-point LO interaction + 2 - point NLO interaction

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





#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

*the diagrams are always the same
#define diagramLower "4Mp2" 
#define diagramUpper "2Mp4" 

*we take here the 4-point  LO (p^2)   
* and the 2 - point NLO (p^4)

load phi4_Theory.sav;
load phi2_Theory.sav;

*2 vertices, 2 propagators, 1 integrals
 


*we now create two copies of the same vertex
G MM6x`ext1'`ext2'`SX4'`diagramUpper' = phi2Theory;
G MM6x`ext1'`ext2'`SX4'`diagramLower' = phi4Theory;



.sort

* We want to use different letters...
* 2 fields in the upper one
skip; 
nskip MM6x`ext1'`ext2'`SX4'`diagramUpper';
#call setmom(q,2)
.sort

* 4 fields in the lower one
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

G product = MM6x`ext1'`ext2'`SX4'`diagramUpper' *  MM6x`ext1'`ext2'`SX4'`diagramLower';



.sort
#call connectvertex(RR,p,pp,2,q,qq,2, product)
#call connectvertex(PP,p,pp,2,q,qq,2, product)


* 3)now we do the integrals

#include setprop.hf

#call dointB0(RR,PP)

.sort 
Print product;
.end


