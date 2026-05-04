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


G Bfull1 = x2*BB2(ss,tt,uu) 
    + x2^2*(BP4(ss,tt,uu) + B4S(ss,tt-uu) + B4S(uu,tt-ss) + B4T(tt)) 
    + x2^3*(B6P(ss,tt,uu) + B6S(ss,tt-uu) + B6S(uu,tt-ss) + B6T(tt));

G Cfull1 = x2*0 
    +x2^2*(C4P(ss,tt,uu) + C4S(ss) + C4T(tt) + C4T(uu)) +
    +x2^3*(C6P(ss,tt,uu) + C6S(ss) + C6T(tt) + C6T(uu));

.sort
#include All_terms.hf

.sort
b epsb2,epsb1,x2,tt,ss,uu;
print Bfull1, Cfull1;
.end

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
*we need to renormalize the NNLO LECs

#do indexNNLOLECs = 1,100
id KK`indexNNLOLECs' = KKr`indexNNLOLECs' + gamma2NNLO`indexNNLOLECs'*eps^(-2)+2*gamma1NNLO`indexNNLOLECs'*(log4pi-2*logmu)+2*gamma2NNLO`indexNNLOLECs'*(log4pi-2*logmu)^2+1/eps*(gamma1NNLO`indexNNLOLECs'+2*log4pi*gamma2NNLO`indexNNLOLECs'-4*gamma2NNLO`indexNNLOLECs'*logmu);
#enddo

id logmu = 0;
.sort

#include gammasNNLO2.hf

.sort


b x2;

b eps, tt, ss, uu, x2;

Print Bfull1, Cfull1;

.end
