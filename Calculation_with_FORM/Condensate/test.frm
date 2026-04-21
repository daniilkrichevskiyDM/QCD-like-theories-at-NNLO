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

G NNLOdecayNormalized1 =
       + mp2 * (  - 1/4*Hbb(muu,mp2,mp2,muu) - 1/8*Hbb(mdd,mp2,mp2,muu) - 1/8*
         Hbb(mp2,mp2,mp2,muu) )

       + mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 + 5/16*Hdd(muu,mp2,
         mp2,muu) + 1/8*Hdd(mdd,mp2,mp2,muu) + 1/12*Hdd(mp2,mp2,mp2,muu) + 3/8
         *H21dd(mdd,mp2,mp2,muu) + 3/4*H21dd(mp2,muu,mp2,muu) + 3/8*H21dd(mp2,
         mp2,mp2,muu) )

       + mp2^2*pi16 * ( 1/128 - 16*Lr8 - 64*Lr6 + 8*Lr5 + 32*Lr4 - 5/2*Lr3 - 
         10*Lr2 - 2*Lr1 - 9/2*Lr0 )

       + mp2^2*pi16^2 * ( 109/384 )

       + RatioR*mp2 * ( 1/8*Hbb(mdd,mp2,mp2,muu) )

       + RatioR*mp2^2 * ( rF3r - 16*Lr5^2 - 64*Lr4*Lr5 + 3/8*Hdd(muu,mp2,mp2,
         muu) + 1/24*Hdd(mp2,mp2,mp2,muu) + 3/4*H21dd(mdd,mp2,mp2,muu) + 3/2*
         H21dd(mp2,muu,mp2,muu) + 3/4*H21dd(mp2,mp2,mp2,muu) )

       + RatioR*mp2^2*pi16 * (  - 1/768 - 16*Lr8 - 32*Lr6 + 8*Lr5 + 16*Lr4 - 2
         *Lr3 - 2*Lr2 - 4*Lr1 - 4*Lr0 )

       + RatioR*mp2^2*pi16^2 * (  - 17/192 )

       + RatioR^2*mp2^2 * ( rF4r - 8*Lr5^2 + 1/16*Hdd(muu,mp2,mp2,muu) - 1/8*
         Hdd(mdd,mp2,mp2,muu) - 1/24*Hdd(mp2,mp2,mp2,muu) + 3/8*H21dd(mdd,mp2,
         mp2,muu) + 3/4*H21dd(mp2,muu,mp2,muu) + 3/8*H21dd(mp2,mp2,mp2,muu) )

       + RatioR^2*mp2^2*pi16 * ( 1/1536 - 8*Lr8 + 4*Lr5 - Lr3 - 5*Lr2 - 2*Lr1
          - 2*Lr0 )

       + RatioR^2*mp2^2*pi16^2 * ( 31/384 )

       + ABar(muu)*mp2 * ( 8*Lr8 + 32*Lr6 - 2*Lr5 - 16*Lr4 - 10*Lr3 - 14*Lr2
          - 20*Lr1 - 4*Lr0 )

       + ABar(muu)*mp2*pi16 * (  - 23/16 )

       + ABar(muu)*RatioR*mp2 * ( 8*Lr8 - 2*Lr5 + 8*Lr4 - 10*Lr3 - 14*Lr2 - 20
         *Lr1 - 4*Lr0 )

       + ABar(muu)*RatioR*mp2*pi16 * (  - 19/16 )

       + ABar(muu)^2 * (  - 1/4 + 1/8*RbarP )

       + ABar(muu)*ABar(mp2) * ( 1/8 )

       + ABar(mdd)*mp2 * ( 8*Lr4 - 4*Lr2 - 16*Lr1 )

       + ABar(mdd)*RatioR*mp2 * (  - 8*Lr4 + 4*Lr2 + 16*Lr1 )

       + ABar(mdd)^2 * ( 1/16 )

       + ABar(mp2)*mp2 * ( 8*Lr8 + 32*Lr6 - Lr5 - 4*Lr4 - 13*Lr3 - 10*Lr2 - 40
         *Lr1 - 7*Lr0 )

       + ABar(mp2)*mp2*pi16 * (  - 7/8 )

       + ABar(mp2)*RatioR*mp2 * ( 3*Lr5 )

       + ABar(mp2)*RatioR*mp2*pi16 * (  - 1/8 )

       + ABar(mp2)^2*RatioR * (  - 1/8 )

       + ABar(mp2)^2 * ( 13/16 );

G NNLOdecayNormalized2 =
       + mp2 * (  - 1/4*Hbb(muu,mp2,mp2,muu) - 1/8*Hbb(mdd,mp2,mp2,muu) - 1/8*
         Hbb(mp2,mp2,mp2,muu) )

       + mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 + 5/16*Hdd(muu,mp2,
         mp2,muu) + 1/8*Hdd(mdd,mp2,mp2,muu) + 1/12*Hdd(mp2,mp2,mp2,muu) + 3/8
         *H21dd(mdd,mp2,mp2,muu) + 3/4*H21dd(mp2,muu,mp2,muu) + 3/8*H21dd(mp2,
         mp2,mp2,muu) )

       + mp2^2*pi16 * ( 1/128 - 16*Lr8 - 64*Lr6 + 8*Lr5 + 32*Lr4 - 5/2*Lr3 - 
         10*Lr2 - 2*Lr1 - 9/2*Lr0 )

       + mp2^2*pi16^2 * ( 109/384 )

       + RatioR*mp2 * ( 1/8*Hbb(mdd,mp2,mp2,muu) )

       + RatioR*mp2^2 * ( rF3r - 16*Lr5^2 - 64*Lr4*Lr5 + 3/8*Hdd(muu,mp2,mp2,
         muu) + 1/24*Hdd(mp2,mp2,mp2,muu) + 3/4*H21dd(mdd,mp2,mp2,muu) + 3/2*
         H21dd(mp2,muu,mp2,muu) + 3/4*H21dd(mp2,mp2,mp2,muu) )

       + RatioR*mp2^2*pi16 * (  - 1/768 - 16*Lr8 - 32*Lr6 + 8*Lr5 + 16*Lr4 - 2
         *Lr3 - 2*Lr2 - 4*Lr1 - 4*Lr0 )

       + RatioR*mp2^2*pi16^2 * (  - 17/192 )

       + RatioR^2*mp2^2 * ( rF4r - 8*Lr5^2 + 1/16*Hdd(muu,mp2,mp2,muu) - 1/8*
         Hdd(mdd,mp2,mp2,muu) - 1/24*Hdd(mp2,mp2,mp2,muu) + 3/8*H21dd(mdd,mp2,
         mp2,muu) + 3/4*H21dd(mp2,muu,mp2,muu) + 3/8*H21dd(mp2,mp2,mp2,muu) )

       + RatioR^2*mp2^2*pi16 * ( 1/1536 - 8*Lr8 + 4*Lr5 - Lr3 - 5*Lr2 - 2*Lr1
          - 2*Lr0 )

       + RatioR^2*mp2^2*pi16^2 * ( 31/384 )

       + ABar(muu)*mp2 * ( 8*Lr8 + 32*Lr6 - 2*Lr5 - 16*Lr4 - 10*Lr3 - 14*Lr2
          - 20*Lr1 - 4*Lr0 )

       + ABar(muu)*mp2*pi16 * (  - 23/16 )

       + ABar(muu)*RatioR*mp2 * ( 8*Lr8 - 2*Lr5 + 8*Lr4 - 10*Lr3 - 14*Lr2 - 20
         *Lr1 - 4*Lr0 )

       + ABar(muu)*RatioR*mp2*pi16 * (  - 19/16 )

       + ABar(muu)^2 * (  - 1/4 + 1/8*RbarP )

       + ABar(muu)*ABar(mp2) * ( 1/8 )

       + ABar(mdd)*mp2 * ( 8*Lr4 - 4*Lr2 - 16*Lr1 )

       + ABar(mdd)*RatioR*mp2 * (  - 8*Lr4 + 4*Lr2 + 16*Lr1 )

       + ABar(mdd)^2 * ( 1/16 )

       + ABar(mp2)*mp2 * ( 8*Lr8 + 32*Lr6 - Lr5 - 4*Lr4 - 13*Lr3 - 10*Lr2 - 40
         *Lr1 - 7*Lr0 )

       + ABar(mp2)*mp2*pi16 * (  - 7/8 )

       + ABar(mp2)*RatioR*mp2 * ( 3*Lr5 )

       + ABar(mp2)*RatioR*mp2*pi16 * (  - 1/8 )

       + ABar(mp2)^2*RatioR * (  - 1/8 )

       + ABar(mp2)^2 * ( 13/16 );

L diff = NNLOdecayNormalized2 - NNLOdecayNormalized1;
b F,mp2, eps, ABar, pi16;
print diff;

.end