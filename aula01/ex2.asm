 	
 	
 	.data
 	.eqv read_int,5
 	.eqv print_int10,1
 	.eqv print_int16,34
 	.eqv print_intu10,36
str: 	.asciiz "\n"
 	.text
 	.globl main
 
main: 	ori $v0,$0,read_int	
 	syscall 		# chamada ao syscall "read_int()"
 	move $t0,$v0		# $t0 = $v0 = valor lido do teclado
 				# (valor de x pretendido)
 				
 	li $t2,8 		# $t2 = 8
 	add $t1,$t0,$t0 	# $t1 = $t0 + $t0 = x + x = 2 * x
 	sub $t1,$t1,$t2 	# $t1 = $t1 + $t2 = y = 2 * x - 8
 				#($t1 tem o valor calculado de y)

 	move $a0,$t1 		# $a0 = y
 	li $v0,print_int10	#
 	syscall 		# chamada ao syscall "print()"
 	
 	la $a0,str
 	li $v0,4
 	syscall
 	 	
 	or $a0,$0,$t1 		# $a0 = y
 	li $v0,print_int16 	#
 	syscall 		# chamada ao syscall "print()"
 	 	
 	la $a0,str
 	li $v0,4
 	syscall
 				
 	or $a0,$0,$t1 		# $a0 = y
 	li $v0,print_intu10 #
 	syscall 		# chamada ao syscall "print()"
 	jr $ra 			# fim do programa
