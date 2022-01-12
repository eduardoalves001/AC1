# double f2c(double ft)
# { return (5.0 / 9.0 * (ft – 32.0)); }
	
#	ft = $f12
	
	.data
	.text
	.globl main
	
main:	addi $sp,$sp,-4
	sw $ra,0($sp)		# subrotina
	
	li $s0,212		# (temperatura em graus Fahrenheit a ser transformada para Celsius)
	mtc1 $s0,$f12
	cvt.d.w $f12,$f12	# f12 = ft
	
	jal f2c			# double f2c(double ft)
	
	mov.d $f12,$f0
	li $v0,3
	syscall			# print 
	
	lw $ra,0($sp)		# subrotina
	addi $sp,$sp,4
	
	jr $ra	
	
	
	
f2c:	li $t0,5
	li $t1,9
	li $t2,32
	
	mtc1 $t0,$f2
	mtc1 $t1,$f4
	mtc1 $t2,$f6
	
	cvt.d.w $f2,$f2		# f2 = 5.0
	cvt.d.w $f4,$f4		# f4 = 9.0
	cvt.d.w $f6,$f6		# f6 = 32.0
	
	sub.d $f0,$f12,$f6	# f0 = (ft – 32.0)
	div.d $f2,$f2,$f4	# f2 = 5.0 / 9.0
	mul.d $f0,$f2,$f0	# f0 = 5.0 / 9.0 * (ft – 32.0)
	
	jr $ra			# return f0
	
	
	
	
	
	
	