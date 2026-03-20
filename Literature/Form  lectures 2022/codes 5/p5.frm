Symbol x,y,n;
CFunction rat;
Off Statistics;
Format nospaces;
Local F = (x+y+2)^3+y*(x+2*y+3)^2-1;
Bracket y;
Print;
.sort
id	x^n? = rat(x^n,1);
Bracket y;
Print;
.sort
PolyRatFun rat;
Print +s;
.sort
id	y^n? = y^n*rat(1,x+1+n);
Print +s;
.sort
id	y = 3;
Print +s;
.end

