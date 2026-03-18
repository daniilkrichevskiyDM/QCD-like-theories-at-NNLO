#procedure connectbubble(Q,P,PP,NM,A)
* Q the momentum of the propagator
* P the momenta and PP the set
* NM maximum number of fields
* A the expression it should be taken from
#if `SX4'==SP4
#define IMAX "5"
#elseif `SX4'==SO4
#define IMAX "9"
#endif
* run over all possibilities (all possible pions)
* i.e. here we start with choosing some pion speicies
#do II=1,`IMAX'
.sort
skip; nskip `A';
*************************************************************
* this contracts two fields so no extra 1/2 needed

if(match(prop(i1?,`Q'))==0);
*we enter the do-loop if there are no propagators in the terms with II

#do NNM=2,`NM'
if(match(phi(`II',`P'1?`PP'))==`NNM');
* here as in "pickout" the if is fullfilled just once, so the do-loop
* is, in fact, performed just one time, for the NNM = number of pions of type
*II in the term

id 
  <phi(`II',`P'1?`PP')>*...*<phi(`II',`P'`NNM'?`PP')>
  = 
  <phi(`II',`P'1)>*...*<phi(`II',`P'`NNM')>
   *(1+
#do I=1,{`NNM'-1}
#do J={`I'+1},`NNM'
  +delt(`II',`P'`I')*delt(`II',`P'`J')*delt(`P'`I',`Q')*deltm(`P'`J',`Q')*prop(`II',`Q')
#enddo
#enddo
   );
endif;
#enddo
endif;
id delt(`II',`P'1?`PP')*phi(`II',`P'1?`PP') = 1;
.sort
#enddo
**************************************************************
skip; nskip `A';
*reset all momenta that need resetting
repeat id delt(`P'1?,`Q')*`P'1?.`Q' = delt(`P'1,`Q')*`Q'.`Q';
repeat id delt(`P'1?,`Q')*`P'1?.`P'1? = delt(`P'1,`Q')*`Q'.`Q';
repeat id delt(`P'1?,`Q')*`P'1?.`P'0? = delt(`P'1,`Q')*`Q'.`P'0;
repeat id deltm(`P'1?,`Q')*`P'1?.`Q' = -deltm(`P'1,`Q')*`Q'.`Q';
repeat id deltm(`P'1?,`Q')*`P'1?.`P'1? = deltm(`P'1,`Q')*`Q'.`Q';
repeat id deltm(`P'1?,`Q')*`P'1?.`P'0? = -deltm(`P'1,`Q')*`Q'.`P'0;
id delt(`P'1?`PP',`Q') = 1;
id deltm(`P'1?`PP',`Q') = 1;
if (match(prop(i1?,`Q')) == 0) discard;
.sort
#endprocedure
