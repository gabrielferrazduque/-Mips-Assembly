addi		$v0, $0, 8		# system call #8 - input string
syscall						# execute 
addi		$v0, $0, 7		# system call #7 - input double
syscall						# execute 
addi		$v0, $0, 8		# system call #8 - input string
syscall						# execute 
addi		$v0, $0, 8		# system call #8 - input string
syscall						# execute 
addi		$v0, $0, 5		# system call #5 - input int
syscall						# execute 
addi		$v0, $0, 6		# system call #6 - input float
syscall						# execute 
addi		$v0, $0, 1		# system call #1 - print int
add		$a0, $0, variable
syscall						# execute 
addi		$v0, $0, 1		# system call #1 - print int
add		$a0, $0, variable 
addi		$v0, $0, 1		# system call #1 - print int
add		$a0, $0, variable
syscall						# execute 
add 
addi 
# Allocate 16 of bytes in memory
addi	$a0, $0, 16		# 16 bytes to be allocated
addi	$v0, $0, 9		# system call #9 - allocate memory
syscall					# execute 
# Allocate 16 of bytes in memory
addi	$a0, $0, 8		# 8 bytes to be allocated
addi	$v0, $0, 5		# system call #5 - allocate memory
syscall					# execute
syscall						# execute