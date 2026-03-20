#-
Symbols D,ep,n1,n2,n3,n4,n5;
Dimension D;
Symbols x,x1,x2,x3,x4,x5;
Vector Q,p,p1,p2,p3,p4,p5;
CFunction der,del,Z,Y;
CFunction rat,RAT,C;
Off Statistics;
Format nospaces;
.global
#define NUMEQ "6"
#define N "5"
#define ORDER "{1,2,3,4,5}"
#call IBPforT1
id	Q.Q = 1;
Bracket Z;
.sort
#call CleanupBasic(`N')
Bracket Z;
Print +f;
.end
