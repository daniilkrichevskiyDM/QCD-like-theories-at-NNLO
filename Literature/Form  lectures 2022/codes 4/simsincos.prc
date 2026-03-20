#procedure simsincos
*
*	Procedure simplifies combinations of sin and cos.
*	First we try 'at ground level'
*
id	cost1^2 = 1-sint1^2;
id	cost2^2 = 1-sint2^2;
*
AB	sint1,cost1,sint2,cost2;
.sort: simsincos-1;
*
*	Now we collect the powers in a function acc.
*
Collect acc;
FactArg,acc;
Chainout,acc;
id	acc(-1+sint1)*acc(1+sint1) = -cost1^2;
id	acc(-1+sint2)*acc(1+sint2) = -cost2^2;
*
*	This is all we can do here.
*
id	acc(x?) = x;
.sort: simsincos-2;
#endprocedure
