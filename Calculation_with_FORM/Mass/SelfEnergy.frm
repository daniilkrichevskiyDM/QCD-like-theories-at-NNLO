Off statistics;

cfunction LOmass;
symbol P2, aux1, n;

#include symbols.hf
#include setexternal.hf

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"



load NewDiagrams/save/MM1_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM2_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM3_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM4_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM5_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM6_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM7_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM8_`ext1'`ext2'`SX4'.sav;
load NewDiagrams/save/MM9_`ext1'`ext2'`SX4'.sav;

G Diagram1 = MM1x`ext1'`ext2'`SX4';
G Diagram2 = MM2x`ext1'`ext2'`SX4';
G Diagram3 = MM3x`ext1'`ext2'`SX4';
G Diagram4 = MM4x`ext1'`ext2'`SX4';
G Diagram5 = MM5x`ext1'`ext2'`SX4';
G Diagram6 = MM6x`ext1'`ext2'`SX4';
G Diagram7 = MM7x`ext1'`ext2'`SX4';
G Diagram8 = MM8x`ext1'`ext2'`SX4';
G Diagram9 = MM9x`ext1'`ext2'`SX4';

G Sigma4 = (Diagram2 + Diagram3)/i_;
G Sigma6 = (Diagram4 + Diagram5 + Diagram6 + Diagram7 + Diagram8 + Diagram9)/i_;

.sort

id p1ext.p1ext = P2;
id H(?aux1 ,p1ext.p1ext) = H(?aux1,P2);
#include SymmetryFactorsMass.hf

.sort

#procedure derivative(expr,var)
.sort
skip;
nskip `expr';
* derivative of powers
  id `var'^n? = n*`var'^(n-1);
.sort
#endprocedure

G NLOmass = - Sigma4;

*no we take derivative of sigma4
G DerSigma4 = Sigma4;
#call derivative(DerSigma4,P2)

G NNLOmass = - Sigma6 + Sigma4*DerSigma4;

id P2 = LOmass(`ext1');
id H(?aux1,P2) = H(?aux1,LOmass(`ext1'));

.sort



Print NLOmass, NNLOmass;
.end