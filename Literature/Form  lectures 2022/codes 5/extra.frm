Symbols a,b,c;
CFunction f1,f2,f3;
Off Statistics;
Format nospaces;
Local F = f1(a)+f1(a+b)*f2(c)*(b+c)+f3(f1(a),f2(b),f3(c));
ToPolynomial;
Print;
.sort
#write "\n   %X"
.sort
ExtraSymbols,array,Y;
#write "\n   %X"
Print;
.sort
FromPolynomial;
Print;
.end
