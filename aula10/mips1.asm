 
	.data 
	
str1:	.asciiz "Função que calcula a potência de um valor. (X^Y) \n \nValor de x: " 
str2:	.asciiz "Valor de y: "
	
	.text
	.globl main
	
main:	
	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,6
	syscall
	mov.s $f20,$f0
	
	li $v0,4
	la $a0,str2
	syscall
	
	li $v0,5
	syscall
	 
	move $a0,$v0
	mov.s $f12,$f20
	
	jal xtoy
	
	mov.s $f12,$f0
	li $v0,2
	syscall
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra
	
	
	
xtoy:	
	addi $sp,$sp,-32
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	s.s $f20,16($sp)
	sw $a0,12($sp)
	s.s $f12,24($sp)
	
	li $s0,1
	mtc1 $s0,$f20
	cvt.s.w $f20,$f20
	addi $s0,$s0,-1
	
xtoyfor:
	jal fabs
	lw $a0,12($sp)
	mtc1 $s0,$f4
	bge $s0,$v0,xtoyendfor
	ble $a0,$zero,xtoyelse
	mul.s $f20,$f20,$f12
	j xtoyendif
	
xtoyelse:
	div.s $f20,$f20,$f12
	
xtoyendif:
	addi $s0,$s0,1
	j xtoyfor
	
xtoyendfor:
	mov.s $f0,$f20
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	l.s $f20,16($sp)
	addi $sp,$sp,32
	jr $ra
	
	
	
fabs:	bge $a0,0,absendif
	mul $t0,$a0,-1
	or $a0,$0,$t0

absendif:
	move $v0,$a0
	jr $ra
	
	
	
	
