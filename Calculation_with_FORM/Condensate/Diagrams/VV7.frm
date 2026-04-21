*diagram VV7
Off statistics;

*         x    
*        /\    
*        \/    
* - - -  o     
* ext1         
* p1ext        
*              
*   <--        

#include symbols.hf
#include setexternal.hf


#define diagramLower "S2Mp2" 
#define diagramUpper "2Mp4" 

*#define ext1 "1"
*#define SX4 "SP4"

load ../../Expanded_Lagrangians/Saved_Lagrangians_with_Scalar_source/vertex`diagramLower'`SX4'.sav;
load ../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagramUpper'`SX4'.sav;

G ComplexUnitFactor = i_^2 * i_^2 * i_^1;  


*we now create two copies of the same vertex
G VV7x`ext1'`SX4'`diagramUpper' = vertex`diagramUpper'`SX4';
G VV7x`ext1'`SX4'`diagramLower' = vertex`diagramLower'`SX4';
.sort

* 2 fields in the upper one
skip; 
nskip VV7x`ext1'`SX4'`diagramUpper';
#call setmom(q,2)
.sort

* 4 fields in the lower one
skip; 
nskip VV7x`ext1'`SX4'`diagramLower';
#call setmom(p,4)
.sort


* We want to use different letters...
* 2 fields in the upper one
skip; 
nskip VV7x`ext1'`SX4'`diagramUpper';
#call setmom(q,2)
.sort

#include takederiv.hf
.sort

*1) Now we do 2 pickouts for the lower diagram 
#call pickoutS(`ext1',p1ext,p,pp,4,VV7x`ext1'`SX4'`diagramLower')

*2)Now we have to connect the diagrams 
*First, we multiply the diagrams

G product = SymmetryFactorCondensate7 * ComplexUnitFactor * VV7x`ext1'`SX4'`diagramUpper' * VV7x`ext1'`SX4'`diagramLower';

.sort
#call connectvertex(RR,p,pp,2,q,qq,2, product)
#call connectvertex(PP,p,pp,2,q,qq,2, product)

* 3)now we do the integrals

#include setprop.hf
#call dointB0(RR,PP)


*4) final refinements and save
.sort
G VV7x`ext1'`SX4' = product;

.sort

#include SymmetryFactorsCondensate.hf

b i_,F,A,B;
print +s;

.store
save save/VV7_`ext1'`SX4'.sav 
   VV7x`ext1'`SX4';


.end


********
.sort
print VV7x`ext1'`SX4'`diagramLower';
.end

