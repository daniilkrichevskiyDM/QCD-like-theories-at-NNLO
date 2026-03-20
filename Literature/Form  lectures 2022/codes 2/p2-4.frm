#define MAX "4"
Symbols <x1y5>,...,<x`MAX'y{`MAX'+4}>;
Format 72;
#do i = 1,`MAX'
  Local F`i' = <x1y5>+...+<x`i'y{`i'+4}>;
#enddo
Print;
.end
