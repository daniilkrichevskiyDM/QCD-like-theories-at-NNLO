
#include symbols.hf

Off statistics;

cfunction ABar, LOmass,Ab, L,  Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol m1,m2,m3,m4;
symbol P2, aux1, n, QuarkMassRatio, RatioR;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, rM0r,rM1r,rM2r, rM0,rM1,rM2;

load save/Mass_1SP4.sav;
load save/Mass_2SP4.sav;
load save/Mass_3SP4.sav;
load save/Mass_4SP4.sav;
load save/Mass_5SP4.sav;

.sort

G  NLO1SP4 =  NLOmass1SP4;
G  NNLO1SP4 =  NNLOmass1SP4;

G  NLO2SP4 =  NLOmass2SP4;
G  NNLO2SP4= NNLOmass2SP4;

G  NLO3SP4 = NLOmass3SP4;
G  NNLO3SP4= NNLOmass3SP4;

G  NLO4SP4 = NLOmass4SP4;
G  NNLO4SP4= NNLOmass4SP4;

G  NLO5SP4 = NLOmass5SP4;
G  NNLO5SP4=  NNLOmass5SP4;

G diff1 = NLO1SP4+NNLO1SP4  - (NLO5SP4+NNLO5SP4);


.sort

b F, mp2, eps, ABar, pi16, RatioR;
print diff1;


.end