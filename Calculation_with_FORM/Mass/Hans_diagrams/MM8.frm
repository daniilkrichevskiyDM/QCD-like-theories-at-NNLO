* 
*
*
*               PP -->
*             __________
*            /          \
*           /  QQ-->     \
*  --------p--------------q---------
*    ext1   \            /   ext2
*    p1ext   \          /    p2ext
*    <---     \________/     --->
*               RR-->
*
*
*
*
#include symbols.hf
#include setexternal.hf
load save/Lagrangians/vertex4Mp2`SX4'.sav;
L Vleft = 
 vertex4Mp2`SX4'
 ;
L Vright = 
 vertex4Mp2`SX4'
 ;

.sort
skip; nskip Vleft;
#call setmom(p,4)
#include takederiv.hf
.sort
skip; nskip Vright;
#call setmom(q,4)
#include takederiv.hf
.sort
#call pickout(`ext1',p1ext,p,pp,4,Vleft)
#call pickout(`ext2',p2ext,q,qq,4,Vright)
.sort
drop Vleft,Vright;
G MM8x`ext1'`ext2'`SX4'Hans = i_^7*Vleft*Vright;

#call connectvertex(PP,p,pp,3,q,qq,3,MM8x`ext1'`ext2'`SX4'Hans)
#call connectvertex(QQ,p,pp,2,q,qq,2,MM8x`ext1'`ext2'`SX4'Hans)
#call connectvertex(RR,p,pp,1,q,qq,1,MM8x`ext1'`ext2'`SX4'Hans)
multiply 1/6;* SYMMETRY FACTOR
.sort
#include setprop.hf
.sort
#call dointH(PP,QQ,RR,p2ext,MM8x`ext1'`ext2'`SX4'Hans)
.sort
id p2ext = -p1ext;
argument;
  id p2ext = -p1ext;
endargument;
*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s;
.store
save save/MM8_`ext1'`ext2'`SX4'.sav 
   MM8x`ext1'`ext2'`SX4'Hans;
.end
