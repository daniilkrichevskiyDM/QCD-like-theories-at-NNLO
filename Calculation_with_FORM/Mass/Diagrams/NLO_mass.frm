Off statistics;

#include symbols.hf

#define theory "SO4"
#define pionsindex "33" 
#define LOmass "mp2"

symbol P2, n, Mu, x2, xu2, xd2, massInInt, massR;
function log; 


* this is the procedure to read off the coefficients
#procedure derivative(expr,var)
.sort
skip;
nskip `expr';
* derivative of powers
  id `var'^n? = n*`var'^(n-1);
.sort
#endprocedure



* 2 point LO
load /Users/daniilkrichevskiy/Desktop/QCD-like-theories-at-NNLO/Calculation_with_FORM/Mass/Diagrams/Without_loops/save/MM1_`pionsindex'`theory'2Mp2.sav;
* 2 point NLO
load /Users/daniilkrichevskiy/Desktop/QCD-like-theories-at-NNLO/Calculation_with_FORM/Mass/Diagrams/Without_loops/save/MM1_`pionsindex'`theory'2Mp4.sav;
* 1 loop NLO
load /Users/daniilkrichevskiy/Desktop/QCD-like-theories-at-NNLO/Calculation_with_FORM/Mass/Diagrams/1_loop/save/MM3_`pionsindex'`theory'4Mp2.sav;


* this one will be use to read of the LO mass
G diagram1 =  MM1x`pionsindex'`theory'2Mp2/i_;

G diagram2 =  MM1x`pionsindex'`theory'2Mp4/i_;
G diagram3 =  MM3x`pionsindex'`theory'4Mp2/i_;

G SigmaNLO = diagram2 + diagram3;

*copy
G Acoefficient = SigmaNLO;
G Bcoefficient = SigmaNLO;

id p1ext.p1ext = P2;

*Print diagram2;

.sort

skip;
nskip Acoefficient;
id P2 = 0;
.sort 

#call derivative(Bcoefficient,P2)

.sort

G SquaredMass = `LOmass' - (Acoefficient + Bcoefficient*`LOmass');

.sort

id A(massInInt?) = - massInInt/(16*pi^2)*log(massInInt/Mu^2);

.sort

*id muu = 2*mp2 - mdd;
*id mdd = massR*muu;*


id mp2*F^(-2) = x2;
id muu*F^(-2) = xu2;
id mdd*F^(-2) = xd2;

*b mp2, x2, xu2, xd2;



Print SquaredMass;

.end
