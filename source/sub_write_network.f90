subroutine sub_write_network
    use sub_variables
    implicit none
    character(len=*), parameter :: new_path = 'C:/Users/86172/Desktop/project/IC_Networks/'
    open(unit=110, file=new_path//'newnetwork_node1.dat', status='replace')
    open(unit=120, file=new_path//'newnetwork_node2.dat', status='replace')
    open(unit=130, file=new_path//'newnetwork_link1.dat', status='replace')
    open(unit=140, file=new_path//'newnetwork_link2.dat', status='replace')
	write(110,'(1i7)', advance='no', iostat=io) f_np
	write(110,'(2e13.6)', advance='no', iostat=io) f_lx, f_ly
	write(110,'(1e13.6)') f_lz
	do i = 1, f_np
		write(110,'(1i6)', advance='no', iostat=io) f_ip(i)
		write(110,'(3e13.6)', advance='no', iostat=io) f_xp(i), f_yp(i), f_zp(i)
		write(110,'(1i4)', advance='no', iostat=io) f_connp(i)
		write(110,'(202i7)') (f_ipnearp(i,j), j = 1, f_connp(i)), f_inp(i), f_outp(i), (f_itnearp(i,j), j = 1, f_connp(i))

		write(120,'(1i6)', advance='no', iostat=io) f_ip(i)
		write(120,'(3e13.6)', advance='no', iostat=io) f_vp(i), f_rp(i), f_gp(i)
		write(120,'(1e13.6)') f_vp_clay(i)
	end do
	write(130,'(3i7)') f_nt
	do i = 1, f_nt
		write(130,'(3i6)', advance='no', iostat=io) f_it(i)
		write(130,'(3i7)', advance='no', iostat=io) f_p1(i), f_p2(i)
		write(130,'(2e13.6)', advance='no', iostat=io) f_rt(i), f_gt(i)
		write(130,'(1e13.6)') f_lt_tot(i)
		
		write(140,'(3i6)', advance='no', iostat=io) f_it(i)
		write(140,'(3i7)', advance='no', iostat=io) f_p1(i), f_p2(i)
		write(140,'(4e13.6)', advance='no', iostat=io) f_lp1(i), f_lp2(i), f_lt(i), f_vt(i)
		write(140,'(1e13.6)') f_vt_clay(i)
	end do
	close(110)
    close(120)
    close(130)
    close(140)
end subroutine sub_write_network