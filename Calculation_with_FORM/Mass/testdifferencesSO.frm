
#include symbols.hf

Off statistics;

cfunction ABar, LOmass,Ab, L,  Bb,B1b,B21b,SOi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol m1,m2,m3,m4;
symbol P2, aux1, n, QuarkMassRatio, RatioR;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, rM0r,rM1r,rM2r, rM0,rM1,rM2;

load save/Mass_1SO4.sav;
load save/Mass_2SO4.sav;
load save/Mass_3SO4.sav;
load save/Mass_4SO4.sav;
load save/Mass_5SO4.sav;
load save/Mass_6SO4.sav;
load save/Mass_7SO4.sav;
load save/Mass_8SO4.sav;
load save/Mass_9SO4.sav;

.sort

G  NLO1SO4 =  NLOmass1SO4;
G  NNLO1SO4 =  NNLOmass1SO4;

G  NLO2SO4 =  NLOmass2SO4;
G  NNLO2SO4= NNLOmass2SO4;

G  NLO3SO4 = NLOmass3SO4;
G  NNLO3SO4= NNLOmass3SO4;

G  NLO4SO4 = NLOmass4SO4;
G  NNLO4SO4= NNLOmass4SO4;

G  NLO5SO4 = NLOmass5SO4;
G  NNLO5SO4=  NNLOmass5SO4;

G  NLO6SO4 = NLOmass6SO4;
G  NNLO6SO4=  NNLOmass6SO4;

G  NLO7SO4 = NLOmass7SO4;
G  NNLO7SO4=  NNLOmass7SO4;

G  NLO8SO4 = NLOmass8SO4;
G  NNLO8SO4=  NNLOmass8SO4;

G  NLO9SO4 = NLOmass9SO4;
G  NNLO9SO4=  NNLOmass9SO4;

G diff1 = NLO3SO4+NNLO3SO4  - (NLO7SO4+NNLO7SO4);


.sort

b F, mp2, eps, ABar, pi16, RatioR;
print diff1;


.end