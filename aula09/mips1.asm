#	res (float) = $f0	
#	val (int)   = $t0

	.data
const:	.float 2.59375
	.text
	.globl main
main:
do:	li $v0,5
	syscall
	move $t0,$v0		# read_int()
	
	l.s $f2,const		# $f2 = 2.59375
	mtc1 $t0,$f4
	cvt.s.w $f4,$f4		# (float)val
	mul.s $f0,$f2,$f4		# res = (float)val * 2.59375
	
	li $v0,2
	mov.s $f12,$f0
	syscall			# print_float( res )
	
	mtc1 $0,$f6		# $f6 = 0
	cvt.s.w $f6,$f6		# $f6 = 0.0
	
	c.eq.s $f0,$f6		
	bc1f do			# while (res != 0.0)
	
	li $v0,0		# return 0

	jr $ra
	
	
	
	
	