Off statistics;

cfunction LOmass,Ab, Bb,B1b,B21b,spi,B22b,B31b,B32b,m1,m2,m3,m4,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol P2, aux1, n, L;

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





id p1ext.p1ext = P2;
argument;
id p1ext.p1ext = P2;
endargument;

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

*now we take derivative of sigma4
G DerSigma4 = Sigma4;

#call derivative(DerSigma4,P2)

.sort


G NNLOmass = - Sigma6 + Sigma4*DerSigma4;

*we now set the p^2 to the LO mass
id P2 = LOmass(`ext1');
argument;
id P2 = LOmass(`ext1');
endargument;

#include setLOmass.hf

*consider degenerate case 
id muu = mp2;
id mdd = mp2;
argument;
id muu = mp2;
id mdd = mp2;
endargument;

.sort
*we now consider  the \eps dependense and renormalization

#include Gammas.hf
.sort
#call HtoHb.hf
#include AtoAb.hf
#include BtoBb.hf

id Bb(mp2?) = - pi16 + Ab(mp2)/mp2;

.sort

#do indexLECs = 0, 10
id L`indexLECs' = - Gamma`indexLECs'*pi16/(2*eps) + ( Lr`indexLECs'  - Gamma`indexLECs'*pi16*log4pi/2 + Gamma`indexLECs'*pi16*logmu)
 + eps*(-2*Lr`indexLECs'*(-1/2*log4pi+logmu)- Gamma`indexLECs'*(-log4pi/2+logmu)^2) ;
#enddo

.sort



id epsb^(-1) = 1/eps + log4pi;
id Ab(mp2?) = L - 2*mp2*pi16*logmu;

.sort
id eps^n?{1,2,3,4} = 0;
.sort
id dim^-1= 1/4;

.sort
b F,mp2, eps, L;



Print NLOmass,  NNLOmass ;
*id B(mp2,mp2,0) = - pi16 + A(mp2)/mp2;
*id H(mp2,mp2,mp2,mp2) = lambda1*mp2*(5/4*pi16^2 - 3*L*pi16)+3/2*lambda2*mp2*pi16^2+mp2*(3*L^2-5/2*L*pi16+1/4*pi^2*pi16^2+15/8*pi16^2);
*id H21(mp2,mp2,mp2,mp2) = lambda1*mp2*(11/72*pi16^2 - 2/3*L*pi16)+1/3*lambda2*mp2*pi16^2+mp2*(-11/36*L*pi16 + 1/18*pi^2*pi16^2+493/864*pi16^2);
*id H22(mp2,mp2,mp2,mp2) = lambda1*mp2^2*(157/288*pi16^2 - 13/12*L*pi16)+13/24*lambda2*mp2^2*pi16^2+mp2^2*(-157/144*L*pi16 + 13*4/12*L^2 +13/144 *pi^2 *pi16^2+2933/3456*pi16^2);



.end



.sort

Print 

b A,B,H, H21, H22, F, mp2, pi16;

Print NLOmass, NNLOmass;
.end