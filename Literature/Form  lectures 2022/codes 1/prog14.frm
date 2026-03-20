Symbol x,D;
Index i1=3,i2=4,i3=D,i4=0,i5,i6,i7;
Local F = x*d_(i1,i1)
         +x^2*d_(i2,i2)+x^3*d_(i3,i3)
         +x^4*d_(i1,i2)*d_(i2,i1)+x^5*d_(i2,i1)*d_(i1,i2)
         +x^6*d_(i5,i6)*d_(i6,i7)
         +x^7*d_(i4,i4)
         +x^8*d_(i5,i4)*d_(i4,i7);
Print +s;
.end
