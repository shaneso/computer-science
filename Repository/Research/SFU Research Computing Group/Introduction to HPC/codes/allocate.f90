program createArrays

  implicit none
  include 'mpif.h'
  integer :: ierr, size, rank, n, i, j, k, m
  integer, dimension(MPI_STATUS_SIZE) :: status
  real*4:: x, y, z, r
  real*8 :: total
  real*4, parameter :: r0 = 0.4
  real*4, dimension(:,:,:), allocatable :: a
  integer, dimension(10), parameter :: scale = (/ 100,200,500,800,1,1,1,1,1,1 /)

  call mpi_init(ierr)
  call mpi_comm_size(mpi_comm_world, size, ierr)
  call mpi_comm_rank(mpi_comm_world, rank, ierr)

  n = scale(rank+1)
  write(*,"(a,i2,a,i3,a,i5,a,f12.1,a)") 'hello from', rank, ' of', size, ' with n =', n, ' using', 4.*n**3/1024**2, ' MB'
  allocate(a(n,n,n))

  do i = 1, n
     x = (float(i)-0.5)/float(n)
     do j = 1, n
        y = (float(j)-0.5)/float(n)
        do k = 1, n
           z = (float(k)-0.5)/float(n)
           r = sqrt((x-0.5)**2+(y-0.5)**2)
           a(i,j,k) = exp(-((z-0.5)**2+(r-r0)**2)**0.5)
        enddo
     enddo
  enddo

  total = 0
  do i = 1, n
     do j = 1, n
        do k = 1, n
           do m = 1, 5
              total = total + a(i,j,k)**(0.9+m/100.)   ! something CPU-intensive
           enddo
        enddo
     enddo
  enddo

  print *, 'result on', rank, 'is', total / n**3

  deallocate(a)
  call mpi_finalize(ierr)

end program createArrays
