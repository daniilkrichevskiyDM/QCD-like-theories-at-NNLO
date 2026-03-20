*
*   File with declarations for 10-dimensional gravity in
*   session 5 of the FORM course.
*
Dimension 10;
Symbols d1,d2,L,mu,rho,scqmu,q,cqmu,u3,dd1,dd2,drho,dL;
Symbols sint1,cost1,sint2,cost2,dsint1,dcost1,dsint2,dcost2;
AutoDeclare index i;
AutoDeclare symbol x;
AutoDeclare CFunction t,w,T,five;
CTable,zerofill,G(1:10,1:10);
CTable,zerofill,GI(1:10,1:10);
CTable,zerofill,Gamma(1:10,1:10,1:10);
CTable,zerofill,Riemann(1:10,1:10,1:10,1:10);
CTable,zerofill,Ricci(1:10,1:10);
CFunction acc,der,rem,Ric;
Set params:q,L,mu,scqmu,cqmu;
Set vars:rho,sint1,cost1,sint2,cost2,u3;
CTable,zerofill,Weyl0000(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1000(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl0001(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1100(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1010(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1001(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl0101(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1110(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl0111(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1011(1:10,1:10,1:10,1:10);
CTable,zerofill,Weyl1111(1:10,1:10,1:10,1:10);
CTable,zerofill,Five00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five00001(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five00011(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five00111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five01111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,Five11111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,HDfive00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00001(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00011(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive00111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive01111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CFive11111(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CHDfive00000(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,CA(1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T000000(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T000001(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T100000(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T100100(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T000011(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110100(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110110(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111110(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111011(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T011111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T001111(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T110000(1:10,1:10,1:10,1:10,1:10,1:10);
CTable,zerofill,T111000(1:10,1:10,1:10,1:10,1:10,1:10);
CFunction Conv,f1,f2,R;
*
Format nospaces;
.global

