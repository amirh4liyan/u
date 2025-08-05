# intg_derv.asm
# Amirhossein Alian
# 403011018
.data
prompt_1: .asciiz "Enter polynomial degree (>0): "
prompt_2: .asciiz "Enter coefficients (from n to 0): "
prompt_op: .asciiz "Enter operation (0/1 for derivative/integral): "
result_msg: .asciiz "The result coefficients are: "
space: .asciiz " "
newline: .asciiz "\n"
c_str: .asciiz " c\n"

coeff: .space 400
new_coeff: .space 400

.text
.globl main

main:
    # print prompt for getting n
    addi $v0, $zero, 4
    la $a0, prompt_1
    syscall

    # get n
    li $v0, 5
    syscall
    add $s0, $v0, $zero

    # check for n > 0
    slti $t0, $s0, 1
    bne $t0, $zero, main

    # print prompt for getting coefficients
    addi $v0, $zero, 4
    la $a0, prompt_2
    syscall

    # load coeff address and start get coefficients
    la $s1, coeff
    addi $t0, $zero, 0

read_loop:
    sub $t1, $t0, $s0
    slt $t2, $zero, $t1
    bne $t2, $zero, read_done

    addi $v0, $zero, 5
    syscall
    sw $v0, 0($s1)

    addiu $s1, $s1, 4
    addiu $t0, $t0, 1
    j read_loop

read_done:
    # print prompt for getting op code
    addi $v0, $zero, 4
    la $a0, prompt_op
    syscall

    # get op code
    addi $v0, $zero, 5
    syscall
    add $s2, $v0, $zero

    # evaluate derivative or integral
    beq $s2, $zero, derivative
    j integral

derivative:
    la $s3, coeff
    la $s4, new_coeff
    addi $t0, $zero, 0

deriv_loop:
    sub $t1, $t0, $s0
    slt $t2, $t1, $zero
    beq $t2, $zero, deriv_end

    # evaluate power
    sub $t3, $s0, $t0
    lw $t4, 0($s3)
    mult $t4, $t3
    mflo $t5
    sw $t5, 0($s4)

    addiu $s3, $s3, 4
    addiu $s4, $s4, 4
    addiu $t0, $t0, 1
    j deriv_loop

deriv_end:
    add $s5, $s0, $zero
    j print_result

integral:
    la $s3, coeff
    la $s4, new_coeff
    addi $t0, $zero, 0

integral_loop:
    sub $t1, $t0, $s0
    slt $t2, $zero, $t1
    bne $t2, $zero, integral_end

    lw $t3, 0($s3)
    mtc1 $t3, $f0
    cvt.s.w $f0, $f0

    sub $t4, $s0, $t0
    addiu $t4, $t4, 1
    mtc1 $t4, $f1
    cvt.s.w $f1, $f1

    div.s $f0, $f0, $f1
    s.s $f0, 0($s4)

    addiu $s3, $s3, 4
    addiu $s4, $s4, 4
    addiu $t0, $t0, 1
    j integral_loop

integral_end:
    addiu $s5, $s0, 1

print_result:
    addi $v0, $zero, 4
    la $a0, result_msg
    syscall

    la $s6, new_coeff
    addi $t0, $zero, 0

print_loop:
    sub $t1, $t0, $s5
    slt $t2, $t1, $zero
    beq $t2, $zero, print_end

    beq $s2, $zero, print_int
    j print_float

print_int:
    lw $a0, 0($s6)
    addi $v0, $zero, 1
    syscall
    j print_space

print_float:
    l.s $f12, 0($s6)
    addi $v0, $zero, 2
    syscall

print_space:
    addiu $t3, $s5, -1
    sub $t4, $t0, $t3
    slt $t5, $t4, $zero
    beq $t5, $zero, skip_space

    addi $v0, $zero, 4
    la $a0, space
    syscall

skip_space:
    addiu $s6, $s6, 4
    addiu $t0, $t0, 1
    j print_loop

print_end:
    beq $s2, $zero, exit
    addi $v0, $zero, 4
    la $a0, c_str
    syscall

exit:
    addi $v0, $zero, 10
    syscall
