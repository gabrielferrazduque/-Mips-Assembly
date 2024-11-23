 var1: .word 23

 
lw $t0, var1   # Carrega valor de var1 em $t0.
sw $t1, var1   # Salva valor de $t1 em var1. 

lw $t0, 4($sp) # Carrega valor no endereço ($sp + 4).
sw $t1, -4($sp) # Salva valor em ($sp - 4).   

add $t0, $t1, $t2  # t0 = t1 + t2
sub $t0, $t1, $t2  # t0 = t1 - t2
mul $t0, $t1, $t2  # t0 = t1 * t2
div $t0, $t1, $t2  # t0 = t1 / t2

 and $t0, $t1, $t2  # t0 = t1 AND t2
or  $t0, $t1, $t2  # t0 = t1 OR t2
xor $t0, $t1, $t2  # t0 = t1 XOR t2

beq $t0, $t1, label  # Se $t0 == $t1, salta para label.
bne $t0, $t1, label  # Se $t0 != $t1, salta para label.
j label              # Salta para label.
li $v0, 1       # Código para imprimir int.
move $a0, $t2   # Valor a ser impresso.
syscall         # Chama o sistema.
.data
msg: .asciiz "Hello!\n"

.text
li $v0, 4       # Código para imprimir string.
la $a0, msg     # Endereço da string.
syscall         # Chama o sistema.
li $v0, 10      # Código para terminar.
syscall         # Chama o sistema.
.data
msg: .asciiz "Resultado: "
var: .word 42

.text
main:
    li $v0, 4          # Imprimir string.
    la $a0, msg        # Endereço da string.
    syscall
    
    lw $t0, var        # Carregar valor de var.
    li $v0, 1          # Imprimir inteiro.
    move $a0, $t0      # Passar valor para impressão.
    syscall
    
    li $v0, 10         # Encerrar programa.
    syscall
