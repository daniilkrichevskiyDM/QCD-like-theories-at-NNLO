Tensor f;
Index  i1,...,i8;
Local  F = f(i1,...,i8)*e_(i1,...,i8)*e_(1,...,8);
Contract;
*  A    PSG       Porto
*  B    Schalke   Arsenal
*  C    Malaga    Milan
*  D    Dortmund  Real Madrid
*  E    Juventus  Donetsk
*  F    Bayern    Valencia
*  G    Barcelona Celtic
*  H    Mancester Galatasaray
id	f(1,?a) = 0;
id	f(i1?,2,?a) = 0;
id	f(i1?,i2?,i3?{3,4,6},?a) = 0;
id	f(i1?,i2?,i3?,4,?a) = 0;
id	f(i1?,i2?,i3?,i4?,i5?{3,5},?a) = 0;
id	f(i1?,i2?,i3?,i4?,i5?,6,?a) = 0;
id	f(i1?,i2?,i3?,i4?,i5?,i6?,i7?{4,6,7},?a) = 0;
id	f(i1?,i2?,i3?,i4?,i5?,i6?,i7?,i8?{2,8}) = 0;
.end


id	f(1,?a) = 0;
id	f(i1?,2,?a) = 0;
id	f(i1?,i2?,3,?a) = 0;
id	f(i1?,i2?,i3?,4,?a) = 0;
id	f(i1?,i2?,i3?,i4?,5,?a) = 0;
id	f(i1?,i2?,i3?,i4?,i5?,6,?a) = 0;
id	f(i1?,i2?,i3?,i4?,i5?,i6?,7,?a) = 0;
id	f(i1?,i2?,i3?,i4?,i5?,i6?,i7?,8) = 0;
.end

