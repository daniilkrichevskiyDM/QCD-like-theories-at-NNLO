Symbol x;
Local F = x;
#do i = 1,10
id	x = (x+1)^2;
.sort
#if ( termsin(F) > 13 )
  #breakdo
#endif
#enddo
Print;
.end
