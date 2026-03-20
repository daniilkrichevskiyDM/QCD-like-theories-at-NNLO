Off Statistics;

#include symbols.hf

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

load phi4_Theory.sav;



*we now create two copies of the same vertex
G MM8x`ext1'`ext2'`SX4'Left =  phi4Theory;
G MM8x`ext1'`ext2'`SX4'Right =  phi4Theory;

.sort


*there are 4 fields in the Lagrangian! We want to use different letters for momenta
skip; 
nskip MM8x`ext1'`ext2'`SX4'Left;
#call setmom(q,4)
.sort

skip; 
nskip MM8x`ext1'`ext2'`SX4'Right;
#call setmom(p,4)
.sort 


#include takederiv.hf


.sort

*1) Now we do 2 pickouts for Left and Right diagrams
#call pickout(`ext1',p1ext,q,qq,4,MM8x`ext1'`ext2'`SX4'Left)
#call pickout(`ext2',p2ext,p,pp,4,MM8x`ext1'`ext2'`SX4'Right)


*2) Now we do connect vertices
G product = MM8x`ext1'`ext2'`SX4'Left *  MM8x`ext1'`ext2'`SX4'Right;
.sort
#call connectvertex(RR,p,pp,3,q,qq,3, product)
#call connectvertex(PP,p,pp,3,q,qq,3, product)
#call connectvertex(QQ,p,pp,3,q,qq,3, product)

*3) Now we do the integrals

#include setprop.hf
.sort
#call dointH(RR,PP,QQ,p2ext,product)
.sort

*4) final refinements and save

G MM8x`ext1'`ext2'`SX4' = product;

Print MM8x`ext1'`ext2'`SX4';

.end




