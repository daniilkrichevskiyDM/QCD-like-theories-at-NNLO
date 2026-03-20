#define MAX "50"
Symbol x, j;
*
*   Expansion of ln(1-x)
*
Local F = sum_(j,1,`MAX',-x^j/j);
Print;
.sort
*
*   The expansion of 1-exp(x) is sum_(j,1,`MAX',-x^j/fac_(j)) but that
*   generates *	many terms beyond what is accurate. We can make an
*   automatic cutoff on the power of y with the declaration here:
*
Symbol y(:`MAX'),n;
#do i = `MAX',1,-1
  id  x^`i' = sum_(j,1,{`MAX'-`i'+1},-y^j/fac_(j))*x^{`i'-1};
  .sort: i = `i';
#enddo
Print;
.end

