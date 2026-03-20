#procedure testdef(x)
  #write "\n   The value of x is `x' and the value of yy is `yy'\n"
  #define yy "25"
  #write "\n   The value of x is `x' and the value of yy is `yy'\n"
#endprocedure


#define x "10"
#define yy "ax"

#call testdef(3)
#write "\n   The value of x is `x'\n"
#write "\n   The value of x is `x' and the value of yy is `yy'\n"

.end

