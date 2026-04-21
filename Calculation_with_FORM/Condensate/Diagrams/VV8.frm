*diagram VV8
Off statistics;


*        /\    
*        \/    
*         o   
*        /\    
*        \/    
* - - - - o     
* ext1         
* p1ext        
*              
*   <--        

#include symbols.hf
#include setexternal.hf


#define diagramLower "S2Mp2" 
#define diagramUpper "4Mp2" 

*#define ext1 "1"
*#define SX4 "SP4"

load ../../Expanded_Lagrangians/Saved_Lagrangians_with_Scalar_source/vertex`diagramLower'`SX4'.sav;
load ../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagramUpper'`SX4'.sav;

*2 vertices, 3 propagators, 2 integrals
G ComplexUnitFactor = i_^2 * i_^3 * i_^2;  


*we now create two copies of the same vertex
G VV8x`ext1'`SX4'Upper = vertex`diagramUpper'`SX4';
G VV8x`ext1'`SX4'Lower = vertex`diagramLower'`SX4';
.sort

skip; 
nskip VV8x`ext1'`SX4'Upper;
#call setmom(q,4)
.sort

skip; 
nskip VV8x`ext1'`SX4'Lower;
#call setmom(p,4)
.sort 

#include takederiv.hf
.sort

*1) lets take the upper vertex and close the loop. We do not have to 
*skip another vertex because connectbubble.prc skips itself
#call connectbubble(QQ,q,qq,4,VV8x`ext1'`SX4'Upper)

*2) Now we do 2 pickouts for the lower diagram 
#call pickoutS(`ext1',p1ext,p,pp,4,VV8x`ext1'`SX4'Lower)


*3) Now we have to connect the diagrams 
*First, we multiply the diagrams

G product = SymmetryFactorCondensate8 * ComplexUnitFactor * VV8x`ext1'`SX4'Upper  *  VV8x`ext1'`SX4'Lower;


.sort
#call connectvertex(RR,p,pp,2,q,qq,2, product)
#call connectvertex(PP,p,pp,2,q,qq,2, product)


*4) now we do the integrals

#include setprop.hf


#call dointA(QQ)
#call dointB0(RR,PP)
.sort



*5) final refinements and save

G VV8x`ext1'`SX4' = product;

#include SymmetryFactorsCondensate.hf


b i_,F,A,B;
print +s VV8x`ext1'`SX4';

.store
save save/VV8_`ext1'`SX4'.sav 
   VV8x`ext1'`SX4';

.end
