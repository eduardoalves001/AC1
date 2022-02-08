

	.data
	
	.align 3
array:	.space 80
str:	.asciiz "\nAverage: "
	.eqv SIZE,10
	
	.text
	.globl main
	
main:	
	addi $sp,$sp,-20
	sw $s0,0($sp)
	sw $s1,4($sp)
	s.d $f20,8($sp)
	sw $ra,16($sp)		# subrotina 
	
	la $s0,array		# load_address do array(1º elem)
	li $s1,0
	

for:	
	bge $s1,SIZE,endfor
	
	li $v0,5		# read_int
	syscall		
	
	mtc1 $v0,$f20
	cvt.d.w $f20,$f20	# (double)read_int
	
	s.d $f20,0($s0)		# store it in the array
	
	addi $s0,$s0,8		# proximo elem do array (double ocupa 8 bytes de memória)
	addi $s1,$s1,1		# i++
	
	j for
	
	
endfor:	
	
	li $v0,4
	la $a0,str
	syscall
	
	la $a0,array
	li $a1,SIZE
	
	jal avrg
	
	mov.d $f12,$f0
	li $v0,3
	syscall
	
	lw $s0,0($sp)
	lw $s1,4($sp)
	l.d $f20,8($sp)
	lw $ra,16($sp)		
	addi $sp,$sp,20		# subrotina
	
	li $v0,0
	jr $ra




avrg:	
	move $t0,$a0		# $t0 = *array
	move $t1,$a1		# $t1 = n
	
	move $t2,$a1		# $t2 = i=n
	
	li $t3,0
	mtc1 $t3,$f4
	cvt.d.w $f4,$f4		# $f4 = sum=0.0
	
	
a_for:	
	ble $t2,0,a_efor	# endloop se i=<0 
	
	l.d $f6,0($t0)		# load elem array[i]
	
	add.d $f4,$f4,$f6	# sum +=...
	
	addi $t0,$t0,8		# array[i++];
	addi $t2,$t2,-1
	
	j a_for			# jump for


a_efor:	
	mtc1 $t1,$f6
	cvt.d.w $f6,$f6		# (double)n
		
	div.d $f0,$f4,$f6	# divisão da média
	
	jr $ra



