 .data
 .eqv read_int,5
 .eqv print_int10,1
 .eqv print_int16,34
 .eqv print_intu10,36
 .text
 .globl main
 
main: 	ori $v0,$0,read_int	#
 	syscall 		# chamada ao syscall "read_int()"
 	or $t0,$0,$v0	# $t0 = $v0 = valor lido do teclado
 			# (valor de x pretendido)
 	ori $t2,$0,8 	# $t2 = 8
 	add $t1,$t0,$t0 	# $t1 = $t0 + $t0 = x + x = 2 * x
 	sub $t1,$t1,$t2 	# $t1 = $t1 + $t2 = y = 2 * x - 8
 			#($t1 tem o valor calculado de y)
 			
 	or $a0,$0,$t1 	# $a0 = y
 	ori $v0,$0,print_int10	#
 	syscall 		# chamada ao syscall "print()"
 	
 	or $a0,$0,$t1 	# $a0 = y
 	ori $v0,$0,print_int16 	#
 	syscall 		# chamada ao syscall "print()"
 			#
 	or $a0,$0,$t1 	# $a0 = y
 	ori $v0,$0,print_intu10 	#
 	syscall 		# chamada ao syscall "print()"
 	jr $ra 		# fim do programa