#procedure vertexA3Mp4
(
      + L9*sqrt2^-1*F^-3 * (
          - 4*tr(M,a(mu,nu),M(mu),M(nu))
          + 4*tr(M,a(nu,mu),M(mu),M(nu))
          + 4*tr(M,M(mu),M(nu),a(mu,nu))
          - 4*tr(M,M(mu),M(nu),a(nu,mu))
          )

       + L5*sqrt2^-1*F^-3 * (
          + 8/3*tr(Chi,a(mu),M(mu),M,M)
          - 4/3*tr(Chi,a(mu),M,M(mu),M)
          + 8/3*tr(Chi,a(mu),M,M,M(mu))
          + 4*tr(Chi,M(mu),a(mu),M,M)
          - 4*tr(Chi,M(mu),M,a(mu),M)
          + 8/3*tr(Chi,M(mu),M,M,a(mu))
          + 4*tr(Chi,M,a(mu),M(mu),M)
          - 4*tr(Chi,M,a(mu),M,M(mu))
          + 4*tr(Chi,M,M(mu),a(mu),M)
          - 4/3*tr(Chi,M,M(mu),M,a(mu))
          + 4*tr(Chi,M,M,a(mu),M(mu))
          + 8/3*tr(Chi,M,M,M(mu),a(mu))
          )

       + L4*sqrt2^-1*F^-3 * (
          + 16*tr(Chi,M,M)*tr(a(mu),M(mu))
          - 32/3*tr(M,a(mu),M,M(mu))*tr(Chi)
          + 16/3*tr(M,M,a(mu),M(mu))*tr(Chi)
          + 16/3*tr(M,M,M(mu),a(mu))*tr(Chi)
          )

       + L3*sqrt2^-1*F^-3 * (
          - 8*tr(a(mu),M(mu),M(nu),M(nu))
          - 8*tr(a(mu),M(nu),M(nu),M(mu))
          - 8*tr(a(nu),M(mu),M(mu),M(nu))
          - 8*tr(a(nu),M(nu),M(mu),M(mu))
          )

       + L2*sqrt2^-1*F^-3 * (
          - 16*tr(a(mu),M(nu))*tr(M(mu),M(nu))
          - 16*tr(a(nu),M(mu))*tr(M(mu),M(nu))
          )

       + L1*sqrt2^-1*F^-3 * (
          - 16*tr(a(mu),M(mu))*tr(M(nu),M(nu))
          - 16*tr(a(nu),M(nu))*tr(M(mu),M(mu))
          )

       + L0*sqrt2^-1*F^-3 * (
          - 16*tr(a(mu),M(nu),M(mu),M(nu))
          - 16*tr(a(nu),M(mu),M(nu),M(mu))
          )
)
#endprocedure
