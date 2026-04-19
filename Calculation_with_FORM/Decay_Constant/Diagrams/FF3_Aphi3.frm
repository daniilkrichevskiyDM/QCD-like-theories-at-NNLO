*diagram FF3
Off statistics;

* tadpole diagram MM3
*               _
*              / \ PP
*              \ /
*  -------------x~~~~~~~~~~~~~~~~~~
* ext1                         ext2
* p1ext                        p2ext
*                              Pol1
* <---                         --->
*

#include symbols.hf
#include setexternal.hf
#define diagram "A3Mp2"

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"


load ../../Expanded_Lagrangians/Aphi3_Theory.sav;

G FF3x`ext1'`ext2'`SX4' =  i_^3*(
  Aphi3Theory
 );


#call setmom(p,4)
.sort
#call setpol(v,1)
.sort
#include takederiv.hf

.sort

#call pickout(`ext1',p1ext,p,pp,4,FF3x`ext1'`ext2'`SX4')
#call pickoutA(`ext2',p2ext,Pol1,p,pp,v,vvv,2,FF3x`ext1'`ext2'`SX4')

.sort
#call connectbubble(PP,p,pp,4,FF3x`ext1'`ext2'`SX4')
#include setprop.hf

.sort
#call dointA(PP)


.sort
id p2ext = -p1ext;

*b F,Chi,p1ext,i_;
b i_,F,A,B;
print +s;

.end



