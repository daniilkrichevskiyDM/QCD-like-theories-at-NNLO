*diagram MM1

* the tree propagator PP current
*
*  ---------p--------
*   ext1       ext2
*   p1ext      p2ext
*   <--        -->
*
#include symbols.hf
#include setexternal.hf
#define diagram "2Mp2"

*#define ext1 "1"
*#define ext2 "1"
*#define SX4 "SP4"


load ../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagram'`SX4'.sav;

G MM1x`ext1'`ext2'`SX4' =  i_*SymmetryFactorMass1*(
  vertex`diagram'`SX4'
 );

 
#call setmom(p,4)
.sort

#include takederiv.hf
.sort

#call pickout(`ext1',p1ext,p,pp,2, MM1x`ext1'`ext2'`SX4')
#call pickout(`ext2',p2ext,p,pp,2, MM1x`ext1'`ext2'`SX4')
id p2ext = -p1ext;
#include SymmetryFactorsMass.hf
.sort
*b means bracket
b A,F,i_,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,H1,H2,sqrt2;
Print MM1x`ext1'`ext2'`SX4';
.store
save save/MM1_`ext1'`ext2'`SX4'.sav 
   MM1x`ext1'`ext2'`SX4';
.end

