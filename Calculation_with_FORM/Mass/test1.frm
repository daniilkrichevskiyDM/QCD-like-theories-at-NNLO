Off statistics;

cfunction ABar, LOmass,Ab, L,  Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol m1,m2,m3,m4;
symbol P2, aux1, n, QuarkMassRatio, RatioR, rmq;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, rM0r,rM1r,rM2r, rM0,rM1,rM2;

#include symbols.hf
#include setexternal.hf

#define ext1 "3"
#define ext2 "3"
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

*now we take derivative of sigma4
G DerSigma4 = Sigma4;

#call derivative(DerSigma4,P2)

.sort
G NLOmass =  -Sigma4 ; 
G NNLOmass =  -Sigma6 + Sigma4*DerSigma4; 

*we now set the p^2 to the LO mass
id P2 = LOmass(`ext1');
argument;
id P2 = LOmass(`ext1');
endargument;

#include setLOmass.hf

.sort

*we now consider  the \eps dependense and renormalization
#include GammasNLO.hf

.sort
#include HtoHb.hf
.sort
#include BtoBb.hf
#include AtoAb.hf
.sort
#include reduceHbb0.hf

id Bb(mp2,?a) = - pi16 + Ab(mp2)/mp2;
id lambda1 = lambda0  + log4pi;
id lambda2 =  lambda0^2 + log4pi^2;
.sort

id Ab(eps,mp2?) = pi16*mp2*(C^2/2+1/2+pi^2/12+1/2*log(mp2)^2-C*log(mp2));
.sort 
id lambda0 = epsb^(-1);
id C = log4pi;
*id log(mp2) = L(mp2)/pi16+2*logmu;
id  log(mp2?) = -1/pi16*1/mp2*Ab(mp2);
id pi^2 = 1/16*1/pi16; 

#do indexLECs = 0, 10
id L`indexLECs' = - Gamma`indexLECs'*pi16/(2*eps) + ( Lr`indexLECs'  + Gamma`indexLECs'*pi16*(- log4pi/2 + logmu))
-1/4*((log4pi-2*logmu)*(-4*Lr`indexLECs'+log4pi*Gamma`indexLECs'*pi16-2*Gamma`indexLECs'*pi16*logmu))*eps;
#enddo


.sort

*lambda0
id epsb^(-1) = 1/eps + log4pi;
*finite part of A
*id Ab(mp2?) = -mp2*L(mp2) - 2*mp2*pi16*logmu;



.sort
id dim^-1 =1/4 + eps/8 + eps^2/16;
.sort
*id eps^n?{1,2,3,4} = 0;

id logmu = 0;


*id L(mp2?) = - ABar(mp2)/mp2;

.sort


 
id sqrt2^-2 = 1/2;


.sort

G NLOmassNorm = NLOmass*F^2/mp2;
G NNLOmassNorm = NNLOmass*F^4/mp2;

id mdd = -mp2*(-1 + RatioR);
id muu = mp2*(1 + RatioR);

id RatioR = rmq;


.sort
*CHECK DEGENERATE LIMIT
*id RatioR = 0;

*#include HansM11p6SP4.hf

*L difference = HansM33p6SP4 - NNLOmass;

.sort
id eps^n?{-1,} = 1/epsb1-2*log4pi;
id eps^n?{-2,} = 1/epsb2+2*(2*log4pi-1/epsb1)*log4pi-2*(log4pi)^2;

.sort
id epsb1^n?{1,2,3,4} = 0;
id epsb2^n?{1,2,3,4} = 0;
id eps^n?{1,2,3,4} = 0;

.sort


.sort
b F, mp2, eps, ABar, pi16, RatioR, epsb1, epsb2;



Print NLOmass,  NNLOmass;
.sort
G NLOmass`ext1'`SX4' = NLOmass;
G NNLOmass`ext1'`SX4' = NNLOmass;

.store
*save save/Mass_`ext1'`SX4'.sav NLOmass`ext1'`SX4',NNLOmass`ext1'`SX4';

.end


