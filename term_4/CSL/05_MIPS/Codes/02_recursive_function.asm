# recursive_function.asm
# Amirhossein Alian
# 403011018
.data
    prompt: .asciiz "Enter positive integer (n>0): "
    result: .asciiz "The result is: "

.text
main:
    # Print prompt for getting n
    addi $v0, $zero, 4
    la $a0, prompt
    syscall

    # get n
    addi $v0, $zero, 5
    syscall
    add $a0, $v0, $zero

    # Call recursive function
    jal recursive_sum

    # Save result in $t0
    add $t0, $v0, $zero

    # Print result message
    addi $v0, $zero, 4
    la $a0, result
    syscall

    # Print the calculated sum
    addi $v0, $zero, 1
    add $a0, $t0, $zero
    syscall

    # Exit program
    addi $v0, $zero, 10
    syscall

recursive_sum:
    # Base condition: if n == 0, return 0
    beq $a0, $zero, base_case
    addi $sp, $sp, -12  # Allocate stack space for $ra, $a0, $t1
    sw $ra, 0($sp)      # Save return address
    sw $a0, 4($sp)      # Save current n

    # Calculate i^2 - i
    mul $t1, $a0, $a0   # i^2
    sub $t1, $t1, $a0   # i^2 - i
    sw $t1, 8($sp)      # Save $t1 in stack

    # Prepare for recursive call (n-1)
    addi $a0, $a0, -1
    jal recursive_sum

    lw $t1, 8($sp)      # Restore $t1
    add $v0, $v0, $t1   # Add current term to recursive result

    # Restore stack and return
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    addi $sp, $sp, 12
    jr $ra

base_case:
    # Return 0 for base case
    addi $v0, $zero, 0
    jr $ra
