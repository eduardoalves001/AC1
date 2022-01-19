# i: $t0

 	.eqv SIZE,3
 	.data
array:	.word str1,str2,str3	# 1 word = 4 Bytes
str1: 	.asciiz "Array "
str2: 	.asciiz "de "
str3: 	.asciiz "ponteiros\n"
 	.text
 	.globl main
 	
main:	li $t0,0
	
for: 	bge $t0,SIZE,endf
 	la $t1,array 	# $t1 = &array[0]
 	sll $t2,$t0,2 	# array de word, ou seja para percorrer temos fazer um shift de 2 
 			# que equivale a uma multiplicacão por 4 (4 em 4 Bytes)
 			
 	addu $t2,$t2,$t1 	# $t2 = &array[i]
 	
 	lw  $a0,0($t2) 	# $a0 = array[i]
 	li $v0,4
 	syscall
 	
 	addi $t0,$t0,1
 	j for
 	
endf:	jr $ra



