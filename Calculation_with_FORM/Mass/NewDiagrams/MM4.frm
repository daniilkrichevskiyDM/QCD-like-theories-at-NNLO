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
#include setexternal.hf


*#define ext1 "1"
*#define ext2 "1"
*#define SX4 "SP4"
#define diagram "6Mp2" 
*we take here the 6-point  LO (p^2) Lagrangian  

*basically this is not a diagram but rather a vertex (just terms from Lagrangian)
*do we need any symmetry factors?


load ../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagram'`SX4'.sav;
*we have here i_^5. One i_ is for the i*L_int, two i_ are for 2 propagators and 2 i_ are to compensate 2 1/i_ in the
*definition of A(p^2)

G MM4x`ext1'`ext2'`SX4'= i_^5*SymmetryFactorMass4*(
 vertex`diagram'`SX4'
 );

*there are 6 fields in the Lagrangian!
#call setmom(p,6)
#include takederiv.hf

.sort

* we still do 2 pickouts for the 2 legs. *this is incorrect probably!
#call pickout(`ext1',p1ext,p,pp,6,MM4x`ext1'`ext2'`SX4')
#call pickout(`ext2',p2ext,p,pp,5,MM4x`ext1'`ext2'`SX4')



*we close the loop twice, with PP and RR momenta

*do I use the same p and pp? Probbaly yes, this should match the letters of momenta in the lagrangian
#call connectbubble(PP,p,pp,6,MM4x`ext1'`ext2'`SX4')
#call connectbubble(RR,p,pp,6,MM4x`ext1'`ext2'`SX4')

#include setprop.hf

.sort
#call dointA(PP)
#call dointA(RR)

.sort


id p2ext = -p1ext;
#include SymmetryFactorsMass.hf
*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s;


.store
save save/MM4_`ext1'`ext2'`SX4'.sav 
   MM4x`ext1'`ext2'`SX4';

.end
