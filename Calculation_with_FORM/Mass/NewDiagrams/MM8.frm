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

symbol aux1;
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
#call setmom(q,4)
.sort

skip; 
nskip MM8x`ext1'`ext2'`SX4'`diagram'Right;
#call setmom(p,4)
.sort 


#include takederiv.hf
.sort

*1) Now we do 2 pickouts for Left and Right diagrams
#call pickout(`ext1',p1ext,q,qq,4,MM8x`ext1'`ext2'`SX4'`diagram'Left)
#call pickout(`ext2',p2ext,p,pp,4,MM8x`ext1'`ext2'`SX4'`diagram'Right)


*2) Now we do connect vertices
G product = SymmetryFactorMass8 * ComplexUnitFactor * MM8x`ext1'`ext2'`SX4'`diagram'Left *  MM8x`ext1'`ext2'`SX4'`diagram'Right;
.sort
#call connectvertex(RR,p,pp,3,q,qq,3, product)
#call connectvertex(PP,p,pp,3,q,qq,3, product)
#call connectvertex(QQ,p,pp,3,q,qq,3, product)

*3) Now we do the integrals

#include setprop.hf
.sort
#call dointH(RR,PP,QQ,p2ext,product)
.sort

*4) final refinements and save

G MM8x`ext1'`ext2'`SX4' = product;



id p2ext = -p1ext;
.sort
id H(?aux1,p2ext.p2ext) = H(?aux1,p1ext.p1ext);
.sort

b i_,F,A,B, H;
print +s;

.store
save save/MM8_`ext1'`ext2'`SX4'.sav 
   MM8x`ext1'`ext2'`SX4';

.end



