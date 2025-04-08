.data
msg: .asciiz "Hello World!"

.text
main:
	li $v0, 4
	la $a0, msg
	#syscall
	
	li $v0, 10
	#syscall
	
	li $t0, 128
	li $v0, 1
	move $a0, $t0
	syscall