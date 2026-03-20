#procedure connectvertex(Q,P,PP,NP,R,RR,NR,A)
* Q the momentum of the propagator
* P the momenta and PP the set of the starting vertex, NP maximum number of fields
* R the momenta and RR the set of the starting vertex, NR maximum number of fields
* A the expression it should be taken from
#if `SX4'==SP4
#define IMAX "5"
#elseif `SX4'==SO4
#define IMAX "9"
#endif
* run over all possibilities
#do II=1,`IMAX'
.sort
skip; nskip `A';
*************************************************************
if(match(prop(i1?,`Q'))==0);
#do NNP=1,`NP'
if(match(phi(`II',`P'1?`PP'))==`NNP');
#do NNR=1,`NR'
if(match(phi(`II',`R'1?`RR'))==`NNR');
id 
  <phi(`II',`P'1?`PP')>*...*<phi(`II',`P'`NNP'?`PP')>*<phi(`II',`R'1?`RR')>*...*<phi(`II',`R'`NNR'?`RR')>
  = 
  <phi(`II',`P'1)>*...*<phi(`II',`P'`NNP')>*<phi(`II',`R'1)>*...*<phi(`II',`R'`NNR')>
   *(1+
#do I=1,`NNP'
#do J=1,`NNR'
  +delt(`II',`P'`I')*delt(`II',`R'`J')*delt(`P'`I',`Q')*deltm(`R'`J',`Q')*prop(`II',`Q')
#enddo
#enddo
   );
endif;* NNR check
#enddo
* end of NNR loop
endif;* NNP check
#enddo
* end of NNP loop
id delt(`II',`P'1?`PP')*phi(`II',`P'1?`PP') = 1;
id delt(`II',`R'1?`RR')*phi(`II',`R'1?`RR') = 1;
endif;* if prop
#enddo
* end of II loop
.sort
**************************************************************
skip; nskip `A';
*reset all momenta that need resetting
repeat id delt(`P'1?,`Q')*`P'1?.`Q' = delt(`P'1,`Q')*`Q'.`Q';
repeat id delt(`P'1?,`Q')*`P'1?.`P'1? = delt(`P'1,`Q')*`Q'.`Q';
repeat id delt(`P'1?,`Q')*`P'1?.`P'0? = delt(`P'1,`Q')*`Q'.`P'0;
repeat id deltm(`R'1?,`Q')*`R'1?.`Q' = -deltm(`R'1,`Q')*`Q'.`Q';
repeat id deltm(`R'1?,`Q')*`R'1?.`R'1? = deltm(`R'1,`Q')*`Q'.`Q';
repeat id deltm(`R'1?,`Q')*`R'1?.`R'0? = -deltm(`R'1,`Q')*`Q'.`R'0;
id delt(`P'1?`PP',`Q') = 1;
id deltm(`R'1?`RR',`Q') = 1;
if (match(prop(i1?,`Q')) == 0) discard;
.sort
#endprocedure
