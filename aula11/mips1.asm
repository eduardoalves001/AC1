	
	.data

#  pre-armazenados em memória
#stg:	.word 72343		# offset - 0
#	.asciiz "Napoleão"	# offset - 4
#	.space 9
#	.asciiz "Bonaparte"	# offset - 22
#	.space 5
#	.float 5.1		# offset - 40
	
stg:	.space 44
	.align 2
	
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
str4: 	.asciiz "\nÚltimo Nome: "
str5:	.asciiz "\n\n"
	
	.text
	.globl main

main:	
	##		store			##
	
	la $t0,stg
		
	li $v0,4
	la $a0,str1
	syscall			# print_string("\nN. Mec: ");
	
	li $v0,5
	syscall
	sw $v0,0($t0)		# store id number 
	
	li $v0,4
	la $a0,str2
	syscall			# print_string("\nNome: ");
	
	addi $t0,$t0,4
	
	li $v0,8
	move $a0,$t0
	li $a1,17
	syscall			# store first name
	
	addi $t0,$t0,18
	
	li $v0,4
	la $a0,str4
	syscall			# print_string("\nÚltimo Nome: ");
	
	li $v0,8
	move $a0,$t0
	li $a1,14
	syscall			# store last name
	
	addi $t0,$t0,18
	
	li $v0,4
	la $a0,str3
	syscall			# print_string("\nNota: ");
	
	li $v0,6
	syscall
	s.s $f0,0($t0)		# store nota
	
	li $v0,4
	la $a0,str5
	syscall			# \n\n
	

	##		printing 		##

	la $t0,stg

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

	li $a0,' '
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




	
	
