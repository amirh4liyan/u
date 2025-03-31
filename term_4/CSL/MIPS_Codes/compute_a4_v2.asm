.data
A: .word 7 5 3 2

.text
main:
	la $s0, A
	
	lw $t0, 0($s0) #‌load A[0]
	addi $s0, $s0, 4 # offset A[1]
	lw $t1, 0($s0) #‌load A[1]
	add $t2, $t1, $t0 #‌ $t2 = A[0] +‌ A[1]

	addi $s0, $s0, 4 # offset A[2]
	lw $t3, 0($s0) #‌load A[2]
	addi $s0, $s0, 4 # offset A[3]
	lw $t4, 0($s0) #‌load A[3]
	add $t5, $t4, $t3 #‌ $t5 = A[2] +‌ A[3]
	
	sub $t2, $t2, $t5 
	sw $t2, 4($s0)
	
	li $v0, 1
	addi $a0, $s0, 4
	lw $a0, 0($a0)
	syscall