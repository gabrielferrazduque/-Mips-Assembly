DataCompare:
    li $t0, 0            # Contador de elementos
    add $t1, $zero, $a1  # Ponteiro para A[]
    add $t2, $zero, $a2  # Ponteiro para B[]
    add $t3, $zero, $a3  # Ponteiro para C[]

Loop:
    lw $t4, 0($t1)       # Carrega elemento de A[]
    lw $t5, -4($t2)      # Carrega elemento de B[]

    beq $t4, 5, Exit     # Parar se A[i] == 5
    beq $t5, 5, Exit     # Parar se B[i] == 5
    bge $t0, 100, Exit   # Parar se total >= 100

    blt $t4, $t5, CopyB  # Se A[i] < B[i], copia B
    sw $t4, 0($t3)       # Caso contrário, copia A
    j Next

CopyB:
    sw $t5, 0($t3)

Next:
    addi $t0, $t0, 1     # Incrementa contador
    addi $t1, $t1, 4     # Próximo elemento de A[]
    addi $t2, $t2, -4    # Elemento anterior de B[]
    addi $t3, $t3, 4     # Próxima posição em C[]
    j Loop

Exit:
    jr $ra
