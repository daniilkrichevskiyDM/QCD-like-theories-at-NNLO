*diagram FF1
Off statistics;
* the tree  PV diagram 
*
*  ---------p~~~~~~~~~~~
*   ext1       ext2
*   p1ext      p2ext
*              Pol1
*   <--        -->

#include symbols.hf
#include setexternal.hf
#define diagram "A1Mp2"

*#define ext1 "1"
*#define ext2 "1"
*#define SX4 "SP4"


load ../../Expanded_Lagrangians/Saved_Lagrangians_with_Vectors/vertex`diagram'`SX4'.sav;

G FF1x`ext1'`ext2'`SX4' =  i_*SymmetryFactorDecay1*(
  vertex`diagram'`SX4'
 );


#call setmom(p,4)
.sort
#call setpol(v,1)
.sort
#include takederiv.hf
.sort



#call pickout(`ext1',p1ext,p,pp,2,FF1x`ext1'`ext2'`SX4')
#call pickoutA(`ext2',p2ext,Pol1,p,pp,v,vvv,2,FF1x`ext1'`ext2'`SX4')

.sort

id sqrt2^-1 = sqrt2/2;




id p2ext = -p1ext;
#include SymmetryFactorsDecayConstant.hf
.sort
*b means bracket
b A,F,i_,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,H1,H2,sqrt2;
Print FF1x`ext1'`ext2'`SX4';



.store
save save/FF1_`ext1'`ext2'`SX4'.sav 
   FF1x`ext1'`ext2'`SX4';
.end

