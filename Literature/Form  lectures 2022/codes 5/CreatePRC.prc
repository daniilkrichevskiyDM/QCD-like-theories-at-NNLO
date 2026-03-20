#procedure CreatePRC(name,H,num)
#opendictionary LHS
    #do j = 1,5
        #add m`j': "m`j'?"
        #add n`j'p0: "n`j'?"
        #add n`j'm0: "n`j'?"
        #add n`j'p1: "n`j'?{>1}"
        #add n`j'm1: "n`j'?neg0_"
        #add n`j'p2: "n`j'?{>2}"
        #add n`j'm2: "n`j'?neg_"
    #enddo
#closedictionary
#write <`name'.prc> "#procedure `name'"
#write <`name'.prc> "*\n*  Procedure automatically created `date_'\n*"
*B  Z;
.sort
#do i = 1,`num'
    #$lhs = firstterm_(H`i');
    #$xxx = -H`i'+$lhs;
    #do j = 1,5
        #$change`j' = 0;
    #enddo
    #inside $lhs
        id  Z(x1?,x?,n1?,...,n`N'?) = Z(n1,...,n`N');
        #do j = 1,5
          #do k = 0,2
            if ( match(Z(?a,n`j'+`k',?b)) );
                $change`j' = `k';
                id  Z(?a,n`j'+`k',?b) = Z(?a,n`j'p`k',?b);
            elseif ( match(Z(?a,n`j'-`k',?b)) );
                $change`j' = -`k';
                id  Z(?a,n`j'-`k',?b) = Z(?a,n`j'm`k',?b);
            endif;
          #enddo
        #enddo
        id  Z(n1?,...,n5?) = Z(<n1,m1>,...,<n5,m5>);
        id  rat(1,1) = 1;
    #endinside
    #inside $xxx
        id  Z(x1?,x?,n1?,...,n`N'?) = Z(n1,...,n`N');
        id  Y(?a) = Z(?a);
        Argument Z,rat,num,den;
            #do j = 1,5;
                id  n`j' = n`j'+m`j'*ep-`$change`j'';
            #enddo
        EndArgument;
        Argument Z;
            id  ep = 1;
        EndArgument;
        #do j = 1,5
            SplitArg,((m`j')),Z;
        #enddo
    #endinside
    #usedictionary LHS($)
      #write <`name'.prc> "id,ifmatch->looplabel,%2$",$lhs
    #closedictionary
    #write <`name'.prc> "  =%2$;",$xxx
#enddo
Format 120;
#write <`name'.prc> "goto looplabel2;"
#write <`name'.prc> "label looplabel;"
#write <`name'.prc> "id  num(x?)*den(x?) = 1;"
#write <`name'.prc> "id  num(x?) = rat(x,1);"
#write <`name'.prc> "id  den(x?) = rat(1,x);"
#write <`name'.prc> "*id num(x?number_) = x;"
#write <`name'.prc> "*id den(x?number_) = 1/x;"
#write <`name'.prc> "$loopaction = 1;"
#write <`name'.prc> "label looplabel2;"
#write <`name'.prc> "ModuleOption Maximum,$loopaction;"
#write <`name'.prc> ".sort:`name'-loop \`$numloop\';"
#write <`name'.prc> "#if ( \`$loopaction\' == 1 )"
#write <`name'.prc> "    #redefine inumloop \"0\""
#write <`name'.prc> "#endif"
#write <`name'.prc> "#enddo"
#write <`name'.prc> "#if ( \`whichbasis\' == 1 ) "
#write <`name'.prc> "id  Z(0,m1?,1,m2?,1,m3?,1,m4?,1,m5?) ="
#write <`name'.prc> "    +Z(1,m1,1,m2,1,m3,0,m4,1,m5)*num(m3-m1)*den(1+m5+m4+m3)"
#write <`name'.prc> "    +Z(1,m1,1,m2,0,m3,1,m4,1,m5)*num(1+m5+m3+m2)*num(-1+2*ep+"
#write <`name'.prc> "    ep*m5+ep*m3+ep*m2)*den(1+m5+m4+m3)*den(-1+2*ep+ep*m5+ep*m4+ep*m1)"
#write <`name'.prc> "    -Z(1,m1,1,m2,1,m3,1,m4,1,m5)*num(ep)*num(m3-m1)*den(-1+2"
#write <`name'.prc> "    *ep+ep*m5+ep*m4+ep*m1);"
#write <`name'.prc> "id  num(x?)*den(x?) = 1;"
#write <`name'.prc> "id  num(x?) = rat(x,1);"
#write <`name'.prc> "id  den(x?) = rat(1,x);"
#write <`name'.prc> "id  Z(1,m1?,1,m1?,1,m1?,0,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> "id  Z(1,m1?,1,m1?,0,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> "id  Z(1,m1?,0,m1?,1,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> ".sort:`name'-basis-1;"
#write <`name'.prc> "#elseif ( \`whichbasis\' == 2 ) "
#write <`name'.prc> "id  Z(0,m1?,1,m2?,1,m3?,1,m4?,1,m5?) = den(1+m5+m4+m3)*"
#write <`name'.prc> "        den(-1+3*ep+2*ep*m5+ep*m4+ep*m3+ep*m2+ep*m1)*("
#write <`name'.prc> "    +Z(1,m1,1,m2,1,m3,1,m4,0,m5)*num(1+m5+m3+m2)*"
#write <`name'.prc> "        num(-1+2*ep+ep*m5+ep*m3+ep*m2)"
#write <`name'.prc> "    -Z(1,m1,1,m2,1,m3,0,m4,1,m5)*num(1+m5+m2+m1)*"
#write <`name'.prc> "        num(-1+3*ep+2*ep*m5+ep*m4+ep*m3+ep*m2+ep*m1)"
#write <`name'.prc> "    +Z(1,m1,1,m2,1,m3,1,m4,1,m5)*num(1+m5+m2+m1)*"
#write <`name'.prc> "        num(1+m5+m4+m3)*num(ep) );"
#write <`name'.prc> "id  num(x?)*den(x?) = 1;"
#write <`name'.prc> "id  num(x?) = rat(x,1);"
#write <`name'.prc> "id  den(x?) = rat(1,x);"
#write <`name'.prc> "id  Z(1,m1?,1,m1?,1,m1?,0,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> "id  Z(1,m1?,1,m1?,0,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> "id  Z(1,m1?,0,m1?,1,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> ".sort:`name'-basis-2;"
#write <`name'.prc> "#endif"
#write <`name'.prc> "id  Z(1,m1?,1,m1?,1,m1?,0,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> "id  Z(1,m1?,1,m1?,0,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> "id  Z(1,m1?,0,m1?,1,m1?,1,m1?,n5?,m5?) = Z(0,m1,1,m1,1,m1,1,m1,n5,m5);"
#write <`name'.prc> "id Z(n1?,m1?,n2?,m2?,n3?,m3?,n4?,m4?,n5?neg0_,0) = Y(n1,m1,n2,m2,n3,m3,n4,m4,n5,0);"
#write <`name'.prc> "id Z(n1?,m1?,n2?,m2?,n3?,m3?,n4?neg0_,0,n5?,m5?) = Y(n1,m1,n2,m2,n3,m3,n4,0,n5,m5);"
#write <`name'.prc> "id Z(n1?,m1?,n2?,m2?,n3?neg0_,0,n4?,m4?,n5?,m5?) = Y(n1,m1,n2,m2,n3,0,n4,m4,n5,m5);"
#write <`name'.prc> "id Z(n1?,m1?,n2?neg0_,0,n3?,m3?,n4?,m4?,n5?,m5?) = Y(n1,m1,n2,0,n3,m3,n4,m4,n5,m5);"
#write <`name'.prc> "id Z(n1?neg0_,0,n2?,m2?,n3?,m3?,n4?,m4?,n5?,m5?) = Y(n1,0,n2,m2,n3,m3,n4,m4,n5,m5);"
#write <`name'.prc> ".sort:`name'-basis-3;"
#write <`name'.prc> "*"
#write <`name'.prc> "#endprocedure"

#endprocedure
