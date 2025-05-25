.data
prompt_1: .asciiz "Enter positive integer (n>0): "

.text
main:
	addi $v0, $zero, 4 # print prompt
	la $a0, prompt_1
	syscall

	addi $v0, $zero, 5 # read integer
	syscall
	# check if n < 0
	slti $t0, $v0, 1
	bne $t0, $zero, main
	# else set $s0 = n
	add $s0, $v0, $zero
	addi $s1, $s0, 1 

f:
	# base condition
	slti $t0, $a0, 2
	beq $t0, $zero, loop
	
	# base case
	addi $v0, $zero, 0
	jr $ra

loop:
	mult $a0, $a0
	mflo $t0
	sub $t0, $t0, $a0
	addi $a0, $a0, -1
	jal f
	
	

exit:
	addi $v0, $zero, 10
	syscall
