# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx


atoi: 	li $v0,0 		# res = 0; 
	li $t2,0

while: 	lb $t0,0($a0) 	# while(*s >= 0) && (*s <= 1)
 	blt $t0,'0',endw 	#
 	bgt $t0,'1',endw 	# {
 	
 	sub $t1,$t0,'0' 	# digit = *s – '0'
 	addiu $a0,$a0,1 	# s++;
 	sllv $v0,$v0,$t2 	# res = 10 * res;
 	add $v0,$v0,$t1 	# res = 10 * res + digit;
 	addi $t2,$t2,1	# 
 	j while 		# }
 	
endw:	jr $ra 		# termina sub-rotina
 