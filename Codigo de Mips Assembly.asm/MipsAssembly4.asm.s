Proc1:
    move $t0, $a2        # $t0 = i
    move $t1, $a3        # $t1 = j

Loop:
    mul $t2, $t0, 3      # $t2 = 3 * i
    mul $t3, $t1, 5      # $t3 = 5 * j
    add $t2, $t2, $t3    # $t2 = 3i + 5j
    sll $t2, $t2, 2      # $t2 *= 4 (cada elemento ocupa 4 bytes)
    add $t2, $t2, $a1    # $t2 = endereço de Vetor[3i + 5j]

    lw $t4, 0($t2)       # Carrega Vetor[3i + 5j] em $t4

    mul $t3, $t1, 4      # $t3 = 4 * j
    sll $t3, $t3, 2      # $t3 *= 4
    add $t3, $t3, $a0    # $t3 = endereço de Matriz[4j]

    lw $t5, 0($t3)       # Carrega Matriz[4j] em $t5

    ble $t4, $t5, Exit   # Se Vetor[3i + 5j] <= Matriz[4j], sair do loop

    # Chamada de Proc2
    move $a0, $t4        # $a0 = Vetor[3i + 5j]
    jal Proc2
    move $t6, $v0        # $t6 = retorno de Proc2

    sw $t6, 0($t3)       # Matriz[4j] = Proc2(Vetor[3i + 5j])

    # Chamada de Proc3
    move $a0, $t1        # $a0 = j
    jal Proc3
    add $t1, $t0, $v0    # j = i + Proc3(j)

    j Loop               # Repetir o loop

Exit:
    move $v0, $t1        # Retornar j
    jr $ra
