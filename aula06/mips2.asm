# p : $t1
# pultimo: $t2
# *p : $t3

 	.eqv SIZE,3
 	.data
array:	.word str1,str2,str3
str1: 	.asciiz "Array "
str2: 	.asciiz "de "
str3: 	.asciiz "ponteiros\n"
 	.text
 	.globl main
 	
main:	la $t1,array 	# $t1 = p = &array[0] = array
 	li $t0,SIZE 		#
 	sll $t0,$t0,2 	#
 	addu $t2,$t1,$t0 	# $t2 = pultimo = array + SIZE
 	
for: 	bgeu $t1,$t2,endf	# for(; p < pultimo; p++)
	lw $t3,0($t1)	# $t3 = *p

	move $a0,$t3 	
 	li $v0,4
 	syscall		# print_string(*p)
 	
	addiu $t1,$t1,4	# $t1 = p++
	j for
	
endf:	jr $ra 


