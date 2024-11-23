move		$a0, $t0			# $a0 = $t0 close $t0
li			$v0, 16				# syscall close file
syscall							# execute 
# Allocate 16 of bytes in memory
addi	$a0, $0, 16		# 16 bytes to be allocated
addi	$v0, $0, 9		# system call #9 - allocate memory
syscall					# execute 
li			$a0, 4				# allocate 4 bytes
li			$v0, 9				# syscall allocate memory
syscall							# execute  
# Allocate 16 of bytes in memory
addi	$a0, $0, 16		# 16 bytes to be allocated
addi	$v0, $0, 9		# system call #9 - allocate memory
syscall					# execute 
move		$a0, $t0			# $a0 = $t0 write $t0
la			$a1, buffer			# $a1 = buffer
li			$a2, 4				# 4 bytes to write
li			$v0, 15				# syscall write file
syscall							# execute
move		$t0, $v0			# copy number of bytes write 
move		$a0, $t0			# $a0 = $t0 write $t0
la			$a1, buffer			# $a1 = buffer
li			$a2, 4				# 4 bytes to write
li			$v0, 15				# syscall write file
syscall							# execute
move		$t0, $v0			# copy number of bytes write 
move		$a0, $t0			# $a0 = $t0 write $t0
la			$a1, buffer			# $a1 = buffer
li			$a2, 4				# 4 bytes to write
li			$v0, 15				# syscall write file
syscall							# execute
move		$t0, $v0			# copy number of bytes write 
la			$a0, str			# $a0 = str
li			$a1, 1				# flag 1
li			$a2, 0				# mode 0
li			$v0, 13				# syscall open file
syscall							# execute
move		$t0, $v0			# copy file descriptor 
move		$a0, $t0			# $a0 = $t0 close $t0
li			$v0, 16				# syscall close file
syscall							# execute 
addi		$v0, $0, 7		# system call #7 - input double
syscall						# execute 
addi		$v0, $0, 4		# system call #4 - print string
la		$a0, string
syscall						# execute 
addi		$v0, $0, 2		# system call #2 - print float
mov.s		$f12, variable
syscall						# execute 
move		$a0, $t0			# $a0 = $t0
li			$v0, 1				# syscall print int
syscall							# execute 
move		$a0, $t0			# $a0 = $t0
li			$v0, 4				# syscall print str
syscall							# execute 
la			$a0, str			# $a0 = str
li			$v0, 4				# syscall print str
syscall							# execute 
addi		$v0, $0, 3		# system call #3 - print double
mov.d		$f12, variable
syscall						# execute 
addi		$v0, $0, 7		# system call #7 - input double
syscall						# execute 
addi		$v0, $0, 2		# system call #2 - print float
mov.s		$f12, variable
syscall						# execute 
la			$a0, str			# $a0 = str
li			$a1, 0				# flag 0
li			$a2, 0				# mode 0
li			$v0, 13				# syscall open file
syscall							# execute
move		$t0, $v0			# copy file descriptor 
 addi		$v0, $0, 8		# system call #8 - input string
 syscall						# execute 
 # FUN foo
 # ARGS:
 # $a0: arg1
 # $a1: arg2
 # $a2: arg3
 # RETURN $v0: 0
 foo:
 	addi		$sp, $sp, -20			# $sp -= 20
    sw			$s0, 16($sp)
    sw			$s1, 12($sp)
    sw			$s2, 8($sp)
    sw			$s3, 4($sp)
    sw			$ra, 0($sp)
 
    
 
    lw			$s0, 16($sp)
    lw			$s1, 12($sp)
    lw			$s2, 8($sp)
    lw			$s3, 4($sp)
    lw			$ra, 0($sp)
    addi		$sp, $sp, 20			# $sp += 20
 
    move 		$v0, $zero			# $v0 = $zero
    jr			$ra					# jump to $ra
 
 # END FUN foo  
 addi		$v0, $0, 4		# system call #4 - print string
 la		$a0, string
 syscall						# execute
