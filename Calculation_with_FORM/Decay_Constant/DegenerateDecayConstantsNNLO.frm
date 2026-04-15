Off statistics;

symbol Lr0,Lr1,Lr2,Lr3,Lr4,Lr5,Lr6,Lr7,Lr8,Lr9,Lr10,Hr1,Hr2;
cfunction ABar, LOmass, L, log, LOmass,Ab, Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol m1,m2,m3,m4;
symbol P2, aux1, n;
symbol Lambda, lambda0, lambda1, lambda2;
symbol logmu, Lr0;


#include symbols.hf
#include setexternal.hf

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

*firstly, we upload the mass diagrams
load ../Mass/NewDiagrams/save/MM1_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM2_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM3_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM4_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM5_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM6_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM7_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM8_`ext1'`ext2'`SX4'.sav;
load ../Mass/NewDiagrams/save/MM9_`ext1'`ext2'`SX4'.sav;

G DiagramM1 = MM1x`ext1'`ext2'`SX4';
G DiagramM2 = MM2x`ext1'`ext2'`SX4';
G DiagramM3 = MM3x`ext1'`ext2'`SX4';
G DiagramM4 = MM4x`ext1'`ext2'`SX4';
G DiagramM5 = MM5x`ext1'`ext2'`SX4';
G DiagramM6 = MM6x`ext1'`ext2'`SX4';
G DiagramM7 = MM7x`ext1'`ext2'`SX4';
G DiagramM8 = MM8x`ext1'`ext2'`SX4';
G DiagramM9 = MM9x`ext1'`ext2'`SX4';

G Sigma4 = (DiagramM2 + DiagramM3)/i_;
G Sigma6 = (DiagramM4 + DiagramM5 + DiagramM6 + DiagramM7 + DiagramM8 + DiagramM9)/i_;

.sort
*secondly, we upload the decay constant diagrams
load Diagrams/save/FF1_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF2_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF3_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF4_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF5_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF6_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF7_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF8_`ext1'`ext2'`SX4'.sav;
load Diagrams/save/FF9_`ext1'`ext2'`SX4'.sav;


G DiagramF1 = FF1x`ext1'`ext2'`SX4';
G DiagramF2 = FF2x`ext1'`ext2'`SX4';
G DiagramF3 = FF3x`ext1'`ext2'`SX4';
G DiagramF4 = FF4x`ext1'`ext2'`SX4';
G DiagramF5 = FF5x`ext1'`ext2'`SX4';
G DiagramF6 = FF6x`ext1'`ext2'`SX4';
G DiagramF7 = FF7x`ext1'`ext2'`SX4';
G DiagramF8 = FF8x`ext1'`ext2'`SX4';
G DiagramF9 = FF9x`ext1'`ext2'`SX4';

G MpionVectorLO = DiagramF1;
G MpionVectorNLO = DiagramF2 + DiagramF3;
G MpionVectorNNLO = DiagramF4 + DiagramF5 + DiagramF6 + DiagramF7 + DiagramF8 + DiagramF9;


***** Now we calculate all the necessary pieces


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
G LOdecay =  MpionVectorLO;
G NLOdecay =  MpionVectorNLO - 1/2*MpionVectorLO*DerSigma4;
.sort



*we now set the p^2 to the LO mass
id P2 = LOmass(`ext1');
argument;
id P2 = LOmass(`ext1');
endargument;

#include setLOmass.hf

*DEGENERATE CASE
id muu = mp2;
id mdd = mp2;
argument;
id muu = mp2;
id mdd = mp2;
endargument;

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
id log(mp2?) = L(mp2)/pi16+2*logmu;
id pi^2 = 1/16*1/pi16; 

#do indexLECs = 0, 10
id L`indexLECs' = - Gamma`indexLECs'*pi16/(2*eps) + ( Lr`indexLECs'  + Gamma`indexLECs'*pi16*(- log4pi/2 + logmu))
-1/4*((log4pi-2*logmu)*(-4*Lr`indexLECs'+log4pi*Gamma`indexLECs'*pi16-2*Gamma`indexLECs'*pi16*logmu))*eps;
#enddo

.sort

*lambda0
id epsb^(-1) = 1/eps + log4pi;
*finite part of A
id Ab(mp2?) = -mp2*L(mp2) - 2*mp2*pi16*logmu;

*id KK40 = 1/128*rMT-1/128*(32*KK39 + 768 *KK27 + 192*KK26 + 48*KK25 - 16*KK23 - 256*KK22 - 64*KK21 - 64*KK20- 16*KK19 - 128*KK18 - 32*KK17);

*id rMT = rMTr + gamma2*eps^(-2)+2*gamma1*(log4pi-2*logmu)+2*gamma2*(log4pi-2*logmu)^2
*+1/eps*(gamma1+2*log4pi*gamma2-4*gamma2*logmu);

.sort
id dim^-1 =1/4 + eps/8 + eps^2/16;
.sort
id eps^n?{1,2,3,4} = 0;


id L(mp2?) = - ABar(mp2)/mp2;

*#include GammasNNLO.hf
 
id sqrt2^-2 = 1/2;
id p1ext.Pol1 = 1;

.sort
multiply sqrt2^-1;
id sqrt2^-2 = 1/2;
#include Diagrams/SymmetryFactorsDecayConstant.hf

*G NNLOmassNormalized = NNLOmass*F^4/mp2;
.sort
b F,mp2, eps, ABar, pi16;



Print LOdecay, NLOdecay;
.end

*,  NNLOmassNormalized;

