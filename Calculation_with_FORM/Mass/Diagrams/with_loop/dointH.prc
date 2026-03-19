#procedure dointH(PP,QQ,RR,qext,A)
* does the sunset-type integrals
* PP,QQ,RR are the three propagator momenta moving to the right
* qext is the external momentum flowing through also going to
* the right
* PP,QQ,RR at most of power four and at most in two scalar praducts
skip;
nskip `A';
id `RR' = -`PP'-`QQ'+`qext';
id `QQ'.`PP'*prop(mp2?,`RR') = 1/2*(1-prop(mp2,`RR')*
   (`PP'.`PP'+`QQ'.`QQ'-2*`PP'.`qext'-2*`QQ'.`qext'+`qext'.`qext'-mp2));
id `QQ'.`PP'*prop(mp2?,`RR') = 1/2*(1-prop(mp2,`RR')*
   (`PP'.`PP'+`QQ'.`QQ'-2*`PP'.`qext'-2*`QQ'.`qext'+`qext'.`qext'-mp2));
id `QQ'.`QQ'*prop(mp2?,`QQ') = 1+mp2*prop(mp2,`QQ');
id `QQ'.`QQ'*prop(mp2?,`QQ') = 1+mp2*prop(mp2,`QQ');
id `PP'.`PP'*prop(mp2?,`PP') = 1+mp2*prop(mp2,`PP');
id `PP'.`PP'*prop(mp2?,`PP') = 1+mp2*prop(mp2,`PP');

#do ii={`PP'|`QQ'|`RR'}
  id prop(mp2?,`ii') = aa*prop(mp2,`ii');
#enddo
if (count(aa,1)<=1);
  discard;
endif;
if (count(aa,1)=3);
id QRS1?.`QQ'*QRS1?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.QRS1*H22(mk2,mp2,me2,`qext'.`qext')
 +QRS1.`qext'*QRS1.`qext'*H21(mk2,mp2,me2,`qext'.`qext');
id QRS1?.`QQ'*QRS2?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.QRS2*H22(mk2,mp2,me2,`qext'.`qext')
 +QRS1.`qext'*QRS2.`qext'*H21(mk2,mp2,me2,`qext'.`qext');

id QRS1?.`PP'*QRS1?.`PP'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.QRS1*H22(mp2,mk2,me2,`qext'.`qext')
 +QRS1.`qext'*QRS1.`qext'*H21(mp2,mk2,me2,`qext'.`qext');
id QRS1?.`PP'*QRS2?.`PP'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.QRS2*H22(mp2,mk2,me2,`qext'.`qext')
 +QRS1.`qext'*QRS2.`qext'*H21(mp2,mk2,me2,`qext'.`qext');

id QRS1?.`PP'*QRS1?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.QRS1*H24(mp2,mk2,me2,`qext'.`qext')
 +QRS1.`qext'*QRS1.`qext'*H23(mp2,mk2,me2,`qext'.`qext');
id QRS1?.`PP'*QRS2?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.QRS2*H24(mp2,mk2,me2,`qext'.`qext')
 +QRS1.`qext'*QRS2.`qext'*H23(mp2,mk2,me2,`qext'.`qext');

id QRS1?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.`qext'*HH1(mk2,mp2,me2,`qext'.`qext');
id QRS1?.`PP'*prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  QRS1.`qext'*HH1(mp2,mk2,me2,`qext'.`qext');

id prop(mp2?,`PP')*prop(mk2?,`QQ')*prop(me2?,`RR') =
  H(mp2,mk2,me2,`qext'.`qext');
id aa^3 = 1;

endif;

* now at most one `QQ'.`QQ' or `PP'.`PP' or `QQ'.`PP' can show up
if (count(aa,1)=2);
*   rewrite in PP and QQ all by shifting integration momenta
  id `QQ'.`QQ'*prop(mp2?,`PP')*prop(mk2?,`RR') = 
      QQP.QQP*prop(mp2,`PP')*prop(mk2,`QQ');
  id QRS1?.`QQ'*QRS1?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`RR') = 
      QRS1.QQP*QRS1.QQP*prop(mp2,`PP')*prop(mk2,`QQ');
  id QRS1?.`QQ'*QRS2?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`RR') = 
      QRS1.QQP*QRS2.QQP*prop(mp2,`PP')*prop(mk2,`QQ');
  id `PP'.`QQ'*prop(mp2?,`PP')*prop(mk2?,`RR') = 
      `PP'.QQP*prop(mp2,`PP')*prop(mk2,`QQ');
  id QRS1?.`QQ'*prop(mp2?,`PP')*prop(mk2?,`RR') = 
      QRS1.QQP*prop(mp2,`PP')*prop(mk2,`QQ');
  id prop(mp2?,`PP')*prop(mk2?,`RR') = prop(mp2,`PP')*prop(mk2,`QQ');
  id QQP = -(`PP'+`QQ'-`qext');

  id `PP'.`PP'*prop(mp2?,`QQ')*prop(mk2?,`RR') = 
      QQP.QQP*prop(mp2,`QQ')*prop(mk2,`PP');
  id QRS1?.`PP'*QRS1?.`PP'*prop(mp2?,`QQ')*prop(mk2?,`RR') = 
      QRS1.QQP*QRS1.QQP*prop(mp2,`QQ')*prop(mk2,`PP');
  id QRS1?.`PP'*QRS2?.`PP'*prop(mp2?,`QQ')*prop(mk2?,`RR') = 
      QRS1.QQP*QRS2.QQP*prop(mp2,`QQ')*prop(mk2,`PP');
  id QRS1?.`PP'*prop(mp2?,`QQ')*prop(mk2?,`RR') = 
      QRS1.QQP*prop(mp2,`QQ')*prop(mk2,`PP');
  id `QQ'.`PP'*prop(mp2?,`QQ')*prop(mk2?,`RR') = 
      `QQ'.QQP*prop(mp2,`QQ')*prop(mk2,`PP');
  id prop(mp2?,`QQ')*prop(mk2?,`RR') = prop(mp2,`QQ')*prop(mk2,`PP');
  id QQP = -(`PP'+`QQ'-`qext');

  id `QQ'.`QQ'*prop(mp2?,`QQ') = mp2*prop(mp2,`QQ');
  id `PP'.`PP'*prop(mp2?,`PP') = mp2*prop(mp2,`PP');
  id `PP' = 0;
  id `QQ' = 0;
  id prop(mp2?,`PP') = A(mp2);
  id prop(mp2?,`QQ') = A(mp2);
id aa^2 = 1;
endif;
.sort
skip;
nskip `A';
id H24(mp2?,mk2?,me2?,`qext'.`qext') = 1/2*(-H22(mp2,mk2,me2,`qext'.`qext')
   -H22(mk2,mp2,me2,`qext'.`qext')+H22(me2,mp2,mk2,`qext'.`qext'));
id H23(mp2?,mk2?,me2?,`qext'.`qext') = 1/2*(-H21(mp2,mk2,me2,`qext'.`qext')
   -H21(mk2,mp2,me2,`qext'.`qext')+H21(me2,mp2,mk2,`qext'.`qext'))
   +HH1(mp2,mk2,me2,`qext'.`qext')+HH1(mk2,mp2,me2,`qext'.`qext')
   -1/2*H(mp2,mk2,me2,`qext'.`qext');
id HH1(mp2?,mp2?,mp2?,`qext'.`qext') = 1/3*H(mp2,mp2,mp2,`qext'.`qext');
id HH1(mp2?,mk2?,mp2?,`qext'.`qext') = 
   1/2*(H(mk2,mp2,mp2,`qext'.`qext')-HH1(mk2,mp2,mp2,`qext'.`qext'));

#endprocedure

