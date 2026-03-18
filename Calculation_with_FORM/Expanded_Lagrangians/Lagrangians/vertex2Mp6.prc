#procedure vertex2Mp6()
(
       + KK42*F^-4 * (
          - 16*tr(Chi)*tr(Chi,M)^2
          )

       + KK41*F^-4 * (
          - 16*tr(Chi,M)*tr(Chi,Chi,M)
          )

       + KK40*F^-4 * (
          - 8*tr(Chi)*tr(Chi,Chi,M,M)
          - 8*tr(Chi)*tr(Chi,M,Chi,M)
          )

       + KK39*F^-4 * (
          - 4*tr(Chi,Chi,Chi,M,M)
          - 12*tr(Chi,Chi,M,Chi,M)
          )

       + KK27*F^-4 * (
          - 24*tr(Chi)^2*tr(Chi,M,M)
          )

       + KK26*F^-4 * (
          - 8*tr(Chi)*tr(Chi,Chi,M,M)
          - 8*tr(Chi)*tr(Chi,M,Chi,M)
          - 8*tr(Chi,M,M)*tr(Chi,Chi)
          )

       + KK25*F^-4 * (
          - 12*tr(Chi,Chi,Chi,M,M)
          - 12*tr(Chi,Chi,M,Chi,M)
          )

       + KK24*F^-4 * (
          + 8*tr(Chi,M(mu))^2
          )

       + KK23*F^-4 * (
          + 8*tr(Chi,M(mu),Chi,M(mu))
          )

       + KK22*F^-4 * (
          + 8*tr(Chi)^2*tr(M(mu),M(mu))
          )

       + KK21*F^-4 * (
          + 8*tr(Chi,Chi)*tr(M(mu),M(mu))
          )

       + KK20*F^-4 * (
          + 8*tr(Chi)*tr(Chi,M(mu),M(mu))
          )

       + KK19*F^-4 * (
          + 8*tr(Chi,Chi,M(mu),M(mu))
          )

       + KK18*F^-4 * (
          + 16*tr(Chi)*tr(M(mu,nu),M(mu,nu))
          )

       + KK17*F^-4 * (
          + 16*tr(Chi,M(mu,nu),M(mu,nu))
          )
)
#endprocedure
