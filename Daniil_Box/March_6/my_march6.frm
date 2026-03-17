* the tree propagator PP current
*
*  ---------p--------
*   ext1       ext2
*   p1ext      p2ext
*   <--        -->

Off statistics;

#include symbols.hf

#include setexternal.hf

*#message `SX4';

*load /Users/daniilkrichevskiy/Desktop/QCD-like-theories-at-NNLO/Daniil_Box/save/vertex2Mp2SP4.sav;


load /Users/daniilkrichevskiy/Desktop/QCD-like-theories-at-NNLO/Calculation_with_FORM/Expanded_Lagrangians/Saved_Lagrangians/vertex2Mp2SP4.sav

*Local vertex2Mp2`SX4' = vertex2Mp2Sp4;

.sort

Global MM1x`ext1'`ext2'`SX4' =  i_*(vertex2Mp2`SX4');

*Print MM1x`ext1'`ext2'`SX4';
*this is now called MM1x11SP4

.sort
**********
#call setmom(p,4) 
*this is a procedure which takes a term and adds a momentum label p1,p2...
* to each field, e.g. phi(mu,1)*phi(mu,1) -> phi(mu,1,p1)*phi(mu,1,p2)
.sort
*Print MM1x`ext1'`ext2'`SX4';
*.sort
********

*some header file
#include takederiv.hf



.sort


*now its time for the pickout

#call pickout(`ext1',p1ext,p,pp,2,MM1x`ext1'`ext2'`SX4')
#call pickout(`ext2',p2ext,p,pp,2,MM1x`ext1'`ext2'`SX4')
id p2ext = -p1ext;
.sort

Print;

.end
