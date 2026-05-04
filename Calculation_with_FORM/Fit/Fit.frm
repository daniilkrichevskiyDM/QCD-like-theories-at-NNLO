Off statistics;

#include symbols.hf

cfunction ABar, LOmass,Ab, L,  Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol m1,m2,m3,m4;
symbol P2, aux1, n, QuarkMassRatio, RatioR, Lp;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, rM0r,rM1r,rM2r, rM0,rM1,rM2;
symbol nf, x2, L0r, L1r, L2r, L3r, L4r, L5r, L6r, L7r, L8r, L9r, L10r, c1,c2,c3,c4,c5,c6,c7,d1,d2,d3,d4,A1,A2,A3, A4;
symbol A1old, A2old,A3old,A4old,b1old,b2old,b3old,b4old,c1old, rMS, rMSr, LpNew;
symbol rF0r, rF1r, rA0, rF2r, rA0r;
symbol I1,...,I7;
symbol l1r,l2r,l3r,l4r,l5r;



G  a0MS =
       + x2 * (  - 1/32*pi^-1 )

       + x2^2 * ( 1/2*pi^-1*L8r + 2*pi^-1*L6r - 1/2*pi^-1*L5r - 2*pi^-1*L4r + 
         1/2*pi^-1*L3r + 2*pi^-1*L2r + 2*pi^-1*L1r + 1/2*pi^-1*L0r - 5/128*
         pi^-1*Lp - 1/128*pi^-1*pi16 )

       + x2^3 * ( pi^-1*rMSr - 16*pi^-1*L8r^2 - 128*pi^-1*L6r*L8r - 256*pi^-1*
         L6r^2 + 16*pi^-1*L5r*L8r + 64*pi^-1*L5r*L6r - 4*pi^-1*L5r^2 + 64*
         pi^-1*L4r*L8r + 256*pi^-1*L4r*L6r - 32*pi^-1*L4r*L5r - 64*pi^-1*L4r^2
          - pi^-1*Lp*L8r - 4*pi^-1*Lp*L6r + 3/8*pi^-1*Lp*L5r + 3/2*pi^-1*Lp*
         L4r - 1/4*pi^-1*Lp*L3r - 6*pi^-1*Lp*L2r - pi^-1*Lp*L1r - 11/4*pi^-1*
         Lp*L0r + 29/384*pi^-1*Lp^2 + 1/4*pi^-1*pi16*L8r + pi^-1*pi16*L6r - 1/
         4*pi^-1*pi16*L5r - pi^-1*pi16*L4r + 1/4*pi^-1*pi16*L3r - 2*pi^-1*pi16
         *L2r + pi^-1*pi16*L1r - 5/4*pi^-1*pi16*L0r + 79/768*pi^-1*pi16*Lp - 
         43/768*pi^-1*pi16^2 + 17/576*pi*pi16^2 );


G Decay1 = + F^-3*mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 )

       + F^-3*mp2^2*pi16 * (  - 16*Lr8 - 64*Lr6 + 8*Lr5 + 32*Lr4 - 1/2*Lr3 - 6
         *Lr2 - 2*Lr1 - 5/2*Lr0 )

       + F^-3*mp2^2*pi16^2 * (  - 5/96 )

       + F^-1*mp2 * ( 4*Lr5 + 16*Lr4 )

       + F * ( 1 )

       + RatioR^2*F^-3*mp2^2 * ( rF1r )

       + RatioR^2*F^-3*mp2^2*pi16 * (  - 4*Lr8 - 16*Lr7 )

       + ABar(mp2)*F^-3*mp2 * ( 16*Lr8 + 64*Lr6 - 7*Lr5 - 28*Lr4 - 11*Lr3 - 20
         *Lr2 - 44*Lr1 + Lr0 )

       + ABar(mp2)*F^-3*mp2*pi16 * (  - 43/96 )

       + ABar(mp2)*F^-1 * ( 1 )

       + ABar(mp2)*RatioR^2*F^-3*mp2 * ( 4*Lr8 + 16*Lr7 )

       + ABar(mp2)^2*F^-3 * (  - 11/8 );

G Decay3 = + F^-3*mp2^2 * ( rF0r - 8*Lr5^2 - 64*Lr4*Lr5 - 128*Lr4^2 )

       + F^-3*mp2^2*pi16 * (  - 16*Lr8 - 64*Lr6 + 8*Lr5 + 32*Lr4 - 1/2*Lr3 - 6
         *Lr2 - 2*Lr1 - 5/2*Lr0 )

       + F^-3*mp2^2*pi16^2 * (  - 5/96 )

       + F^-1*mp2 * ( 4*Lr5 + 16*Lr4 )

       + F * ( 1 )

       + RatioR^2*F^-3*mp2^2 * ( rF2r )

       + ABar(mp2)*F^-3*mp2 * ( 16*Lr8 + 64*Lr6 - 7*Lr5 - 28*Lr4 - 11*Lr3 - 20
         *Lr2 - 44*Lr1 + Lr0 )

       + ABar(mp2)*F^-3*mp2*pi16 * (  - 43/96 )

       + ABar(mp2)*F^-1 * ( 1 )

       + ABar(mp2)^2*F^-3 * (  - 11/8 );

G MassSquared1 =  
       + F^-4*mp2^3 * (  - 128*Lr5*Lr8 - 512*Lr5*Lr6 + 64*Lr5^2 - 512*Lr4*Lr8
          - 2048*Lr4*Lr6 + 512*Lr4*Lr5 + 1024*Lr4^2 + rM0r )

       + F^-4*mp2^3*pi16 * ( 12*Lr8 + 48*Lr6 - 6*Lr5 - 24*Lr4 + Lr3 + 12*Lr2
          + 4*Lr1 + 5*Lr0 )

       + F^-4*mp2^3*pi16^2 * ( 5/6 )

       + F^-2*mp2^2 * ( 16*Lr8 + 64*Lr6 - 8*Lr5 - 32*Lr4 )

       + mp2 * ( 1 )

       + RatioR^2*F^-4*mp2^3 * ( rM1r )

       + RatioR^2*F^-4*mp2^3*pi16 * ( 4*Lr8 + 16*Lr7 )

       + ABar(mp2)*F^-4*mp2^2 * ( 4*Lr8 + 16*Lr6 - 2*Lr5 - 8*Lr4 + 22*Lr3 + 40
         *Lr2 + 88*Lr1 - 2*Lr0 )

       + ABar(mp2)*F^-4*mp2^2*pi16 * ( 3/2 )

       + ABar(mp2)*F^-2*mp2 * (  - 3/4 )

       + ABar(mp2)*RatioR^2*F^-4*mp2^2 * (  - 4*Lr8 - 16*Lr7 )

       + ABar(mp2)^2*F^-4*mp2 * ( 69/32 );

G MassSquared3 =  F^-4*mp2^3 * (  - 128*Lr5*Lr8 - 512*Lr5*Lr6 + 64*Lr5^2 - 512*Lr4*Lr8
          - 2048*Lr4*Lr6 + 512*Lr4*Lr5 + 1024*Lr4^2 + rM0r )

       + F^-4*mp2^3*pi16 * ( 12*Lr8 + 48*Lr6 - 6*Lr5 - 24*Lr4 + Lr3 + 12*Lr2
          + 4*Lr1 + 5*Lr0 )

       + F^-4*mp2^3*pi16^2 * ( 5/6 )

       + F^-2*mp2^2 * ( 16*Lr8 + 64*Lr6 - 8*Lr5 - 32*Lr4 )

       + mp2 * ( 1 )

       + RatioR^2*F^-4*mp2^3 * (  - 128*Lr5*Lr8 - 512*Lr5*Lr7 - 512*Lr4*Lr8 - 
         2048*Lr4*Lr7 + rM2r )

       + RatioR^2*F^-4*mp2^3*pi16 * (  - 4*Lr8 - 16*Lr7 )

       + RatioR^2*F^-2*mp2^2 * ( 16*Lr8 + 64*Lr7 )

       + ABar(mp2)*F^-4*mp2^2 * ( 4*Lr8 + 16*Lr6 - 2*Lr5 - 8*Lr4 + 22*Lr3 + 40
         *Lr2 + 88*Lr1 - 2*Lr0 )

       + ABar(mp2)*F^-4*mp2^2*pi16 * ( 3/2 )

       + ABar(mp2)*F^-2*mp2 * (  - 3/4 )

       + ABar(mp2)*RatioR^2*F^-4*mp2^2 * ( 20*Lr8 + 80*Lr7 )

       + ABar(mp2)^2*F^-4*mp2 * ( 69/32 ); 

.sort

id Lr9 = L9r;
id Lr8 = L8r;
id Lr7 = L7r;
id Lr6 = L6r;
id Lr5 = L5r;
id Lr4 = L4r;
id Lr3 = L3r;
id Lr2 = L2r;
id Lr1 = L1r;     
id Lr0 = L0r; 
.sort

id L0r=0;
id L3r=0;
id L5r=0;
id L8r=0;

id L1r = l1r;
id L2r = l2r;
id L4r = l3r;
id L6r = l4r;
id L7r = l5r;

*id L0r = (1/360)*(-(3728*I1) - 2976*I2 + 4768*I3 - 177*I4 + 144*I6);
*id L2r = (1/720)*(3848*I1 + 2976*I2 - 5008*I3 + 177*I4 - 144*I6);
*id L3r = (1/180)*(-(1304*I1) - 1248*I2 + 2224*I3 - 51*I4 + 72*I6) - 4*L1r;
*id L5r = I4/4 - 4*L4r;
*id L7r = (1/288)*(128*I1 + 96*I2 - 160*I3 - 3*I4 + 18*I5) + L6r ;
*id L8r = (1/72)*(-(128*I1) - 96*I2 + 160*I3 + 3*I4) - 4*L6r;


id rMSr = rA0r;

.sort
b x2, F, ABar, RatioR, Lp,  mp2, pi;
print;
.end