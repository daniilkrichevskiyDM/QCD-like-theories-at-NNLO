#include symbols.hf
symbol lambda;
*load Saved_Lagrangians_with_vectors/vertexA5Mp2SP4.sav;

*G new = vertexA5Mp2SP4;

G Aphi3Theory =lambda*phi(1)^2*phi(mu,1)*phiA(mu,1);

print Aphi3Theory; 

.store
save  Aphi3_Theory.sav 
   Aphi3Theory;

.end