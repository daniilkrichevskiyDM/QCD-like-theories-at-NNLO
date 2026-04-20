Off statistics;

cfunction ABar, LOmass,Ab, L,  Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol m1,m2,m3,m4;
symbol P2, aux1, n, QuarkMassRatio, RatioR;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, gamma13, gamma23,gamma14, gamma24;
symbol rM0r,rM1r,rM2r,rM3r ,rM4r,rM5r, rM0,rM1,rM2,rM3,rM4,rM5;
symbol RbarM,RbarP;


#include symbols.hf
#include setexternal.hf

#define ext1 "1"
#define ext2 "1"
#define SX4 "SO4"


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


.sort

*lambda0
id epsb^(-1) = 1/eps + log4pi;
*finite part of A
id Ab(mp2?) = -mp2*L(mp2) - 2*mp2*pi16*logmu;


id KK42 = 1/512*(16* KK19 + 64* KK21 + 16 *KK23 + 64 *KK24 - 144 *KK25 - 192* KK26 - 
   96* KK39 - 128 *KK40 - 256* KK41 + rM2);
.sort

id KK17 = 1/32 *(-128* KK18 - 16 *KK19 - 64 *KK20 - 64 *KK21 - 256 *KK22 - 16* KK23 + 
   48 *KK25 + 192 *KK26 + 768* KK27 + 32* KK39 + 128* KK40 - rM0);

id KK26 = 1/64*(16 *KK19 + 64 *KK21 - 16* KK23 - 48 *KK25 + rM1);

id KK18 = 1/128* (64* KK19 - 64 *KK20 + 128* KK21 - 512 *KK22 - 64* KK23 - 192* KK25 + 
    1536* KK27 + 128* KK40 + rM3);

id KK25 = 1/96 *(32* KK19 - 256* KK22 - 32* KK23 + 768* KK27 - rM4);

.sort


id rM0 = rM0r + gamma20*eps^(-2)+2*gamma10*(log4pi-2*logmu)+2*gamma20*(log4pi-2*logmu)^2
+1/eps*(gamma10+2*log4pi*gamma20-4*gamma20*logmu);

id rM1 = rM1r + gamma21*eps^(-2)+2*gamma11*(log4pi-2*logmu)+2*gamma21*(log4pi-2*logmu)^2
+1/eps*(gamma11+2*log4pi*gamma21-4*gamma21*logmu);

id rM2 = rM2r + gamma22*eps^(-2)+2*gamma12*(log4pi-2*logmu)+2*gamma22*(log4pi-2*logmu)^2
+1/eps*(gamma12+2*log4pi*gamma22-4*gamma22*logmu);

id rM3 = rM3r + gamma23*eps^(-2)+2*gamma13*(log4pi-2*logmu)+2*gamma23*(log4pi-2*logmu)^2
+1/eps*(gamma13+2*log4pi*gamma23-4*gamma23*logmu);

id rM4 = rM4r + gamma24*eps^(-2)+2*gamma14*(log4pi-2*logmu)+2*gamma24*(log4pi-2*logmu)^2
+1/eps*(gamma14+2*log4pi*gamma24-4*gamma24*logmu);



.sort
id dim^-1 =1/4 + eps/8 + eps^2/16;
.sort
id eps^n?{1,2,3,4} = 0;


id L(mp2?) = - ABar(mp2)/mp2;

#include GammasNNLO.hf
.sort
 
id sqrt2^-2 = 1/2;

.sort




G NLOmassNorm = NLOmass*F^2/LOmass(`ext1');
G NNLOmassNorm = NNLOmass*F^4/LOmass(`ext1');
#include setLOmass.hf
.sort

id mdd = -mp2*(-1 + RatioR);
id muu = mp2*(1 + RatioR);

*Intriduce definitions
*RbarM=(-1 + RatioR)^(-1)
*RbarP=(1 + RatioR)^(-1);
id mdd^(-1) = -mp2^(-1)*RbarM;
id muu^(-1) = mp2^(-1)*RbarP;

.sort

repeat;
id RatioR * RbarP = 1 - RbarP;
id RatioR * RbarM = 1 + RbarM;
endrepeat;

*we can pretend that logmu =0 and is defined within the H

.sort
*CHECK DEGENERATE LIMIT
*#include degeneratelimit.hf


*use some symmetries
*The function H is fully symmetric in m21, m22 and m23

id Hbb(muu,mp2,muu,m4?) = Hbb(muu,muu,mp2,m4);
id Hbb(mdd,mp2,mdd,m4?) = Hbb(mdd,mdd,mp2,m4);
id Hbb(mp2,muu,mp2,m4?) = Hbb(muu,mp2,mp2,m4);
id Hbb(mp2,mdd,mp2,m4?) = Hbb(mdd,mp2,mp2,m4);
id Hbb(mp2,mp2,muu,m4?) = Hbb(muu,mp2,mp2,m4);
id Hbb(mp2,mp2,mdd,m4?) = Hbb(mdd,mp2,mp2,m4);
id Hbb(mp2,muu,mdd,m4?) = Hbb(muu,mdd,mp2,m4);
id Hbb(mp2,mdd,muu,m4?) = Hbb(muu,mdd,mp2,m4);
id Hbb(mp2,mdd,mdd,m4?) = Hbb(mdd,mdd,mp2,m4);
id Hbb(mp2,muu,muu,m4?) = Hbb(muu,muu,mp2,m4);

.sort
*H1, H21 and H22 are symmetric under the interchange of m2 and m3
id H21bb(m1?,mp2,muu,m4?) = H21bb(m1,muu,mp2,m4);
id H21bb(m1?,mp2,mdd,m4?) = H21bb(m1,mdd,mp2,m4);
id H21bb(m1?,mdd,muu,m4?) = H21bb(m1,muu,mdd,m4);

id H1bb(m1?,mp2,muu,m4?) = H1bb(m1,muu,mp2,m4);
id H1bb(m1?,mp2,mdd,m4?) = H1bb(m1,mdd,mp2,m4);
id H1bb(m1?,mdd,muu,m4?) = H1bb(m1,muu,mdd,m4);


.sort
b F, mp2, eps, ABar, pi16, RatioR;
*b eps;


Print NLOmassNorm,  NNLOmassNorm;
.sort
G NLOmass`ext1'`SX4' = NLOmass;
G NNLOmass`ext1'`SX4' = NNLOmass;




.store
save save/Mass_`ext1'`SX4'.sav NLOmass`ext1'`SX4',NNLOmass`ext1'`SX4';

.end


