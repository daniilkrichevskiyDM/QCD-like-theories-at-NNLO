Symbols a,b,c,n;
Off Statistics;
Local F1 = a*b^3+2*b^6+b^-10;
Local F2 = a*b^3*c^2+2*b^6*c^5+c;
Print;
.sort
#call derive(b)
Print;
.sort
#call derive(c)
Print;
.end
