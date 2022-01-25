 	
 	.data
 	.eqv MAX_STUDENTS,4
 	
st_array: .space 176

media:	.space 4
 	
 	.align 2
 	
str1: 	.asciiz "\nMedia: "
 	.text
 	.globl main
 	
main:	
	addi $sp,$sp,-8		
	sw $s0,0($sp)
	sw $ra,4($sp)		# subrotina
	
	la $a0,st_array
	li $a1,MAX_STUDENTS
	jal read_data
	
	la $a0,st_array
	li $a1,MAX_STUDENTS
	la $a2,media
	jal max
	
	move $s0,$v0
	
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,2
	l.s $f12,media
	syscall
	
	move $a0,$s0
	jal print_student 
	
	lw $s0,0($sp)	
	lw $ra,4($sp)
	addi $sp,$sp,8		# subrotina
	
	li $v0,0
	jr $ra
	
	

read_data:

max:

print_student: