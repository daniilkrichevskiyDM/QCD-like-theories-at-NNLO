#include symbols.hf

#define theory "SO4"
#define pionsindex "99" 


load /Users/daniilkrichevskiy/Desktop/QCD-like-theories-at-NNLO/Calculation_with_FORM/Mass/Diagrams/Without_loops/save/MM1_`pionsindex'`theory'2Mp2.sav;

G aux1 = MM1x`pionsindex'`theory'2Mp2;

Print aux1;
.end