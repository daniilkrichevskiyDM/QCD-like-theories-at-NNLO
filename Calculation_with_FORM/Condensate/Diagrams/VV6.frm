*diagram VV6
Off statistics;

*
*        /\    
*        \/    
* - - -  x     
* ext1   /\    
* p1ext  \/    
*              
*   <--        

#include symbols.hf
#include setexternal.hf
#define diagram "S4Mp2"

*#define ext1 "1"
*#define SX4 "SP4"

load ../../Expanded_Lagrangians/Saved_Lagrangians_with_Scalar_source/vertex`diagram'`SX4'.sav;

G VV6x`ext1'`SX4' =  i_^5*SymmetryFactorCondensate6*(
  vertex`diagram'`SX4'
 );

.sort

#call setmom(p,6)
.sort
#include takederiv.hf


.sort
#call pickoutS(`ext1',p1ext,p,pp,1,VV6x`ext1'`SX4')
.sort


#call connectbubble(PP,p,pp,4,VV6x`ext1'`SX4')
#call connectbubble(RR,p,pp,4,VV6x`ext1'`SX4')

#include setprop.hf

.sort
#call dointA(PP)
#call dointA(RR)
.sort

id sqrt2^-1 = sqrt2/2;
#include SymmetryFactorsCondensate.hf

.sort
*b means bracket
b A,F,i_,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,H1,H2,sqrt2;
Print VV6x`ext1'`SX4';


.store
save save/VV6_`ext1'`SX4'.sav 
   VV6x`ext1'`SX4';
.end