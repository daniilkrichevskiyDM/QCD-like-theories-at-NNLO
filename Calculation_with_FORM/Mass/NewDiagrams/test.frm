#include symbols.hf

*load phi6_Theory.sav;
*L F1 = phi6Theory;
*Print;
*.end

G phi2Theory = Lambda*phi(1)^2;

.sort

Print;
.store
save phi2_Theory.sav 
   phi2Theory;
.end