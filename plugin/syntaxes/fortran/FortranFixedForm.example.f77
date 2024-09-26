      PROGRAM SimpleExample
      IMPLICIT NONE

      INTEGER i, n
      REAL sum, average
      REAL numbers(100)

      PRINT *, 'Enter the number of elements (up to 100):'
      READ *, n

      IF (n .GT. 100) THEN
         PRINT *, 'Number exceeds limit of 100.'
         STOP
      END IF

      PRINT *, 'Enter ', n, ' numbers:'
      DO 10 i = 1, n
         READ *, numbers(i)
10    CONTINUE

      sum = 0.0
      DO 20 i = 1, n
         sum = sum + numbers(i)
20    CONTINUE

      average = sum / n

      PRINT *, 'Sum of the numbers is: ', sum
      PRINT *, 'Average of the numbers is: ', average

      END
