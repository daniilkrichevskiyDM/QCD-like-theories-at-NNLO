#ifndef `NUM'
  #define NUM "14"
#endif
#write "\n   Computing the 4-dimensional trace of `NUM' \
        gamma matrices.\n"
Index i1,...,i`NUM';
Local F = g_(1,i1,...,i`NUM');
Trace4,1;
.end
