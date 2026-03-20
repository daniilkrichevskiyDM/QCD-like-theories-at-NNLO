*diagram MM4 from 6-point LO interaction
*               _
*              / \ PP
*              \ /
*  -------------x--------------------
* ext1         / \ RR          ext2
* p1ext        \_/             p2ext
* <---                        --->
*
*

Off Statistics;

#include symbols.hf

#define ext1 "1"
#define ext2 "1"
*#define SX4 "SP4"

load phi6_Theory.sav;

G MM4x`ext1'`ext2' = phi6Theory;

*there are 6 fields in the Lagrangian!
#call setmom(p,6)
#include takederiv.hf


* we still do 2 pickouts for the 2 legs
#call pickout(`ext1',p1ext,p,pp,6,MM4x`ext1'`ext2' )
#call pickout(`ext2',p2ext,p,pp,5,MM4x`ext1'`ext2' )


.sort

*we close the loop twice, with PP and RR momenta

*do I use the same p and pp? Probbaly yes, this should match the letters of momenta in the lagrangian
#define SX4 "SP4"

#call connectbubble(PP,p,pp,6,MM4x`ext1'`ext2' )
#call connectbubble(RR,p,pp,6,MM4x`ext1'`ext2' )



#include setprop.hf



.sort
#call dointA(PP)
#call dointA(RR)

Print;
.end
