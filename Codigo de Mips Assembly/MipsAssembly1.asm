# a) a = b + c
add $t0, $t1, $t2

# b) a = a + b
add $t0, $t0, $t1

# c) a = b - c
sub $t0, $t1, $t2

# d) a = a + a
add $t0, $t0, $t0

# e) b = b + 1
addi $t1, $t1, 1

# f) c++
addi $t2, $t2, 1

# g) b = c + 10
addi $t1, $t2, 10

# h) c = c - 20
addi $t2, $t2, -20

# i) a = a - 23
addi $t0, $t0, -23

# j) a = 2
li $t0, 2
