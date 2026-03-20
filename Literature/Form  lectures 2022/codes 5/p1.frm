Symbols D,ep,n1,n2,n3,n4,n5;
Dimension D;
Symbols x,x1,x2,x3,x4,x5;
Vector Q,p,p1,p2,p3,p4,p5;
CFunction der,del,Z,Y;
Off Statistics;
Format nospaces;
.global
#call IBPforT1
Bracket Z;
Print +f;
.end
