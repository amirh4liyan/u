.data
n:      .word 5       # مقدار اولیه برای تست

.text
.globl main

main:
    lw $a0, n         # بارگذاری مقدار n در $a0
    jal f             # فراخوانی تابع f
    move $s0, $v0     # ذخیره نتیجه نهایی در $s0
    
    addi $v0, $zero, 1
    add $a0, $s0, $zero
    syscall
    
    addi $v0, $zero, 10
    syscall

f:
    # base case condition
    slti $t0, $a0, 2
    beq $t0, $zero, recursive_case
    
    # base case
    addi $v0, $zero, 0
    jr $ra

recursive_case:
    # ذخیره مقادیر مورد نیاز
    move $t1, $a0      # ذخیره n در $t1
    move $t2, $ra      # ذخیره آدرس بازگشت در $t2
    
    # محاسبه n*n با دستور mult
    mult $t1, $t1      # n * n → hi/lo
    mflo $t3           # دریافت نتیجه از lo
    
    # محاسبه n² - n
    sub $t3, $t3, $t1  # n² - n
    
    # فراخوانی بازگشتی f(n-1)
    addi $a0, $a0, -1
    jal f
    
    # جمع نتایج
    add $v0, $v0, $t3  # (n² - n) + f(n-1)
    
    # بازیابی آدرس بازگشت
    move $ra, $t2
    jr $ra
