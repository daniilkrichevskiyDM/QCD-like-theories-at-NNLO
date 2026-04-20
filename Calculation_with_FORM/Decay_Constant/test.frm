Off statistics;
#include symbols.hf

symbol Lr0,Lr1,Lr2,Lr3,Lr4,Lr5,Lr6,Lr7,Lr8,Lr9,Lr10,Hr1,Hr2;
cfunction ABar, LOmass, L, log, LOmass,Ab, Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd, H22d;
symbol m1,m2,m3,m4;
symbol P2, aux1, n;
symbol Lambda, lambda0, lambda1, lambda2;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, gamma13, gamma23,gamma14, gamma24;
symbol logmu;
symbol RatioR;
symbol RbarM,RbarP;
symbol rF0r,rF1r,rF2r,rF3r,rF4r, rF0, rF1, rF2, rF3, rF4;


L Dec1 =  + F^-3*mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 )

       + F^-3*mp2^2*pi16 * (  - 16*Lr8 - 4*Lr8*RatioR^2 - 16*Lr7*RatioR^2 - 64
         *Lr6 + 8*Lr5 + 32*Lr4 - 1/2*Lr3 - 6*Lr2 - 2*Lr1 - 5/2*Lr0 )

       + F^-3*mp2^2*pi16^2 * (  - 5/96 )

       + ABar(mp2)*F^-3*mp2 * ( 16*Lr8 + 4*Lr8*RatioR^2 + 16*Lr7*RatioR^2 + 64
         *Lr6 - 7*Lr5 - 28*Lr4 - 11*Lr3 - 20*Lr2 - 44*Lr1 + Lr0 )

       + ABar(mp2)*F^-3*mp2*pi16 * (  - 43/96 )

       + ABar(mp2)^2*F^-3 * (  - 11/8 );

L Dec2 = F^-3*mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 )

       + F^-3*mp2^2*pi16 * (  - 16*Lr8 - 4*Lr8*RatioR^2 - 16*Lr7*RatioR^2 - 64
         *Lr6 + 8*Lr5 + 32*Lr4 - 1/2*Lr3 - 6*Lr2 - 2*Lr1 - 5/2*Lr0 )

       + F^-3*mp2^2*pi16^2 * (  - 5/96 )

       + ABar(mp2)*F^-3*mp2 * ( 16*Lr8 + 4*Lr8*RatioR^2 + 16*Lr7*RatioR^2 + 64
         *Lr6 - 7*Lr5 - 28*Lr4 - 11*Lr3 - 20*Lr2 - 44*Lr1 + Lr0 )

       + ABar(mp2)*F^-3*mp2*pi16 * (  - 43/96 )

       + ABar(mp2)^2*F^-3 * (  - 11/8 );

L Dec3 =    + F^-3*mp2^2 * ( rF1r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 )

       + F^-3*mp2^2*pi16 * (  - 16*Lr8 - 64*Lr6 + 8*Lr5 + 32*Lr4 - 1/2*Lr3 - 6
         *Lr2 - 2*Lr1 - 5/2*Lr0 )

       + F^-3*mp2^2*pi16^2 * (  - 5/96 )

       + ABar(mp2)*F^-3*mp2 * ( 16*Lr8 + 64*Lr6 - 7*Lr5 - 28*Lr4 - 11*Lr3 - 20
         *Lr2 - 44*Lr1 + Lr0 )

       + ABar(mp2)*F^-3*mp2*pi16 * (  - 43/96 )

       + ABar(mp2)^2*F^-3 * (  - 11/8 );

L Dec4 = + F^-3*mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 )

       + F^-3*mp2^2*pi16 * (  - 16*Lr8 - 4*Lr8*RatioR^2 - 16*Lr7*RatioR^2 - 64
         *Lr6 + 8*Lr5 + 32*Lr4 - 1/2*Lr3 - 6*Lr2 - 2*Lr1 - 5/2*Lr0 )

       + F^-3*mp2^2*pi16^2 * (  - 5/96 )

       + ABar(mp2)*F^-3*mp2 * ( 16*Lr8 + 4*Lr8*RatioR^2 + 16*Lr7*RatioR^2 + 64
         *Lr6 - 7*Lr5 - 28*Lr4 - 11*Lr3 - 20*Lr2 - 44*Lr1 + Lr0 )

       + ABar(mp2)*F^-3*mp2*pi16 * (  - 43/96 )

       + ABar(mp2)^2*F^-3 * (  - 11/8 );

L Dec5 = + F^-3*mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 )

       + F^-3*mp2^2*pi16 * (  - 16*Lr8 - 4*Lr8*RatioR^2 - 16*Lr7*RatioR^2 - 64
         *Lr6 + 8*Lr5 + 32*Lr4 - 1/2*Lr3 - 6*Lr2 - 2*Lr1 - 5/2*Lr0 )

       + F^-3*mp2^2*pi16^2 * (  - 5/96 )

       + ABar(mp2)*F^-3*mp2 * ( 16*Lr8 + 4*Lr8*RatioR^2 + 16*Lr7*RatioR^2 + 64
         *Lr6 - 7*Lr5 - 28*Lr4 - 11*Lr3 - 20*Lr2 - 44*Lr1 + Lr0 )

       + ABar(mp2)*F^-3*mp2*pi16 * (  - 43/96 )

       + ABar(mp2)^2*F^-3 * (  - 11/8 ); 

.sort

L diff = Dec1 - Dec3;
b F,mp2, eps, ABar, pi16;
print diff;

.end