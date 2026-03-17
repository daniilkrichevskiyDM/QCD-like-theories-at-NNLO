#procedure vertex4Mp4()
(
       + L8*F^-4 * (
          + 2/3*tr(Chi,Chi,M,M,M,M)
          + 8/3*tr(Chi,M,Chi,M,M,M)
          + 2*tr(Chi,M,M,Chi,M,M)
          )

       + L7*F^-4 * (
          + 16/3*tr(Chi,M)*tr(Chi,M,M,M)
          )

       + L6*F^-4 * (
          + 4/3*tr(Chi)*tr(Chi,M,M,M,M)
          + 4*tr(Chi,M,M)^2
          )

       + L5*F^-4 * (
          - 4/3*tr(Chi,M(mu),M(mu),M,M)
          + 2/3*tr(Chi,M(mu),M,M(mu),M)
          - 2/3*tr(Chi,M(mu),M,M,M(mu))
          - 2*tr(Chi,M,M(mu),M(mu),M)
          + 2/3*tr(Chi,M,M(mu),M,M(mu))
          - 4/3*tr(Chi,M,M,M(mu),M(mu))
          )

       + L4*F^-4 * (
          - 4*tr(Chi,M,M)*tr(M(mu),M(mu))
          + 4/3*tr(M,M(mu),M,M(mu))*tr(Chi)
          - 4/3*tr(M,M,M(mu),M(mu))*tr(Chi)
          )

       + L3*F^-4 * (
          + 4*tr(M(mu),M(mu),M(nu),M(nu))
          )

       + L2*F^-4 * (
          + 4*tr(M(mu),M(nu))^2
          )

       + L1*F^-4 * (
          + 4*tr(M(mu),M(mu))*tr(M(nu),M(nu))
          )

       + L0*F^-4 * (
          + 4*tr(M(mu),M(nu),M(mu),M(nu))
          )
)
#endprocedure
