# i : $t0
# j : $t1
# array[i][j] : $t3

 	.eqv SIZE,3
 	.data
array:	.word str1,str2,str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"
str5:	.asciiz ": "
str4:	.asciiz "\nString #"
 	.globl main
 	.text

 	
main:	li $t0,0

while1:	bge $t0,SIZE,endw1

	la $a0,str4
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	
	la $a0,str5
	li $v0,4
	syscall
	
	li $t1,0	

while2:
 	la $t3,array 	# $t3 = &array[0]
 	sll $t2,$t0,2 	# 
 	addu $t3,$t3,$t2	# $t3 = &array[i]
 	lw $t3,0($t3)	# $t3 = array[i] = &array[i][0]
 	addu $t3,$t3,$t1 	# $t3 = &array[i][j]
 	lb $t3,0($t3) 	# $t3 = array[i][j]
 	
 	beqz $t3, endw2
 	
 	move $a0,$t3
 	li $v0,11
 	syscall
 	
 	li $a0,'-'
 	li $v0,11
 	syscall
 	
 	addi $t1,$t1,1
 	j while2
endw2:
 	addi $t0,$t0,1
 	j while1
 	
endw1:	jr $ra


