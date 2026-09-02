Off statistics;

symbol Lr0,Lr1,Lr2,Lr3,Lr4,Lr5,Lr6,Lr7,Lr8,Lr9,Lr10,Hr1,Hr2;
cfunction ABar, LOmass, L, log, LOmass,Ab, Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd, H22d;
symbol m1,m2,m3,m4;
symbol P2, aux1, n;
symbol Lambda, lambda0, lambda1, lambda2;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, gamma13, gamma23,gamma14, gamma24;
symbol logmu;
symbol RatioR;
symbol RbarM,RbarP;
symbol rV0r,rV1r,rV2r,rV3r,rV4r, rV0, rV1, rV2, rV3, rV4;
symbol l2r, l1r, l3r, l4r, h3r, l5r, h3r, l6r, l7r, h1r, h2r;


#include symbols.hf

#define ext1 "2"
#define SX4 "SO4"

*firstly, we upload the condensate diagrams
load Diagrams/save/VV1_`ext1'`SX4'.sav;
load Diagrams/save/VV2_`ext1'`SX4'.sav;
load Diagrams/save/VV3_`ext1'`SX4'.sav;
load Diagrams/save/VV4_`ext1'`SX4'.sav;
load Diagrams/save/VV5_`ext1'`SX4'.sav;
load Diagrams/save/VV6_`ext1'`SX4'.sav;
load Diagrams/save/VV7_`ext1'`SX4'.sav;
load Diagrams/save/VV8_`ext1'`SX4'.sav;


G DiagramV1 = VV1x`ext1'`SX4';
G DiagramV2 = VV2x`ext1'`SX4';
G DiagramV3 = VV3x`ext1'`SX4';
G DiagramV4 = VV4x`ext1'`SX4';
G DiagramV5 = VV5x`ext1'`SX4';
G DiagramV6 = VV6x`ext1'`SX4';
G DiagramV7 = VV7x`ext1'`SX4';
G DiagramV8 = VV8x`ext1'`SX4';
.sort



G CondensateLO = DiagramV1;
G CondensateNLO = DiagramV2 + DiagramV4;
G CondensateNNLO = DiagramV3 + DiagramV5 + DiagramV6 + DiagramV7 + DiagramV8;

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

id Bb(mp2?, mp2?, 0) = - pi16 + Ab(mp2)/mp2;
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

id H2 = - Gamma12*pi16/(2*eps) + ( Hr2  + Gamma12*pi16*(- log4pi/2 + logmu))
-1/4*((log4pi-2*logmu)*(-4*Hr2+log4pi*Gamma12*pi16-2*Gamma12*pi16*logmu))*eps;


.sort

*lambda0
id epsb^(-1) = 1/eps + log4pi;
*finite part of A
id Ab(mp2?) = -mp2*L(mp2) - 2*mp2*pi16*logmu;


#if `SX4'==SP4
id KK27 = (-96* KK25-384 *KK26+2*rV0)/1536;
id KK25 = 1/192*(rV1 - 256*KK26);
.sort
id rV0 = rV0r + gamma20*eps^(-2)+2*gamma10*(log4pi-2*logmu)+2*gamma20*(log4pi-2*logmu)^2
+1/eps*(gamma10+2*log4pi*gamma20-4*gamma20*logmu);

id rV1 = rV1r + gamma21*eps^(-2)+2*gamma11*(log4pi-2*logmu)+2*gamma21*(log4pi-2*logmu)^2+1/eps*(gamma11+2*log4pi*gamma21-4*gamma21*logmu);
#endif


#if `SX4'==SO4

id KK27 = (-96* KK25-384 *KK26+2*rV0)/1536;
id KK25 = 1/192*(rV1 - 256*KK26);

id rV0 = rV0r + gamma20*eps^(-2)+2*gamma10*(log4pi-2*logmu)+2*gamma20*(log4pi-2*logmu)^2
+1/eps*(gamma10+2*log4pi*gamma20-4*gamma20*logmu);

id rV1 = rV1r + gamma21*eps^(-2)+2*gamma11*(log4pi-2*logmu)+2*gamma21*(log4pi-2*logmu)^2+1/eps*(gamma11+2*log4pi*gamma21-4*gamma21*logmu);
#endif

.sort




.sort
id dim^-1 =1/4 + eps/8 + eps^2/16;
.sort
id eps^n?{1,2,3,4} = 0;


id L(mp2?) = - ABar(mp2)/mp2;

#include GammasNNLO.hf
 
.sort
*WHY?
multiply i_;
id sqrt2^-2 = 1/2;

.sort
id mdd = -mp2*(-1 + RatioR);
id muu = mp2*(1 + RatioR);
.sort

id mdd^(-1) = -mp2^(-1)*RbarM;
id muu^(-1) = mp2^(-1)*RbarP;
.sort

repeat;
id RatioR * RbarP = 1 - RbarP;
id RatioR * RbarM = 1 + RbarM;
endrepeat;


*use some symmetries
*The function H is fully symmetric in m21, m22 and m23. Same for the derivative.


.sort

*#include degeneratelimit.hf
.sort
*id logmu = 0;

G CondensateNLONorm =CondensateNLO/( -F^2*B0 * ( 2 ))*F^2;
G CondensateNNLONorm = CondensateNNLO/(- F^2*B0 * ( 2 ))*F^4;

.sort
#if `SX4'==SP4
id Lr2 = l2r-Lr0/2;
id Lr3 = Lr0 + 4*l1r-4*Lr1;
id Lr5 = 4*l3r - 4*Lr4;
id Lr6 = 1/2*(2*l4r-h3r);
id Lr7 = 1/2*(2*l5r-h3r);
id Lr8 = 2*h3r;
id Lr9 = l6r;
id Lr10 = l7r;
id Hr1  = h1r;
id Hr2 = h2r;
#endif
.sort

b F,mp2, eps, ABar, pi16, RatioR, B0;

*b eps;


Print CondensateLO, CondensateNLO ,  CondensateNNLO;
.end