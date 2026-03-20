#procedure IBPforT1
*
*   We use Q, p1 and p2 as independent momenta. Hence
*       p4 = p1-Q;
*       p3 = p2-Q;
*       p5 = p1-p2;
*
#define DER(i) "2*n`~i'*p.p`~i'/p`~i'.p`~i'"
G   A1 = der( Q,p1)*Z(n1,...,n5);
G   A2 = der(p1,p1)*Z(n1,...,n5);
G   A3 = der(p2,p1)*Z(n1,...,n5);
G   A4 = der( Q,p2)*Z(n1,...,n5);
G   A5 = der(p1,p2)*Z(n1,...,n5);
G   A6 = der(p2,p2)*Z(n1,...,n5);
*
id  der(p?,p1)*Z(n1?,...,n5?) = Z(n1,...,n5)*(
            +D*(del(p,p1)+del(p,p4)+del(p,p5))
            -`DER(1)'
            -`DER(4)'
            -`DER(5)'
            );
id  der(p?,p2)*Z(n1?,...,n5?) = Z(n1,...,n5)*(
            +D*(del(p,p2)+del(p,p3)-del(p,p5))
            -`DER(2)'
            -`DER(3)'
            +`DER(5)'
            );
id  der(p?,Q)*Z(n1?,...,n5?) = Z(n1,...,n5)*(
            +2*(n1+...+n5-D)
            -`DER(1)'
            -`DER(2)'
            );
*
id  del(p?,p?) = 1;
id  del(?a) = 0;
*
id  p4 = p1-Q;
id  p3 = p2-Q;
id  p5 = p1-p2;
*
id  Q.p1 = (Q.Q+p1.p1-p4.p4)/2;
id  Q.p2 = (Q.Q+p2.p2-p3.p3)/2;
id  p1.p2 = (p1.p1+p2.p2-p5.p5)/2;
*
id  <p1.p1^x1?>*...*<p5.p5^x5?>*Z(n1?,...,n5?) = Z(<n1-x1>,...,<n5-x5>);
*
.sort
id  Q.Q = 1;
#endprocedure

