# pi_squared.asm
# Amirhossein Alian
# 403011018
.data
    prompt: .asciiz "Enter n: "
    result: .asciiz "Approximation of pi: "
    zero_float: .float 0.0
    six_float: .float 6.0
    one_float: .float 1.0

.text
.globl main

main:
    # Print prompt to enter n
    addi $v0, $zero, 4
    la $a0, prompt
    syscall

    # Read integer n
    addi $v0, $zero, 5
    syscall
    add $t0, $v0, $zero

    # Initialize sum to 0.0
    lwc1 $f0, zero_float     # $f0 = 0.0

    # Load 1.0 into $f4
    lwc1 $f4, one_float

    # Initialize loop counter i = 1
    addi $t1, $zero, 1

loop:
    # Check if i > n, exit loop if true
    bgt $t1, $t0, end_loop

    # Calculate i^2
    mul $t2, $t1, $t1

    # Convert i^2 to float
    mtc1 $t2, $f2
    cvt.s.w $f2, $f2

    # Calculate 1/i^2
    div.s $f6, $f4, $f2      # $f6 = 1.0 / i^2

    # Add to sum
    add.s $f0, $f0, $f6      # sum += 1/i^2

    # Increment i and loop
    addi $t1, $t1, 1
    j loop

end_loop:
    # Multiply sum by 6
    lwc1 $f8, six_float      # $f8 = 6.0
    mul.s $f0, $f0, $f8      # $f0 = 6 * sum

    # evaluate square root
    sqrt.s $f12, $f0         # $f12 = sqrt(6 * sum)

    # Print result message
    addi $v0, $zero, 4
    la $a0, result
    syscall

    # Print pi value
    addi $v0, $zero, 2
    mov.s $f12, $f12
    syscall

    # Exit program
    addi $v0, $zero, 10
    syscall
