.text
main:
	li $t0, 0x80000000
	sub $t0, $t0, -1
	
	li $v0, 10
	syscall