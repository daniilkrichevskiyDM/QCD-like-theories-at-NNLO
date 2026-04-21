*diagram VV4
Off statistics;

*
*        /\     
*        \/     
* - - -  o      
*   ext1        
*   p1ext       
*               
*   <--         

#include symbols.hf
#include setexternal.hf
#define diagram "S2Mp2"

*#define ext1 "1"
*#define SX4 "SP4"

load ../../Expanded_Lagrangians/Saved_Lagrangians_with_Scalar_source/vertex`diagram'`SX4'.sav;

G VV4x`ext1'`SX4' =  i_^3*SymmetryFactorCondensate4*(
  vertex`diagram'`SX4'
 );

.sort


#call setmom(p,4)
.sort


.sort
#include takederiv.hf


.sort

#call pickoutS(`ext1',p1ext,p,pp,2,VV4x`ext1'`SX4')
.sort

#call connectbubble(PP,p,pp,4,VV4x`ext1'`SX4')
#include setprop.hf

.sort
#call dointA(PP)

.sort

id sqrt2^-1 = sqrt2/2;
#include SymmetryFactorsCondensate.hf

.sort
*b means bracket
b A,F,i_,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,H1,H2,sqrt2;
Print VV4x`ext1'`SX4';


.store
save save/VV4_`ext1'`SX4'.sav 
   VV4x`ext1'`SX4';
.end