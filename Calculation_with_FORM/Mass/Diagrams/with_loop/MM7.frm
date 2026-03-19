*diagram from 2 4-point LO interactions
*                                   
*            ________               
*           /        \              
*  ---------x---------x-----------  
* ext1      \________/     ext2     
* p1ext                    p2ext    
* <---                       --->   
*                                   

Off Statistics;

#include symbols.hf
#include setexternal.hf
#include setdiagram.hf  

*#define ext1 "1"
*#define ext2 "1"
*#define SX4 "SP4"

*we just take the LO 4-point diagram
#define diagram "4Mp2" 



load ../../../Expanded_Lagrangians/Saved_Lagrangians/vertex`diagram'`SX4'.sav;

*2 vertices, 3 propagators, 2 integrals
G ComplexUnitFactor = i_^2 * i_^3 * i_^2;  

* modify it!!!!!
G SymmetryMM7 =1; 


*we now create two copies of the same vertex
G MM7x`ext1'`ext2'`SX4'`diagram'Left = vertex`diagram'`SX4';
G MM7x`ext1'`ext2'`SX4'`diagram'Right = vertex`diagram'`SX4';

.sort


*there are 4 fields in the Lagrangian! We want to use different letters for momenta
skip; 
nskip MM7x`ext1'`ext2'`SX4'`diagram'Left;
#call setmom(q,4)
.sort

skip; 
nskip MM7x`ext1'`ext2'`SX4'`diagram'Right;
#call setmom(p,4)
.sort 


#include takederiv.hf
.sort

*1) Now we do 2 pickouts for Left and Right diagrams
#call pickout(`ext1',p1ext,q,qq,4,MM7x`ext1'`ext2'`SX4'`diagram'Left)
#call pickout(`ext2',p2ext,p,pp,4,MM7x`ext1'`ext2'`SX4'`diagram'Right)


*2) Now we do connect vertices
G product = SymmetryMM7 * ComplexUnitFactor * MM7x`ext1'`ext2'`SX4'`diagram'Left *  MM7x`ext1'`ext2'`SX4'`diagram'Right;
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

G MM7x`ext1'`ext2'`SX4'`diagram' = product;

id p2ext = -p1ext;
b i_,F,A,B, H;
print +s;

.store
save save/MM7_`ext1'`ext2'`SX4'`diagram'.sav 
   MM7x`ext1'`ext2'`SX4'`diagram';

.end



