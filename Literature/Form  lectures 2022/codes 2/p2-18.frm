#include- minceex.h
Off Statistics;
Format nospaces;
.global
L   F = Q.Q^4/p1.p1^2/p2.p2^2/p3.p3/p4.p4^2/p5.p5;
#call integral(t1,0)
#call subvalues
#call expansion(1)
Print +f;
.end
