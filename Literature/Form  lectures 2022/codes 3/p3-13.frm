Symbols x,y;
Local F = (x+1)^10-(x+3)^6*(x-2)^4;
.sort
#$maxx = 0;
if ( count(x,1) > $maxx ) $maxx = count_(x,1);
.sort
#write "The maximum power of x is `$maxx'"
.end
