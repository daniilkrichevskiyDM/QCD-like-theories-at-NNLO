#procedure pickout(I,Q,P,PP,NM,A)
* version with specific indices
* this procedure picks out a term with index I and momentum Q from a vertex
* P is the momenta in the vertex and PP the set the momenta belong to. 
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
if (match(phi(`I',`P'1?`PP'))==`NNM'); 
id aa*<phi(`I',`P'1?`PP')>*...*<phi(`I',`P'`NNM'?`PP')>
  = <phi(`I',`P'1)>*...*<phi(`I',`P'`NNM')>*(
#do ii=1,`NNM'
*delt is defined in symbols as a commuting function
    +delt(`P'`ii',`Q')*delt(`I',`P'`ii')
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
id delt(`I',`P'1?`PP')*phi(`I',`P'1?`PP') = 1;
repeat;
id delt(`P'1?,`Q')*`P'1?.`Q' = delt(`P'1,`Q')*`Q'.`Q';
id delt(`P'1?,`Q')*`P'1?.`P'1? = delt(`P'1,`Q')*`Q'.`Q';
id delt(`P'1?,`Q')*`P'1?.`P'0? = delt(`P'1,`Q')*`Q'.`P'0;
endrepeat;
id delt(`P'1?`PP',`Q') = 1;
.sort
#endprocedure

