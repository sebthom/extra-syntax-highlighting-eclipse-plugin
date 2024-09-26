program SimpleExample
    implicit none

    integer :: i, n
    real :: sum, average
    real, dimension(100) :: numbers

    ! Ask the user for the number of elements
    print *, 'Enter the number of elements (up to 100):'
    read *, n

    if (n > 100) then
        print *, 'Number exceeds the limit of 100.'
        stop
    end if

    ! Get the list of numbers from the user
    print *, 'Enter ', n, ' numbers:'
    do i = 1, n
        read *, numbers(i)
    end do

    ! Calculate the sum of the numbers
    sum = 0.0
    do i = 1, n
        sum = sum + numbers(i)
    end do

    ! Calculate the average
    average = sum / n

    ! Print the results
    print *, 'Sum of the numbers is: ', sum
    print *, 'Average of the numbers is: ', average

end program SimpleExample
