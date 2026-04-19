* tadpole diagram FF7
*               _
*              / \ PP
*              \ /
*  -------------x~~~~~~~~~~~~~~~~~~~~~
* ext1                         ext2
* p1ext                        p2ext
*                              Pol1
* <---                         --->
*
*

Off Statistics;

#include symbols.hf
#include setexternal.hf

#define diagram "A3Mp4"

*#define ext1 "1"
*#define ext2 "1"
*#define SX4 "SP4"

load ../../Expanded_Lagrangians/Saved_Lagrangians_with_Vectors/vertex`diagram'`SX4'.sav;



G FF7x`ext1'`ext2'`SX4' = i_^3*SymmetryFactorDecay7*(
 vertex`diagram'`SX4'
 );
 
#call setmom(p,4)
#call setpol(v,1)
#include takederiv.hf

.sort
#call pickout(`ext1',p1ext,p,pp,4,FF7x`ext1'`ext2'`SX4')
#call pickoutA(`ext2',p2ext,Pol1,p,pp,v,vvv,2,FF7x`ext1'`ext2'`SX4')

.sort

#call connectbubble(PP,p,pp,4,FF7x`ext1'`ext2'`SX4')

#include setprop.hf

.sort
#call dointA(PP)

.sort
id p2ext = -p1ext;
#include SymmetryFactorsDecayConstant.hf
*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s FF7x`ext1'`ext2'`SX4';
.store
save save/FF7_`ext1'`ext2'`SX4'.sav 
   FF7x`ext1'`ext2'`SX4';
.end
