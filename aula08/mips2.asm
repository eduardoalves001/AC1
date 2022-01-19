# teste da função atoi()

	.include "mips1.asm"
	.data
str:	.ascii "2020 e 2024 sao anos bissextos"
strb:	.asciiz "101101"
	.text
	.globl main
	
main:	addiu $sp,$sp,-4	
	sw $ra,0($sp)
	
	la $a0,str
	jal atoi		# atoi(str)
	
	# la $a0,strb
	# jal atoi2		
	
	move $a0,$v0
	li $v0,1
	syscall		# print_int10( atoi(str) )
	
	li $a0,0		# return 0; }
		
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra
	
	