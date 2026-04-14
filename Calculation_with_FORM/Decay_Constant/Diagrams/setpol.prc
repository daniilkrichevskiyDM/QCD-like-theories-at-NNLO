#procedure setpol(V,NP)
* gives vector field in a vertex a polarization `A'i
* up to NP fields may occur
#do i=1,`NP'
id,once phi?phisetVectors(?a,i1?,p1?) = phi(?a,i1,`V'`i',p1);
#enddo

#endprocedure


phiV,phiA