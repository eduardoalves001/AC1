 	
 	.data
 	.eqv MAX_STUDENTS,4
 	
st_array: .space 176

media:	.space 4
 	
 	.align 2
 	
max_g: 	.float -20.0
zero:	.float 0.0
 	
str1: 	.asciiz "\nMedia: "
str2: 	.asciiz "\nN.Mec: "
str3: 	.asciiz "\nPrimeiro Nome: "
str4: 	.asciiz "\nÚltimo Nome: "
str5: 	.asciiz "\nNota: "
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
	
	move $t0,$a0		# $t0 - *st
	move $t1,$a1		# $t1 - ns
	li $t2,0		# $t2 - i=0
	
	
r_for:	
	bge $t2,$t1,r_endfor
	
	li $v0,4
	la $a0,str2
	syscall			# print_string("N. Mec: ");
	
	li $v0,5
	syscall
	sw $v0,0($t0)		# st[i].id_number = read_int(); 
	
	li $v0,4
	la $a0,str3
	syscall			# print_string("Primeiro Nome: ");
	
	addi $t0,$t0,4
	
	li $v0,8
	move $a0,$t0
	li $v1,17
	syscall			# read_string(st[i].first_name, 17); 
	
	li $v0,4
	la $a0,str4
	syscall			# print_string("Ultimo Nome: "); 
	
	addi $t0,$t0,18
	
	li $v0,8
	move $a0,$t0
	li $v1,14
	syscall			# read_string(st[i].last_name, 14); 
	
	li $v0,4
	la $a0,str5
	syscall			# print_string("Nota: "); 
	
	addi $t0,$t0,18
	
	li $v0,6
	syscall
	s.s $f0,0($t0)
	
	addi $t0,$t0,4		# st[i].grade = read_float(); 
	
	addi $t2,$t2,1		# i++

	j r_for
	
r_endfor:
	jr $ra
	
	
max:	
	move $t0,$a0		# $t0 - *st
	move $t1,$a1		# $t1 - ns
	move $t2,$a2		# $t2 - *media
	l.s $f4,max_g		# $f4 - 20.0
	l.s $f6,zero		# $f6 - 0.0
	mul $t1,$t1,44		
	add $t1,$t1,$t0		# $t1 - (st + ns)
	move $t3,$a0		# $t3 - p = st
	
m_for:	
	bge $t3,$t1,m_endfor
	
	l.s $f8,40($t3)
	add.s $f6,$f6,$f8
	
	
m_endfor:
	
	
print_student: