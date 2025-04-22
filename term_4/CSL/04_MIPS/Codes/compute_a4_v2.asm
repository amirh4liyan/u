.data
A: .word 7 5 3 2

.text
main:
	la $s0, A
	
	lw $t0, 0($s0) #‌load A[0]
	addi $s0, $s0, 4 # offset A[1]
	lw $t1, 0($s0) #‌load A[1]
	add $t0, $t0, $t1 #‌ $t0 = A[0] +‌ A[1]

	addi $s0, $s0, 4 # offset A[2]
	lw $t1, 0($s0) #‌load A[2]
	addi $s0, $s0, 4 # offset A[3]
	lw $t2, 0($s0) #‌load A[3]
	add $t1, $t1, $t2 #‌ $t1 = A[2] +‌ A[3]
	
	sub $t0, $t0, $t1 
	sw $t0, 4($s0)
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 17
	syscall