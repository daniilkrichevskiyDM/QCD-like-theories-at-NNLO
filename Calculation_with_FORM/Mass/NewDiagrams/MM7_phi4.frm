* tadpole diagram MM7
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

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

load phi4_Theory.sav;



G MM7x`ext1'`ext2'`SX4' = phi4Theory;
 
#call setmom(p,4)
#include takederiv.hf

.sort
#call pickout(`ext1',p1ext,p,pp,4,MM7x`ext1'`ext2'`SX4')
#call pickout(`ext2',p2ext,p,pp,3,MM7x`ext1'`ext2'`SX4')

.sort

#call connectbubble(PP,p,pp,4,MM7x`ext1'`ext2'`SX4')

#include setprop.hf

.sort
#call dointA(PP)

Print;
.end
