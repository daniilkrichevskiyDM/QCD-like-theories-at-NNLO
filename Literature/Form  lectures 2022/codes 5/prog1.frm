#-
Symbols D,ep,n1,n2,n3,n4,n5;
Dimension D;
Symbols x,x1,x2,x3,x4,x5;
Vector Q,p,p1,p2,p3,p4,p5;
CFunction der,del,Z,Y;
Off Statistics;
Format nospaces;
.global
#call IBPforT1
id	Q.Q = 1;
Bracket Z;
.sort
id	Z(n1,n2,n3,1+n4,n5) = -(
      +Z(-1+n1,n2,n3,1+n4,n5)*(-n4)
      +Z(-1+n1,n2,n3,n4,1+n5)*(-n5)
      +Z(n1,-1+n2,n3,n4,1+n5)*(n5)
      +Z(n1,n2,n3,n4,n5)*(-n5-n4-2*n1+D))/n4;

id	Z(n1,n2,1+n3,n4,n5) = -(
      +Z(-1+n1,n2,n3,n4,1+n5)*(n5)
      +Z(n1,-1+n2,1+n3,n4,n5)*(-n3)
      +Z(n1,-1+n2,n3,n4,1+n5)*(-n5)
      +Z(n1,n2,n3,n4,n5)*(-n5-n3-2*n2+D))/n3;

id	Z(1+n1,n2,n3,n4,n5) = (
      +Z(1+n1,n2,n3,-1+n4,n5)*(n1)
      +Z(n1,n2,-1+n3,n4,1+n5)*(-n5)
      +Z(n1,n2,n3,-1+n4,1+n5)*(n5)
      +Z(n1,n2,n3,n4,n5)*(n5+2*n4+n1-D))/n1;

id	Z(n1,1+n2,n3,n4,n5) = (
      +Z(n1,1+n2,-1+n3,n4,n5)*(n2)
      +Z(n1,n2,-1+n3,n4,1+n5)*(n5)
      +Z(n1,n2,n3,-1+n4,1+n5)*(-n5)
      +Z(n1,n2,n3,n4,n5)*(n5+2*n3+n2-D))/n2;


Print +f;
Bracket Z;
.end
