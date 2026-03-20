Symbols D,ep,n1,n2,n3,n4,n5;
Dimension D;
Symbols x,x1,x2,x3,x4,x5;
Vector Q,p,p1,p2,p3,p4,p5;
CFunction der,del,Z,Y;
Off Statistics;
Format nospaces;
.global
#define N "5"
#call IBPforT1
#call ResetComplexity(`N',1)
.sort
Local A1 = A1-A2;
Local A3 = A3-A2;
Local A4 = A4-A6;
Local A5 = A5-A6;
Print +f;
Bracket Z;
.end

