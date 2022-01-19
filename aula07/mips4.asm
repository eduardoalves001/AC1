
	.include "mips3.asm"
	.data
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.text
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str
	jal strrev
	move $a0,$v0
	li $v0,4 # Print
	syscall
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $a0,0
	jr $ra