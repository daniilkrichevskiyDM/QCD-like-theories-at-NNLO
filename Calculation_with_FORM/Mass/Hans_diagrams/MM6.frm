* the double tadpoles diagram
*
*  MM6:
*           _ PP
*          / \
*          \ /
*           q
*       RR / \ QQ
*          \ /
*  ---------p--------
*   ext1       ext2
*   p1ext      p2ext
*   <--        -->
*
#include symbols.hf
#include setexternal.hf

load save/Lagrangians/vertex4Mp2`SX4'.sav;

L Vtop = 
 vertex4Mp2`SX4'
 ;

L Vbot = 
 vertex4Mp2`SX4'
 ;

.sort
skip; nskip Vbot;
#call setmom(p,4)
#include takederiv.hf
.sort
skip; nskip Vtop;
#call setmom(q,4)
#include takederiv.hf
.sort
#call pickout(`ext1',p1ext,p,pp,4,Vbot)
#call pickout(`ext2',p2ext,p,pp,3,Vbot)
.sort
drop Vbot,Vtop;
G MM6x`ext1'`ext2'`SX4'Hans = i_^7*Vbot*Vtop;

#call connectvertex(QQ,p,pp,2,q,qq,4,MM6x`ext1'`ext2'`SX4'Hans)
#call connectvertex(RR,p,pp,1,q,qq,3,MM6x`ext1'`ext2'`SX4'Hans)
#call connectbubble(PP,q,qq,2,MM6x`ext1'`ext2'`SX4'Hans)
multiply 1/2;* SYMMETRY FACTOR
.sort
#include setprop.hf
.sort
#call dointB0(QQ,RR)
#call dointA(PP)
.sort
id p2ext = -p1ext;
*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s;
.store
save save/MM6_`ext1'`ext2'`SX4'.sav 
   MM6x`ext1'`ext2'`SX4'Hans;
.end
