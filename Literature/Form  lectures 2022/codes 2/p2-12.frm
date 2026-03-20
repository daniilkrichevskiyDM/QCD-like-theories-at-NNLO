#procedure testdef(x)
  #define yy "25"
  #write "\n   The value of x is `x' and the value of yy is `yy'\n"
#endprocedure
#define x "10"
Symbol a;
Local F = a^2;
#call testdef(3)
#write "\n   The value of x is `x'\n"
#write "\n   The value of x is `x' and the value of yy is `yy'\n"
.end
