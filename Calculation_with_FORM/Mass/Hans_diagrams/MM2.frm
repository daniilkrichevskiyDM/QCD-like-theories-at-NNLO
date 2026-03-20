* the tree propagator PP current
*
*  ---------p--------
*   ext1       ext2
*   p1ext      p2ext
*   <--        -->
*
#include symbols.hf

#include setexternal.hf

load save/Lagrangians/vertex2Mp4`SX4'.sav;

G MM2x`ext1'`ext2'`SX4'Hans =  i_*(
  vertex2Mp4`SX4'
 );
#call setmom(p,4)
#include takederiv.hf
.sort
#call pickout(`ext1',p1ext,p,pp,2,MM2x`ext1'`ext2'`SX4'Hans)
#call pickout(`ext2',p2ext,p,pp,2,MM2x`ext1'`ext2'`SX4'Hans)
id p2ext = -p1ext;
.sort
b A,F,i_,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,H1,H2,sqrt2;
print;
.store
save save/MM2_`ext1'`ext2'`SX4'.sav 
   MM2x`ext1'`ext2'`SX4'Hans;
.end

