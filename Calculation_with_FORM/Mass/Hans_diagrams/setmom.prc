#procedure setmom(P,NP)
* gives each field in a vertex a momentum `P'i
* up to NP fields may occur
#do i=1,`NP'
id,once phi?phiset(?a,i1?) = phi(?a,i1,`P'`i');
#enddo

#endprocedure
