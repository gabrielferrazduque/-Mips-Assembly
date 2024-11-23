# a) a = (b + c) - (a + a)
add $t4, $t1, $t2       # $t4 = b + c
add $t5, $t0, $t0       # $t5 = a + a
sub $t0, $t4, $t5       # a = (b + c) - (a + a)

# b) b = (a + b) + (c + d)
add $t4, $t0, $t1       # $t4 = a + b
add $t5, $t2, $t3       # $t5 = c + d
add $t1, $t4, $t5       # b = (a + b) + (c + d)

# c) c = (c - a) - (b - a)
sub $t4, $t2, $t0       # $t4 = c - a
sub $t5, $t1, $t0       # $t5 = b - a
sub $t2, $t4, $t5       # c = (c - a) - (b - a)

# d) a = (a - b - c) - 2
sub $t4, $t0, $t1       # $t4 = a - b
sub $t4, $t4, $t2       # $t4 = a - b - c
addi $t0, $t4, -2       # a = (a - b - c) - 2

# e) b = (a + c + 2) - d
add $t4, $t0, $t2       # $t4 = a + c
addi $t4, $t4, 2        # $t4 = a + c + 2
sub $t1, $t4, $t3       # b = (a + c + 2) - d

# f) b = a + (c + 5)
addi $t4, $t2, 5        # $t4 = c + 5
add $t1, $t0, $t4       # b = a + (c + 5)

# g) c = 5 + (c + 2)
addi $t4, $t2, 2        # $t4 = c + 2
addi $t2, $t4, 5        # c = 5 + (c + 2)

# h) d = a + 2 + c + a
add $t4, $t0, $t0       # $t4 = a + a
add $t4, $t4, $t2       # $t4 = a + a + c
addi $t3, $t4, 2        # d = a + 2 + c + a

# i) c = a + b + b + c
add $t4, $t1, $t1       # $t4 = b + b
add $t4, $t4, $t0       # $t4 = a + b + b
add $t2, $t4, $t2       # c = a + b + b + c

# j) c = a - b + c + d
sub $t4, $t0, $t1       # $t4 = a - b
add $t4, $t4, $t2       # $t4 = a - b + c
add $t2, $t4, $t3       # c = a - b + c + d
