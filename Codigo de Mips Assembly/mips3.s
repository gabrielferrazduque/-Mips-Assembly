loop :lw $t3, 0($t0) 
      lw $t4, 4($t0) 
      add $t2,$t3,$t4 
      sw $t2, 8($t0) 
      addi $t0,$t0,4 
      addi $t1,$t1,-1 
   loop: bgtz $tl1, loop
