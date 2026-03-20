#procedure determ(F,T,N)
*
*   Routine evaluates the determinant of the NxN matrix
*	in table T. The result will be in expression F.
*	The method used is: Define the 1x1 minors in the
*	last column Then make the 2x2 minors from the last
*	two columns. Etc.    The minors are indicated by
*	the indexes in the Levi-Civita tensor e_. Hence
*	the coefficient of e_(2,3,5) is the minor in the
*	last three columns made from the entries in the
*	rows 2, 3 and 5. In this method no minor has to be
*	evaluated twice and no unneeded information is kept.
*	The trick with the 'Keep Brackets' makes that
*	zeroes are detected as quickly as possible.
*
G   'F' = <e_(1)*`T'(1,1)>+...+<e_(`N')*`T'(1,`N')>;
#do k = 1,{`N'-1}
  id  e_(i1?,...,i`k'?) = 
  #do i = 1,`N'
    +e_(`i',i1,...,i`k')*'T'({`k'+1},`i')
  #enddo
    ;
  B   e_;
  .sort: determ at step 'k';
  Skip; NSkip `F';
  Keep Brackets;
#enddo
id  e_(1,...,`N') = 1;
#endprocedure

