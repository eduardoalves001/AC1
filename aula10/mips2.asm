# $t0 = i 
# $f4 = xn
# $f6 = 0.0 then $f6 = aux
# $f12 = arg
# $f0 = return
	
	.data
num1:	.double 0.5 
	.text
	.globl main
	
main:	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	li $v0,7
	syscall
	
	mov.d $f12,$f0
	
	jal sqrt
	
	li $v0,3
	mov.d $f12,$f0
	syscall
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra
	
sqrt:	
	li $t0,1
	mtc1 $t0,$f4
	cvt.d.w $f4,$f4
	
	addi $t0,$t0,-1
	
	mtc1 $t0,$f6
	cvt.d.w $f6,$f6		
	
	c.le.d $f12,$f6
	bc1f do
	mov.d $f0,$f6		# else return xn=0.0
	jr $ra
	
do:	
	mov.d $f6,$f4
	div.d $f8,$f12,$f4	# val/xn
	add.d $f8,$f8,$f4	# xn + val/xn
	l.d $f10,num1		
	mul.d $f4,$f10,$f8	# xn = 0.5 * (xn + val/xn)
	
	addi $t0,$t0,1		# i++
	bge $t0,25,enddo	# while (++i < 25)
	c.eq.d $f4,$f6		# while (aux != xn)
	bc1t enddo
	j do
	
enddo:	mov.d $f0,$f4		# return xn
	jr $ra
	
	

