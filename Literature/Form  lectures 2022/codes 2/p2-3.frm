#define MAX "4"
Symbols x1,...,x`MAX';
Format 72;
#do i = 1,`MAX',2
  Local F`i' = (x1+...+x`i')^2;
#enddo
Print;
.end
