#procedure vertexS2Mp4
(
      + L8*F^-2 * (
          - 8*tr(Chi,M,M,sext)*B0
          - 16*tr(Chi,M,sext,M)*B0
          - 8*tr(Chi,sext,M,M)*B0
          )

       + L7*F^-2 * (
          - 32*tr(M,sext)*tr(Chi,M)*B0
          )

       + L6*F^-2 * (
          - 16*tr(M,M,sext)*tr(Chi)*B0
          - 16*tr(sext)*tr(Chi,M,M)*B0
          )

       + L5*F^-2 * (
          + 8*tr(sext,M(mu),M(mu))*B0
          )

       + L4*F^-2 * (
          + 8*tr(sext)*tr(M(mu),M(mu))*B0
          )
)
#endprocedure
