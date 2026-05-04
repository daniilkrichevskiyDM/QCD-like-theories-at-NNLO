Off statistics;

#include symbols.hf

cfunction ABar, LOmass,Ab, L,  Bb,B1b,B21b,spi,B22b,B31b,B32b,Hbb,H1bb,H21bb,Hd,Hdd,H1d,H1dd,H21d,H21dd;
symbol m1,m2,m3,m4;
symbol P2, aux1, n, QuarkMassRatio, RatioR, Lp;
symbol gamma10, gamma20, gamma11, gamma21, gamma12, gamma22, rM0r,rM1r,rM2r, rM0,rM1,rM2;
symbol nf, x2, L0r, L1r, L2r, L3r, L4r, L5r, L6r, L7r, L8r, L9r, L10r, c1,c2,c3,c4,c5,c6,c7,d1,d2,d3,d4,A1,A2,A3, A4;
symbol A1old, A2old,A3old,A4old,b1old,b2old,b3old,b4old,c1old, rMS, rMSr, LpNew;



#include a0MS.hf


.sort
id A1 = +  ( nf^-1*Lp + nf^-1*pi16 + 7/6*Lp + 16*L8r + 16*L0r + 19/18*pi16
          - 2/3*nf*Lp - 5/9*nf*pi16 );
id A2 =  - 2/3*Lp - 4*L5r - 16*L0r - 5/9*pi16 + 5/12*nf*Lp + 11/36*
         nf*pi16;
id A3 =  1/8*Lp + L3r + 4*L0r + 5/48*pi16 - 1/16*nf*Lp - 1/24*nf*
         pi16 ;
id A4 = - 1/24*Lp + L3r - 5/144*pi16 - 1/48*nf*Lp - 1/36*nf*
         pi16 ;
id b1 =- 1/2*nf^-2*Lp - 1/2*nf^-2*pi16 + 32*L6r - 32*L4r + 32*L1r;
id b2 =16*L4r - 32*L1r;
id b3 = - 3/16*Lp + 2*L2r + 8*L1r - 3/16*pi16;
id b4 = - 1/16*Lp + 2*L2r - 1/16*pi16;

id c1 = (  - 49/8*nf^-2*epsb2^-1*pi16^2 + 23/6*nf^-2*epsb1^-1*pi16^2 + 
         19/4*nf^-2*Lp^2 + nf^-2*pi16*Lp - 35/8*nf^-2*pi16^2 - 25/4*nf^-1*
         epsb2^-1*pi16^2 - 520/3*nf^-1*epsb1^-1*pi16*L8r + 220/3*nf^-1*
         epsb1^-1*pi16*L5r - 80/3*nf^-1*epsb1^-1*pi16*L3r - 80/3*nf^-1*
         epsb1^-1*pi16*L0r + 10/3*nf^-1*epsb1^-1*pi16^2 + 17/4*nf^-1*Lp^2 + 
         112*nf^-1*L8r*Lp - 48*nf^-1*L5r*Lp + 32/3*nf^-1*L3r*Lp + 32/3*nf^-1*
         L0r*Lp + nf^-1*pi16*Lp + 96*nf^-1*pi16*L8r - 32*nf^-1*pi16*L5r + 128/
         9*nf^-1*pi16*L3r + 128/9*nf^-1*pi16*L0r - 27/8*nf^-1*pi16^2 - 49/24*
         epsb2^-1*pi16^2 - 376/3*epsb1^-1*pi16*L8r + 32*epsb1^-1*pi16*L7r + 
         272/3*epsb1^-1*pi16*L6r + 116/3*epsb1^-1*pi16*L5r + 88/3*epsb1^-1*
         pi16*L4r - 104/3*epsb1^-1*pi16*L3r + 96*epsb1^-1*pi16*L2r + 160/3*
         epsb1^-1*pi16*L1r - 128/3*epsb1^-1*pi16*L0r + 25/216*epsb1^-1*pi16^2
          + 19/12*Lp^2 + 80*L8r*Lp - 512*L8r^2 - 32*L7r*Lp - 160*L6r*Lp - 64/3
         *L5r*Lp + 256*L5r*L8r + 64/3*L4r*Lp + 56/3*L3r*Lp - 224/3*L2r*Lp - 64
         *L1r*Lp + 80/3*L0r*Lp + 96*KK39 - 64*KK37 + 96*KK25 - 96*KK17 + 32*
         KK13 + 64*KK3 + 155/108*pi16*Lp + 64*pi16*L8r - 128*pi16*L6r - 136/9*
         pi16*L5r + 256/9*pi16*L4r + 56/9*pi16*L3r - 368/9*pi16*L2r - 32/3*
         pi16*L1r + 224/9*pi16*L0r - 2149/1296*pi16^2 + 13/54*pi^2*pi16^2 + 49/
         18*nf*epsb2^-1*pi16^2 + 80*nf*epsb1^-1*pi16*L8r - 48*nf*epsb1^-1*pi16
         *L6r - 88/3*nf*epsb1^-1*pi16*L5r + 104/3*nf*epsb1^-1*pi16*L4r + 104/3
         *nf*epsb1^-1*pi16*L3r - 16/3*nf*epsb1^-1*pi16*L2r - 64/3*nf*epsb1^-1*
         pi16*L1r + 112/3*nf*epsb1^-1*pi16*L0r - 25/36*nf*epsb1^-1*pi16^2 - 83/
         36*nf*Lp^2 - 64*nf*L8r*Lp - 1024*nf*L6r*L8r + 40/3*nf*L5r*Lp + 512*nf
         *L4r*L8r - 8*nf*L3r*Lp - 80/3*nf*L0r*Lp + 64*nf*KK40 + 64*nf*KK26 - 
         192*nf*KK18 + 64*nf*KK14 - 623/216*nf*pi16*Lp - 32*nf*pi16*L8r + 64/9
         *nf*pi16*L5r - 8/3*nf*pi16*L3r - 80/9*nf*pi16*L0r - 10763/5184*nf*
         pi16^2 - 19/18*nf^2*epsb2^-1*pi16^2 + 64/3*nf^2*epsb1^-1*pi16*L6r - 
         32*nf^2*epsb1^-1*pi16*L4r + 32/3*nf^2*epsb1^-1*pi16*L2r + 128/3*nf^2*
         epsb1^-1*pi16*L1r + 107/216*nf^2*epsb1^-1*pi16^2 + 29/36*nf^2*Lp^2 + 
         229/216*nf^2*pi16*Lp + 1645/1728*nf^2*pi16^2 + 1/27*nf^2*pi^2*pi16^2
          );
         
id c2 = ( 3/8*nf^-2*epsb2^-1*pi16^2 - 7/16*nf^-2*epsb1^-1*pi16^2 - 3/
         8*nf^-2*Lp^2 + 3/4*nf^-2*pi16^2 + 3/8*nf^-1*epsb2^-1*pi16^2 - 2*nf^-1
         *epsb1^-1*pi16*L3r - 2*nf^-1*epsb1^-1*pi16*L0r - 7/16*nf^-1*epsb1^-1*
         pi16^2 - 3/8*nf^-1*Lp^2 + 8*nf^-1*L3r*Lp + 8*nf^-1*L0r*Lp - 8*nf^-1*
         pi16*L3r - 8*nf^-1*pi16*L0r + 3/4*nf^-1*pi16^2 + 45/16*epsb2^-1*
         pi16^2 + 12*epsb1^-1*pi16*L8r - 48*epsb1^-1*pi16*L6r + 14/3*epsb1^-1*
         pi16*L5r - 44/3*epsb1^-1*pi16*L4r + 50/3*epsb1^-1*pi16*L3r - 272/3*
         epsb1^-1*pi16*L2r - 164/3*epsb1^-1*pi16*L1r + 98/3*epsb1^-1*pi16*L0r
          - 1/432*epsb1^-1*pi16^2 - 43/16*Lp^2 - 12*L8r*Lp + 48*L6r*Lp - 14/3*
         L5r*Lp + 64*L5r*L8r - 32*L5r^2 + 32/3*L4r*Lp - 32/3*L3r*Lp + 248/3*
         L2r*Lp + 176/3*L1r*Lp - 80/3*L0r*Lp + 32*KK37 - 16*KK33 - 32*KK28 - 
         16*KK23 - 16*KK19 + 64*KK17 - 32*KK13 - 96*KK3 - 743/216*pi16*Lp - 12
         *pi16*L8r + 48*pi16*L6r - 26/9*pi16*L5r + 32/9*pi16*L4r - 38/9*pi16*
         L3r + 512/9*pi16*L2r + 80/9*pi16*L1r - 272/9*pi16*L0r - 853/1296*
         pi16^2 - 91/432*pi^2*pi16^2 - 161/144*nf*epsb2^-1*pi16^2 - 4*nf*
         epsb1^-1*pi16*L8r - 14/3*nf*epsb1^-1*pi16*L5r - 4*nf*epsb1^-1*pi16*
         L4r - 34/3*nf*epsb1^-1*pi16*L3r + 2*nf*epsb1^-1*pi16*L2r + 8*nf*
         epsb1^-1*pi16*L1r - 28*nf*epsb1^-1*pi16*L0r - 791/1728*nf*epsb1^-1*
         pi16^2 + 85/72*nf*Lp^2 + 8*nf*L8r*Lp + 20/3*nf*L5r*Lp + 128*nf*L5r*
         L6r - 64*nf*L4r*L5r + 4/3*nf*L3r*Lp + 24*nf*L0r*Lp - 16*nf*KK20 + 128
         *nf*KK18 - 64*nf*KK14 + 317/108*nf*pi16*Lp + 8*nf*pi16*L8r + 8/9*nf*
         pi16*L5r + 16/9*nf*pi16*L3r + 8*nf*pi16*L0r + 1837/3456*nf*pi16^2 + 
         35/216*nf*pi^2*pi16^2 + 77/144*nf^2*epsb2^-1*pi16^2 + 8*nf^2*epsb1^-1
         *pi16*L6r + 4*nf^2*epsb1^-1*pi16*L4r - 4*nf^2*epsb1^-1*pi16*L2r - 16*
         nf^2*epsb1^-1*pi16*L1r + 3/64*nf^2*epsb1^-1*pi16^2 - 17/36*nf^2*Lp^2
          - 445/432*nf^2*pi16*Lp - 3865/10368*nf^2*pi16^2 - 5/72*nf^2*pi^2*
         pi16^2 );

id c3 = (  - 10/3*nf^-1*epsb1^-1*pi16*L3r - 10/3*nf^-1*epsb1^-1*
         pi16*L0r + 10/3*nf^-1*L3r*Lp + 10/3*nf^-1*L0r*Lp + 28/9*nf^-1*pi16*
         L3r + 28/9*nf^-1*pi16*L0r - 101/96*epsb2^-1*pi16^2 - 2*epsb1^-1*pi16*
         L5r + 8*epsb1^-1*pi16*L4r - 6*epsb1^-1*pi16*L3r + 40*epsb1^-1*pi16*
         L2r + 56/3*epsb1^-1*pi16*L1r - 16*epsb1^-1*pi16*L0r + 1/3456*epsb1^-1
         *pi16^2 + 101/96*Lp^2 + 2*L5r*Lp - 8*L4r*Lp + 6*L3r*Lp - 40*L2r*Lp - 
         56/3*L1r*Lp + 16*L0r*Lp - 4*KK31 + 16*KK28 - 16*KK17 + 8*KK13 + 2*
         KK11 + 2*KK7 + 8*KK5 + 48*KK3 + 2867/1728*pi16*Lp + 5/3*pi16*L5r - 20/
         3*pi16*L4r + 3*pi16*L3r - 31*pi16*L2r - 62/9*pi16*L1r + 43/3*pi16*L0r
          + 2705/20736*pi16^2 + 185/1728*pi^2*pi16^2 + 23/72*nf*epsb2^-1*
         pi16^2 + nf*epsb1^-1*pi16*L5r + 8/3*nf*epsb1^-1*pi16*L3r + 8*nf*
         epsb1^-1*pi16*L0r + 49/432*nf*epsb1^-1*pi16^2 - 23/72*nf*Lp^2 - nf*
         L5r*Lp - 8/3*nf*L3r*Lp - 8*nf*L0r*Lp - 24*nf*KK18 + 16*nf*KK14 + 4*nf
         *KK8 - 503/864*nf*pi16*Lp - 2/3*nf*pi16*L5r - 25/18*nf*pi16*L3r - 7/3
         *nf*pi16*L0r + 59/288*nf*pi16^2 - 67/864*nf*pi^2*pi16^2 - 29/288*nf^2
         *epsb2^-1*pi16^2 - 19/288*nf^2*epsb1^-1*pi16^2 + 29/288*nf^2*Lp^2 + 
         49/216*nf^2*pi16*Lp + 445/5184*nf^2*pi16^2 + 1/72*nf^2*pi^2*pi16^2 );
id c5 = ( 5/32*epsb2^-1*pi16^2 + 5/8*epsb1^-1*pi16*L3r - 25/4*
         epsb1^-1*pi16*L2r - 5/2*epsb1^-1*pi16*L1r + 5/2*epsb1^-1*pi16*L0r - 
         29/2304*epsb1^-1*pi16^2 - 5/32*Lp^2 - 5/8*L3r*Lp + 25/4*L2r*Lp + 5/2*
         L1r*Lp - 5/2*L0r*Lp - 4*KK5 - 8*KK3 + KK1 - 307/1152*pi16*Lp - 7/12*
         pi16*L3r + 35/6*pi16*L2r + 7/3*pi16*L1r - 7/3*pi16*L0r + 71/13824*
         pi16^2 - 19/1152*pi^2*pi16^2 - 55/2304*nf*epsb2^-1*pi16^2 - 5/24*nf*
         epsb1^-1*pi16*L3r - 5/12*nf*epsb1^-1*pi16*L0r + 119/13824*nf*epsb1^-1
         *pi16^2 + 55/2304*nf*Lp^2 + 5/24*nf*L3r*Lp + 5/12*nf*L0r*Lp + 13/768*
         nf*pi16*Lp + 5/18*nf*pi16*L3r + 2/9*nf*pi16*L0r - 10313/165888*nf*
         pi16^2 + 29/3456*nf*pi^2*pi16^2 + 5/1152*nf^2*epsb2^-1*pi16^2 + 1/
         13824*nf^2*epsb1^-1*pi16^2 - 5/1152*nf^2*Lp^2 - 19/2304*nf^2*pi16*Lp
          - 1015/165888*nf^2*pi16^2 + 1/3456*nf^2*pi^2*pi16^2 );

id d1 = ( 9/4*nf^-3*epsb2^-1*pi16^2 - nf^-3*epsb1^-1*pi16^2 - 7/4*nf^-3*
         Lp^2 - 3/2*nf^-3*pi16*Lp + 5/4*nf^-3*pi16^2 + 3/2*nf^-2*epsb2^-1*
         pi16^2 + 64*nf^-2*epsb1^-1*pi16*L8r - 32*nf^-2*epsb1^-1*pi16*L5r + 48
         *nf^-2*epsb1^-1*pi16*L3r + 48*nf^-2*epsb1^-1*pi16*L0r - 1/2*nf^-2*
         epsb1^-1*pi16^2 - nf^-2*Lp^2 - 48*nf^-2*L8r*Lp + 24*nf^-2*L5r*Lp - 48
         *nf^-2*L3r*Lp - 48*nf^-2*L0r*Lp - nf^-2*pi16*Lp - 48*nf^-2*pi16*L8r
          + 16*nf^-2*pi16*L5r - 16*nf^-2*pi16*L3r - 16*nf^-2*pi16*L0r + 1/2*
         nf^-2*pi16^2 - 1/2*nf^-1*epsb2^-1*pi16^2 - 32*nf^-1*epsb1^-1*pi16*L7r
          - 32*nf^-1*epsb1^-1*pi16*L6r + 48*nf^-1*epsb1^-1*pi16*L4r - 16*nf^-1
         *epsb1^-1*pi16*L2r - 64*nf^-1*epsb1^-1*pi16*L1r + 1/2*nf^-1*Lp^2 + 32
         *nf^-1*L7r*Lp + 32*nf^-1*L6r*Lp - 48*nf^-1*L4r*Lp + 16*nf^-1*L2r*Lp
          + 64*nf^-1*L1r*Lp + nf^-1*pi16*Lp + 32*nf^-1*pi16*L6r - 32*nf^-1*
         pi16*L4r + 32*nf^-1*pi16*L1r + 3/4*nf^-1*pi16^2 + 1/2*epsb2^-1*pi16^2
          + 16*epsb1^-1*pi16*L8r - 64*epsb1^-1*pi16*L6r - 8*epsb1^-1*pi16*L5r
          + 64*epsb1^-1*pi16*L4r - 16*epsb1^-1*pi16*L2r - 64*epsb1^-1*pi16*L1r
          - 1/2*epsb1^-1*pi16^2 - 1/2*Lp^2 - 16*L8r*Lp + 32*L6r*Lp - 1024*L6r*
         L8r + 8*L5r*Lp + 512*L5r*L6r - 48*L4r*Lp + 512*L4r*L8r - 256*L4r*L5r
          + 16*L2r*Lp + 64*L1r*Lp + 128*KK40 - 128*KK35 + 128*KK26 - 128*KK21
          - 64*KK20 - 128*KK18 + 64*KK9 + 128*KK2 + pi16*Lp + 32*pi16*L6r - 32
         *pi16*L4r + 32*pi16*L1r + 1/6*pi16^2 + 64*nf*epsb1^-1*pi16*L6r - 64*
         nf*epsb1^-1*pi16*L4r + 64*nf*epsb1^-1*pi16*L1r - 64*nf*L6r*Lp - 2048*
         nf*L6r^2 + 64*nf*L4r*Lp + 2048*nf*L4r*L6r - 512*nf*L4r^2 - 64*nf*L1r*
         Lp + 384*nf*KK27 - 256*nf*KK22 + 128*nf*KK10 );
id d4 = ( 1/24*epsb2^-1*pi16^2 + epsb1^-1*pi16*L5r + 2*epsb1^-1*
         pi16*L0r + 5/96*epsb1^-1*pi16^2 - 1/24*Lp^2 - L5r*Lp - 2*L0r*Lp + 8*
         KK29 + 4*KK15 - 7/48*pi16*Lp - pi16*L5r + pi16*L3r - 11/192*pi16^2 - 
         1/288*pi^2*pi16^2 - 5/48*nf*epsb2^-1*pi16^2 + 4*nf*epsb1^-1*pi16*L2r
          - 1/96*nf*epsb1^-1*pi16^2 + 5/48*nf*Lp^2 - 4*nf*L2r*Lp + 8*nf*KK16
          + 1/16*nf*pi16*Lp + 7/64*nf*pi16^2 + 1/288*nf*pi^2*pi16^2 );



*id Lp = LpNew + 2*pi16*logmu;

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

id KK1 =  (1/2)*(-(16*KK10) - KK11 - KK13 - 4*KK14 - 4*KK15 - 
         16*KK16 + 3*KK17 + 12*KK18 + 2*KK19 - 8*KK2 + 8*KK20 + 
         8*KK21 + 32*KK22 + 2*KK23 - 3*KK25 - 12*KK26 - 48*KK27 - 
         4*KK28 - 8*KK29 + 2*KK3 + 2*KK31 + 2*KK33 + 8*KK35 - 2*KK37 - 
         3*KK39 - 12*KK40 + 4*KK5 - KK7 - 4*KK8 - 4*KK9 + rMS);

id  rMS = rMSr + gamma20*eps^(-2)+2*gamma10*(log4pi-2*logmu)+2*gamma20*(log4pi-2*logmu)^2
+1/eps*(gamma10+2*log4pi*gamma20-4*gamma20*logmu);

id logmu = 0;

id gamma20 = (193*pi16^2)/3072;

id gamma10 = (1/4608)*(-(12864*L0r*pi16) + 3840*L1r*pi16 - 
         23808*L2r*pi16 + 960*L3r*pi16 + 1152*L4r*pi16 + 
         288*L5r*pi16 - 16128*L6r*pi16 - 4032*L8r*pi16 + 241*pi16^2);


*id pi16 = 1/(16*pi^2);
.sort 
b x2, pi, pi16, Lp;
*b eps, Lp;
b x2;
Print;
.end