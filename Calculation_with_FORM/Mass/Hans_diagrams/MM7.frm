* the MM7 diagram
*           _
*          / \ PP
*          \ /
* ----------x---------
*  ext1    / \   ext2
*  p1ext   \_/   p2ext
*  <--     QQ    -->
*

#include symbols.hf
#include setexternal.hf

load save/Lagrangians/vertex6Mp2`SX4'.sav;

G MM7x`ext1'`ext2'`SX4'Hans = i_^5*(
 vertex6Mp2`SX4'
 );
#call setmom(p,6)
#include takederiv.hf
.sort
#call pickout(`ext1',p1ext,p,pp,6,MM7x`ext1'`ext2'`SX4'Hans)
#call pickout(`ext2',p2ext,p,pp,5,MM7x`ext1'`ext2'`SX4'Hans)
.sort
#call connectbubble(PP,p,pp,4,MM7x`ext1'`ext2'`SX4'Hans)
#call connectbubble(QQ,p,pp,2,MM7x`ext1'`ext2'`SX4'Hans)
multiply 1/2;* SYMMETRY FACTOR
.sort
#include setprop.hf
.sort
#call dointA(PP)
#call dointA(QQ)
.sort
id p2ext = -p1ext;
*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s;
.store
save save/MM7_`ext1'`ext2'`SX4'.sav 
   MM7x`ext1'`ext2'`SX4'Hans;
.end

