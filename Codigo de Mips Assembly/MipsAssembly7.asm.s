Proc1:
    addi $sp, $sp, -8     # Reserva espaço na pilha
    sw $ra, 4($sp)        # Salva o endereço de retorno
    sw $s0, 0($sp)        # Salva $s0

    li $t0, 3             # a = 3
    li $t1, 6             # b = 6

    lw $t2, 16($a1)       # Vetor[4] -> $t2
    ble $t1, $t2, EndIf   # Se b <= Vetor[4], fim do if

Loop:
    lw $t3, 20($a0)       # Matriz[5] -> $t3

    move $a0, $t0         # Parametros Proc2
    move $a1, $a3
    jal Proc2             # Chamada de Proc2

    move $a0, $t1         # Parametro Proc3
    jal Proc3             # Chamada de Proc3

    mul $t4, $v0, $v1     # $t4 = Proc2 * Proc3
    ble $t3, $t4, EndLoop # Se Matriz[5] <= Produto, sair do loop

    add $t0, $t3, $t1     # a = Matriz[5] + b
    j Loop

EndLoop:
    div $t5, $v0, $v1     # Vetor[4] = Proc3 / Proc2
    sw $t5, 16($a1)

EndIf:
    lw $ra, 4($sp)        # Restaura $ra
    lw $s0, 0($sp)        # Restaura $s0
    addi $sp, $sp, 8      # Limpa pilha
    move $v0, $t0         # Retorna a
    jr $ra
