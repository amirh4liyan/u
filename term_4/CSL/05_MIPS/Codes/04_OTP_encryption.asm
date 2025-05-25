# OTP_encryption.asm
# Amirhossein Alian
# 403011018
.data
seed_prompt: .asciiz "Enter seed (4 chars): "
input_prompt: .asciiz "Enter string (max 20): "
seed_buffer: .space 5
input_buffer: .space 21
output_buffer: .space 21

.text
main:
    # Prompt for getting seed
    addi $v0, $zero, 4
    la $a0, seed_prompt
    syscall

    # get seed
    addi $v0, $zero, 8
    la $a0, seed_buffer
    addi $a1, $zero, 5
    syscall

    # Convert seed to integer
    la $a0, seed_buffer
    lbu $t0, 0($a0)
    sll $t0, $t0, 24
    lbu $t1, 1($a0)
    sll $t1, $t1, 16
    or $t0, $t0, $t1
    lbu $t1, 2($a0)
    sll $t1, $t1, 8
    or $t0, $t0, $t1
    lbu $t1, 3($a0)
    or $t0, $t0, $t1

    # Set seed
    add $a0, $t0, $zero
    addi $v0, $zero, 40
    syscall

    # Prompt for input string
    addi $v0, $zero, 4
    la $a0, input_prompt
    syscall

    # Read input string
    addi $v0, $zero, 8
    la $a0, input_buffer
    addi $a1, $zero, 21
    syscall

    # Process each character
    la $t0, input_buffer
    la $t4, output_buffer
    addi $t1, $zero, 0

loop:
    lb $t2, 0($t0)
    beqz $t2, end_loop

    # Generate random number (0-255)
    addi $a0, $zero, 256
    addi $v0, $zero, 42
    syscall

    # XOR with input character
    xor $t3, $t2, $v0

    # Store result
    sb $t3, 0($t4)

    # Increment pointers
    addi $t0, $t0, 1
    addi $t4, $t4, 1
    j loop

end_loop:
    # Null-terminate output
    sb $zero, 0($t4)

    # Print encrypted string
    addi $v0, $zero, 4
    la $a0, output_buffer
    syscall

    # Exit
    addi $v0, $zero, 10
    syscall
