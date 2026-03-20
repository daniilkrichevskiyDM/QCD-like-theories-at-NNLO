* tadpole diagrams 
*               _
*              / \ PP
*              \ /
*  -------------x--------------------
* ext1                         ext2
* p1ext                        p2ext
* <---                         --->
*
*
#include symbols.hf

#include setexternal.hf

load save/Lagrangians/vertex4Mp2`SX4'.sav;

G MM3x`ext1'`ext2'`SX4'Hans = i_^3*(
 vertex4Mp2`SX4'
 );
#call setmom(p,4)
#include takederiv.hf
.sort
#call pickout(`ext1',p1ext,p,pp,4,MM3x`ext1'`ext2'`SX4'Hans)
#call pickout(`ext2',p2ext,p,pp,3,MM3x`ext1'`ext2'`SX4'Hans)
.sort
#call connectbubble(PP,p,pp,4,MM3x`ext1'`ext2'`SX4'Hans)
#include setprop.hf
.sort
#call dointA(PP)
.sort
id p2ext = -p1ext;
*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s;
.store
save save/MM3_`ext1'`ext2'`SX4'.sav 
   MM3x`ext1'`ext2'`SX4'Hans;
.end
