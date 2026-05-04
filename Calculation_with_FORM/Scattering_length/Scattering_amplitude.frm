Off statistics;

#include symbols.hf

cfunction ABar, LOmass,Ab, L,  Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
cfunction K1, K2, K3, K4, Jb;
symbol tmu, smu, tms;
symbol m1,m2,m3,m4;
symbol P2, aux1, n, QuarkMassRatio, RatioR, Lp;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, rM0r,rM1r,rM2r, rM0,rM1,rM2;
symbol gamma1NNLO0,...,gamma1NNLO100;
symbol gamma2NNLO0,...,gamma2NNLO100;
symbol nf, x2, L0r, L1r, L2r, L3r, L4r, L5r, L6r, L7r, L8r, L9r, L10r, c1,c2,c3,c4,c5,c6,c7,d1,d2,d3,d4,A1,A2,A3, A4;
symbol A1old, A2old,A3old,A4old,b1old,b2old,b3old,b4old,c1old, rMS, rMSr, LpNew;
symbol uu, tt, ss, l1r,l2r,l3r,l4r,l5r;
cfunction BB2, BP4, B4S, B4T, B6P, B6S, B6T, C4P, C4S, C4T, C6P, C6S, C6T, Bfull, Cfull;
symbol epsInv;
symbol rSigma1,...,rSigma20, rSIGMAr;



***************
.sort

G SummedAmplitudeSquared = 5*(Bfull(ss,tt,uu) + Bfull(tt,uu,ss) - Bfull(uu,ss,tt) + 
     2*Cfull(ss, tt, uu))^2 + 
   5*(-Bfull(ss, tt, uu) + Bfull(tt, uu, ss) + Bfull(uu, ss, tt) + 
     2*Cfull(tt, uu, ss))^2 + 
   5*(Bfull(ss, tt, uu) - Bfull(tt, uu, ss) + Bfull(uu, ss, tt) + 
     2*Cfull(uu, ss, tt))^2 + 
   (5/4)*(Bfull(ss, tt, uu) + Bfull(tt, uu, ss) + Bfull(uu, ss, tt) + 2*Cfull(ss, tt, uu) + 
          2*Cfull(tt, uu, ss) + 2*Cfull(uu, ss, tt))^2;
.sort

id Bfull(ss?,tt?,uu?) = x2*BB2(ss,tt,uu) 
    + x2^2*(BP4(ss,tt,uu) + B4S(ss,tt-uu) + B4S(uu,tt-ss) + B4T(tt)) 
    + x2^3*(B6P(ss,tt,uu) + B6S(ss,tt-uu) + B6S(uu,tt-ss) + B6T(tt));
id Cfull(ss?,tt?,uu?) = x2*0 
    +x2^2*(C4P(ss,tt,uu) + C4S(ss) + C4T(tt) + C4T(uu)) +
    +x2^3*(C6P(ss,tt,uu) + C6S(ss) + C6T(tt) + C6T(uu));
    
.sort

#include All_terms.hf

.sort

*we need to renormalize the NNLO LECs

#do indexNNLOLECs = 1,100
id KK`indexNNLOLECs' = KKr`indexNNLOLECs' + gamma2NNLO`indexNNLOLECs'*eps^(-2)+2*gamma1NNLO`indexNNLOLECs'*(log4pi-2*logmu)+2*gamma2NNLO`indexNNLOLECs'*(log4pi-2*logmu)^2+1/eps*(gamma1NNLO`indexNNLOLECs'+2*log4pi*gamma2NNLO`indexNNLOLECs'-4*gamma2NNLO`indexNNLOLECs'*logmu);
#enddo

id logmu = 0;
.sort

#include gammasNNLO2.hf

.sort



id nf = 2;
id nf^-1 = 1/2;

.sort

id 1/epsb2 = lambda2;
id 1/epsb1 = lambda1;
.sort
id lambda1 = lambda0  + log4pi;
id lambda2 =  lambda0^2 + log4pi^2;
.sort
id lambda0 = epsb^(-1);
id epsb^(-1) = 1/eps + log4pi;

.sort

*Non-relativistic limit
id ss = 4;
id tt = 0;
id uu = 0;
.sort
id Jb(uu) = 0;
id Jb(tt) = 0;
id Jb(ss) = pi16*2;

id K1(ss) = - pi^2*pi16^2;
id K2(ss) = - 4*pi16^2;
id K3(ss) =  1/2*pi^2*pi16^2;
id K4(ss) = 1/36*(pi^2-24)*pi16^2;

id K1(tt) = 0;
id K2(tt) = 0;
id K3(tt) = 0;
id K4(tt) = 0;

id K1(uu) = 0;
id K2(uu) = 0;
id K3(uu) = 0;
id K4(uu) = 0;


.sort
*new definitions of LECs

id L0r=0;
id L3r=0;
id L5r=0;
id L8r=0;

id L1r = l1r;
id L2r = l2r;
id L4r = l3r;
id L6r = l4r;
id L7r = l5r;

.sort

id KKr3 = (rSigma7 - rSigma10)/8 - KKr1/4; 
id   KKr4 = 2*KKr2 + (rSigma16 + rSigma19)/8; 
id    KKr5 = (3*KKr1)/4 - rSigma7/4; 
id    KKr6 = 6*KKr2 + (1/8)*(3*rSigma19 - rSigma16); 
id    KKr14 = (1/32)*(3*rSigma4 + rSigma9) - KKr8; 
id    KKr16 = rSigma18/16 - 4*KKr10;
id  KKr18 = rSigma4/16 - KKr8/2; 
id    KKr20 = (1/32)*(4*rSigma4 - rSigma6 - 4*rSigma9); 
id    KKr22 = KKr10 + rSigma15/256; 
id KKr27 = KKr10/3 + (1/768)*(rSigma12 + 2*rSigma15); 
id KKr28 = -(KKr11/4) - KKr13/2 + KKr17 - KKr7/4 + 
        (1/16)*(6*rSigma10 + rSigma3 - 2*rSigma7 + rSigma8); 
id    KKr29 = rSigma13/8 - KKr15/2; 
id    KKr31 = -((3*KKr1)/2) - KKr11/2 - KKr7/2 + 
        (1/4)*(rSigma3 + 2*rSigma7); 
id    KKr32 = -(KKr15/2) - 6*KKr2 - KKr8 - KKr9 + 
        (1/16)*(rSigma13 + rSigma17 + 2*rSigma4); 
id    KKr35 = KKr2 - KKr21 + KKr9/2 + (1/128)*(-rSigma11 + rSigma2 - 
             4*rSigma4 + 2*rSigma6 + 4*rSigma9); 
id    KKr37 = -((3*KKr1)/4) - KKr11/4 + KKr13/2 - KKr17 + KKr19/2 + 
        KKr23/2 + KKr33/2 - KKr7/4 + (1/32)*(2*rSigma3 + rSigma5 + 
             8*rSigma7 + 2*rSigma8); 
id    KKr38 = KKr15/2 + 2*KKr2 - KKr8 + 
        (1/64)*(-rSigma11 - 4*rSigma13 - 2*rSigma14 - 4*rSigma17 + 
             rSigma2 + 12*rSigma4 - 4*rSigma9); 
id    KKr39 = -(KKr1/3) - KKr11/6 + KKr17/3 + KKr19/3 + KKr23/3 - 
        KKr25 + KKr33/3 - KKr7/6 + (1/96)*(rSigma1 + 8*rSigma10 + 
             4*rSigma3 + 2*rSigma5 + 8*rSigma7 + 4*rSigma8); 
id    KKr40 = -KKr26 - KKr8/2 + (1/128)*(rSigma2 + 12*rSigma4 - 
             4*rSigma9);
.sort

id KKr10 = (1/61440)*(-(35*rSigma1) + 6080*rSigma10 - 70*rSigma11 - 
          70*rSigma12 + 960*rSigma13 - 520*rSigma14 - 520*rSigma15 - 
          2080*rSigma17 - 1120*rSigma18 - 8320*rSigma19 - 35*rSigma2 + 
          2*rSIGMAr*3200 - 2080*rSigma3 - 2080*rSigma4 + 380*rSigma5 + 
          380*rSigma6 + 1520*rSigma8 + 1520*rSigma9);

.sort
*we work up to x2^4

id x2^5 = 0;
id x2^6 = 0;

.sort

G Sigma2to2 = 1/128/pi/25/mp2*SummedAmplitudeSquared; 

.sort


.sort
b x2, pi, mp2;

*b eps;

Print Sigma2to2;

.end