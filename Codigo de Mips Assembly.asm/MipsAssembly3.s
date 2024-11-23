# a) a = a + a + a + a
add $t4, $t0, $t0       # $t4 = a + a
add $t0, $t4, $t4       # a = a + a + a + a

# b) a = 2a + 2a
add $t4, $t0, $t0       # $t4 = 2a
add $t0, $t4, $t4       # a = 2a + 2a

# c) a = 4a
sll $t0, $t0, 2         # a = 4a (shift left logical)

# d) a = array[0]
lw $t0, 0($s0)          # Carrega array[0] em a

# e) a = array[2]
lw $t0, 8($s0)          # Carrega array[2] em a (2 * 4 bytes)

# f) b = array[10]
lw $t1, 40($s0)         # Carrega array[10] em b (10 * 4 bytes)

# g) c = array[i]
sll $t4, $t3, 2         # $t4 = i * 4
add $t4, $s0, $t4       # Endereço de array[i]
lw $t2, 0($t4)          # Carrega array[i] em c

# h) c = array[2i]
sll $t4, $t3, 3         # $t4 = 2i * 4
add $t4, $s0, $t4       # Endereço de array[2i]
lw $t2, 0($t4)          # Carrega array[2i] em c

# i) array[0] = a
sw $t0, 0($s0)          # Armazena a em array[0]

# j) array[2] = b
sw $t1, 8($s0)          # Armazena b em array[2]

# l) array[i] = c
sll $t4, $t3, 2         # $t4 = i * 4
add $t4, $s0, $t4       # Endereço de array[i]
sw $t2, 0($t4)          # Armazena c em array[i]

# m) array[0] = array[2] + c
lw $t4, 8($s0)          # $t4 = array[2]
add $t4, $t4, $t2       # $t4 = array[2] + c
sw $t4, 0($s0)          # Armazena o resultado em array[0]

# n) array[i] = array[2] + (c + d)
lw $t4, 8($s0)          # $t4 = array[2]
add $t5, $t2, $t3       # $t5 = c + d
add $t4, $t4, $t5       # $t4 = array[2] + (c + d)
sll $t5, $t3, 2         # $t5 = i * 4
add $t5, $s0, $t5       # Endereço de array[i]
sw $t4, 0($t5)          # Armazena o resultado em array[i]
