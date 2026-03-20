#procedure dointB0(QQ,RR)
* deals with two propagator integrals with 0 momentum flowing through
* propagators are prop(mp2?,QQ) and prop(mk2?,RR)
* CORRECT if momenta can at most show up to power 4
*         but in at most two scalar products
id `RR'= -`QQ';
id prop(mp2?,`RR') = prop(mp2,`QQ');

id `QQ'.`QQ'*prop(mp2?,`QQ') = 1+mp2*prop(mp2,`QQ');
id `QQ'.`QQ'*prop(mp2?,`QQ') = 1+mp2*prop(mp2,`QQ');
id `QQ'.`QQ'*prop(mp2?,`QQ') = 1+mp2*prop(mp2,`QQ');
.sort
* now `QQ' can only come as scalar products
id `QQ'.QRS1?*`QQ'.QRS1? = 1/dim*`QQ'.`QQ'*QRS1.QRS1;
id `QQ'.QRS1?*`QQ'.QRS2? = 1/dim*`QQ'.`QQ'*QRS1.QRS2;
id `QQ'.`QQ'*prop(mp2?,`QQ') = 1+mp2*prop(mp2,`QQ');
id `QQ'.QRS? = 0;
.sort
id prop(mp2?,`QQ') = aa*prop(mp2,`QQ');
* no propagators,then zero
if (count(aa,1)=0);
  discard;
endif;
*if (count(aa,1)=4);
*  id aa^4*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mp2?,`QQ') = 
*          D(mp2,mp2,mp2,mp2,0);
*  id aa^4*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mk2?,`QQ') = 
*          D(mp2,mp2,mp2,mk2,0);
*  id aa^4*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mk2?,`QQ')*prop(mk2?,`QQ') = 
*          D(mp2,mp2,mk2,mk2,0);
*  id aa^4*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mk2?,`QQ')*prop(me2?,`QQ') = 
*          D(mp2,mp2,mk2,me2,0);
*  id aa^4*prop(mp2?,`QQ')*prop(mk2?,`QQ')*prop(me2?,`QQ')*prop(m11?,`QQ') = 
*          D(mp2,mk2,me2,m11,0);
*endif;
*if (count(aa,1)=3);
*  id aa^3*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mp2?,`QQ') = C(mp2,mp2,mp2,0);
*  id aa^3*prop(mp2?,`QQ')*prop(mp2?,`QQ')*prop(mk2?,`QQ') = C(mp2,mp2,mk2,0);
*  id aa^3*prop(mp2?,`QQ')*prop(mk2?,`QQ')*prop(me2?,`QQ') = C(mp2,mk2,me2,0);
*endif;
if (count(aa,1)=2);
  id aa^2*prop(mp2?,`QQ')*prop(mp2?,`QQ') = B(mp2,mp2,0);
  id aa^2*prop(mp2?,`QQ')*prop(mk2?,`QQ') = B(mp2,mk2,0);
endif;
if (count(aa,1)=1);
  id aa*prop(mp2?,`QQ') = A(mp2);
endif;
id aa = 1;
#endprocedure
