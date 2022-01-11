	
	.data
stg:	.word 72343		# offset - 0
	.asciiz "Napoleao"	# offset - 4
	.space 9
	.asciiz "Bonaparte"	# offset - 22
	.space 5
	.float 5.1		# offset - 40
	.align 2
	
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
	
	.text
	.globl main

main:	la $t0,stg

	li $v0,4
	la $a0,str1
	syscall			# print_string("\nN. Mec: ");
	
	lw $a0,0($t0)
	li $v0,1
	syscall			# print_intu10(stg.id_number);
	
	li $v0,4
	la $a0,str2
	syscall			# print_string("\nNome: ");
	
	addi $t1,$t0,22
	move $a0,$t1
	li $v0,4
	syscall			# print_string(stg.last_name);
	
	li $a0,','
	li $v0,11
	syscall			# print_char(',');
	
	addi $t1,$t0,4
	move $a0,$t1
	li $v0,4
	syscall			# print_string(stg.first_name);
	
	li $v0,4
	la $a0,str3
	syscall			# print_string("\nNota: ");
	
	l.s $f12,40($t0)
	li $v0,2
	syscall			# print_float(stg.grade);
	
	li $v0,0
	jr $ra			# return 0	




	
	