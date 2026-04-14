*diagram FF8 from 2 4-point LO interactions
*               RR                  
*            ________               
*           /  PP    \              
*  ---------x---------x~~~~~~~~~~~~~~ 
* ext1      \________/     ext2     
* p1ext        QQ          p2ext    
*                           Pol1
* <---                       --->   
*                                   

Off Statistics;

#include symbols.hf
#include setexternal.hf  

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

*we just take the LO 4-point diagram
#define diagram1 "4Mp2" 
#define diagram2 "A3Mp2" 



load ../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagram1'`SX4'.sav;
load ../../Expanded_Lagrangians/Saved_Lagrangians_with_Vectors/vertex`diagram2'`SX4'.sav;

*2 vertices, 3 propagators, 2 integrals
G ComplexUnitFactor = i_^2 * i_^3 * i_^2;  

*we now create two copies of the same vertex
G FF8x`ext1'`ext2'`SX4'`diagram1'Left = vertex`diagram1'`SX4';
G FF8x`ext1'`ext2'`SX4'`diagram2'Right = vertex`diagram2'`SX4';

.sort


*there are 4 fields in the Lagrangian! We want to use different letters for momenta
skip; 
nskip FF8x`ext1'`ext2'`SX4'`diagram1'Left;
#call setmom(p,4)
#include takederiv.hf
.sort

skip; 
nskip FF8x`ext1'`ext2'`SX4'`diagram2'Right;
#call setmom(q,4)
#call setpol(v,1)
#include takederiv.hf
.sort 



*1) Now we do 2 pickouts for Left and Right diagrams
#call pickout(`ext1',p1ext,p,pp,4,FF8x`ext1'`ext2'`SX4'`diagram1'Left)
#call pickoutA(`ext2',p2ext,Pol1,q,qq,v,vvv,2,FF8x`ext1'`ext2'`SX4'`diagram2'Right)
.sort

*2) Now we do connect vertices
G product = SymmetryFactorDecay8 * ComplexUnitFactor * FF8x`ext1'`ext2'`SX4'`diagram1'Left *  FF8x`ext1'`ext2'`SX4'`diagram2'Right;
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

G FF8x`ext1'`ext2'`SX4' = product;

#include SymmetryFactorsDecayConstant.hf

.sort



id p2ext = -p1ext;
.sort
argument;
id p2ext = -p1ext;
endargument;

b i_,F,A,B, H;
print +s;

.store
save save/FF8_`ext1'`ext2'`SX4'.sav 
   FF8x`ext1'`ext2'`SX4';

.end



