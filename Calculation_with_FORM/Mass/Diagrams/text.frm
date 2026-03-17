
#include symbols.hf
symbol P2,mp2,n, Mu, x2;

Local  Diagram2 = 4*i_*F^-2*mdd*L5*P2 + 16*i_*F^-2*mdd*L4*P2 - 4*i_*F^-2*mdd^2*L8 - 16*i_* F^-2*mdd^2*L6 + 4*i_*F^-2*muu*L5*P2 + 16*i_*F^-2*muu*L4*P2 - 8*i_*F^-2*muu*mdd*L8 - 32*i_*F^-2*muu*mdd*L6 - 4*i_*F^-2*muu^2*L8 - 16*i_*F^-2*muu^2*L6;

id mdd = mp2;
id muu = mp2; 

id P2 = mp2;

multiply  1/i_;
.sort

b mp2;

Print;
.end
