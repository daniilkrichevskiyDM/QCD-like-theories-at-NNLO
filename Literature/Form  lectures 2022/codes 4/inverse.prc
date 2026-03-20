#procedure minors(F,T,minor,N)
*
*   Routine evaluates the determinant of the NxN matrix
*	in table T and all its minors.
*   The result will be in expression `F'.
*	The method used is: Define the 1x1 minors in the
*	last column Then make the 2x2 minors from the last
*	two columns. Etc.    The minors are indicated by
*	the indices in the Levi-Civita tensor e_. Hence
*	the coefficient of e_(2,3,5) is the minor in the
*	last three columns made from the entries in the
*	rows 2, 3 and 5. In this method no minor has to be
*	evaluated twice and no unneeded information is kept.
*	The trick with the 'Keep Brackets' makes that
*	zeroes are detected as quickly as possible.
*   We obtain the minor(i,j) in the output by placing a
*   marker at the (i,j) position instead of `T'(i,j).
*   The symbol xinv is used to make sure we never get
*   more than a single minor marker.
*   In the end minor(0,0) indicates the determinant.
*   `F'/(`F'[`minor'(0,0)])-`F'[`minor'(0,0)] will be
*   the inverse of `T'.
*
Symbol xinv(:1);
G   'F' = <e_(1)*(`T'(1,1)+`minor'(1,1)*xinv)>+...+
          <e_(`N')*(`T'(1,`N')+`minor'(1,`N')*xinv)>;
#do k = 1,{`N'-1}
id  e_(i1?,...,i`k'?) = 
#do i = 1,`N'
    +e_(`i',i1,...,i`k')*('T'({`k'+1},`i')+`minor'({`k'+1},`i')*xinv)
#enddo
    ;
B   e_;
.sort: determ at step 'k';
Skip; NSkip `F';
Keep Brackets;
#enddo
id  e_(1,...,`N') = 1;
.sort
if ( count(xinv,1) == 0 ) Multiply `minor'(0,0);
id	xinv= 1;
#endprocedure

