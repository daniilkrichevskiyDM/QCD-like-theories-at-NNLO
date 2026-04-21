#procedure pickoutA(I,Q,ExtPol,P,PP,Polar,PolarSet,NM,A)

*This is the version to couple the external vector A field
*to one of the legs of the vertex.
*In our special case NM is always just 1. 
*I.e. we do not have to do a loop over number of fields.  


*this is how the vector field looks after the takederiv.hf:
* phiA(1,v1,p2) (flavor, polarization, momentum)

* version with specific indices
* this procedure picks out a term with index I and momentum (external) Q from a vertex
* P is the momenta in the vertex and PP the set the momenta belong to. 
* Polar is polarization in the vertex.
* PolarSet is the set of symbols the polarization belongs to.
* NM is the maximum number of fields present
* A contains the expressions it should be taken from
.sort
skip; *deactivate expression. * .sort and .store reactivate all expressions
nskip `A';*reactivate A
multiply aa;*multiply the expression with AA
* generate all cases using preprocessor
* new trick is to use delt(`I',`P'`ii') to remove the phi afterwards

*loop over the total number of fields with index I  
* (start from 1 up to max terms, for 2 point lagrangian this is just 2))
#do NNM = 1,`NM'
if (match(phiA(`I', `Polar'1?`PolarSet',`P'1?`PP'))==`NNM');
*if (match(phiA(`I', v1,`P'1?`PP'))==`NNM'); 
*multiply 999; 
id aa*<phiA(`I', `Polar'1?`PolarSet',`P'1?`PP')>*...*<phiA(`I', `Polar'`NNM'?`PolarSet',`P'`NNM'?`PP')>
  = <phiA(`I', `Polar'1,`P'1)>*...*<phiA(`I', `Polar'`NNM',`P'`NNM')>*(
#do ii=1,`NNM'
*delt is defined in symbols as a commuting function
    +delt(`P'`ii',`Q')*delt(`Polar'`ii',`ExtPol')*delt(`I',`P'`ii')
#enddo
    );
endif;
#enddo


id aa=0;  *to kill all other term in the Lagrangian which do not have the pattern with fields
*of the flavour I.

.sort
skip;
nskip `A';
*reset all momenta and fields that need resetting
id delt(`I',`P'1?`PP')*phiA(`I',`Polar'1?`PolarSet',`P'1?`PP') = 1;
repeat;
id delt(`P'1?,`Q')*`P'1?.`Q' = delt(`P'1,`Q')*`Q'.`Q';
id delt(`P'1?,`Q')*`P'1?.`P'1? = delt(`P'1,`Q')*`Q'.`Q';
id delt(`P'1?,`Q')*`P'1?.`P'0? = delt(`P'1,`Q')*`Q'.`P'0;
id delt(`Polar'1?,`ExtPol')*p1ext?.`Polar'1? = p1ext.`ExtPol';
*id delt(`Polar'1?,`ExtPol')*`P'1?.`Q' = delt(`Polar'1,`ExtPol')*`Polar'1.`Q';
endrepeat;
id delt(`P'1?`PP',`Q') = 1;
id delt(`Polar'1?`PolarSet',`ExtPol')=1;
.sort
#endprocedure