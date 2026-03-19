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

Off Statistics;

#include symbols.hf
#include setexternal.hf
#include setdiagram.hf  

*basically this is not a diagram but rather a vertex (just terms from Lagrangian)

load /Users/daniilkrichevskiy/Desktop/QCD-like-theories-at-NNLO/Calculation_with_FORM/Expanded_Lagrangians/Saved_Lagrangians/vertex`diagram'`SX4'.sav;



G MM3x`ext1'`ext2'`SX4'`diagram' = i_^3*(
 vertex`diagram'`SX4'
 );
 
#call setmom(p,4)
#include takederiv.hf

.sort
#call pickout(`ext1',p1ext,p,pp,4,MM3x`ext1'`ext2'`SX4'`diagram')
#call pickout(`ext2',p2ext,p,pp,3,MM3x`ext1'`ext2'`SX4'`diagram')

.sort

#call connectbubble(PP,p,pp,4,MM3x`ext1'`ext2'`SX4'`diagram')

#include setprop.hf

.sort
#call dointA(PP)

.sort
id p2ext = -p1ext;
*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s;
.store
save save/MM3_`ext1'`ext2'`SX4'`diagram'.sav 
   MM3x`ext1'`ext2'`SX4'`diagram';
.end
