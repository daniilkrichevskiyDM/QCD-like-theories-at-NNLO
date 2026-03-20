*diagram MM8 from 2 4-point LO interactions
*               RR                  
*            ________               
*           /  PP    \              
*  ---------x---------x-----------  
* ext1      \________/     ext2     
* p1ext        QQ          p2ext    
* <---                       --->   
*                                   

Off Statistics;

#include symbols.hf
#include setexternal.hf  

*#define ext1 "1"
*#define ext2 "1"
*#define SX4 "SP4"

*we just take the LO 4-point diagram
#define diagram "4Mp2" 



load ../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagram'`SX4'.sav;

*2 vertices, 3 propagators, 2 integrals
G ComplexUnitFactor = i_^2 * i_^3 * i_^2;  

*we now create two copies of the same vertex
G MM8x`ext1'`ext2'`SX4'`diagram'Left = vertex`diagram'`SX4';
G MM8x`ext1'`ext2'`SX4'`diagram'Right = vertex`diagram'`SX4';

.sort


*there are 4 fields in the Lagrangian! We want to use different letters for momenta
skip; 
nskip MM8x`ext1'`ext2'`SX4'`diagram'Left;
#call setmom(p,4)
#include takederiv.hf
.sort

skip; 
nskip MM8x`ext1'`ext2'`SX4'`diagram'Right;
#call setmom(q,4)
#include takederiv.hf
.sort 



*1) Now we do 2 pickouts for Left and Right diagrams
#call pickout(`ext1',p1ext,p,pp,4,MM8x`ext1'`ext2'`SX4'`diagram'Left)
#call pickout(`ext2',p2ext,q,qq,4,MM8x`ext1'`ext2'`SX4'`diagram'Right)
.sort

*2) Now we do connect vertices
G product = SymmetryFactorMass8 * ComplexUnitFactor * MM8x`ext1'`ext2'`SX4'`diagram'Left *  MM8x`ext1'`ext2'`SX4'`diagram'Right;
.sort
#call connectvertex(PP,p,pp,3,q,qq,3, product)
#call connectvertex(QQ,p,pp,2,q,qq,2, product)
#call connectvertex(RR,p,pp,1,q,qq,1, product)

*3) Now we do the integrals

.sort

#include setprop.hf
.sort
#call dointH(PP,QQ,RR,p2ext,product)
.sort


*4) final refinements and save

G MM8x`ext1'`ext2'`SX4' = product;

#include SymmetryFactorsMass.hf

.sort



id p2ext = -p1ext;
.sort
argument;
id p2ext = -p1ext;
endargument;

b i_,F,A,B, H;
print +s;

.store
save save/MM8_`ext1'`ext2'`SX4'.sav 
   MM8x`ext1'`ext2'`SX4';

.end



