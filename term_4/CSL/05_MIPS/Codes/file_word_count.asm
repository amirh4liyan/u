.data
input_file:  .asciiz "input.txt"
output_file: .asciiz "output.txt"
buffer:      .space 1024
reversed:    .space 1024
output:      .space 2048

.text
main:
    # باز کردن فایل ورودی
    li $v0, 13
    la $a0, input_file
    li $a1, 0
    syscall
    move $s0, $v0

    # خواندن محتوای فایل
    li $v0, 14
    move $a0, $s0
    la $a1, buffer
    li $a2, 1024
    syscall
    move $s1, $v0

    # بستن فایل
    li $v0, 16
    move $a0, $s0
    syscall

    ### مرحله ۱: معکوس کردن کل رشته ###
    la $t0, buffer        # اشاره‌گر به ابتدای بافر
    add $t1, $t0, $s1     # اشاره‌گر به انتهای بافر
    addi $t1, $t1, -1
    la $t2, reversed       # اشاره‌گر به بافر معکوس‌شده

reverse_loop:
    blt $t1, $t0, end_reverse
    lb $t3, 0($t1)        # بارگذاری کاراکتر از انتها
    sb $t3, 0($t2)        # ذخیره در بافر معکوس
    addi $t1, $t1, -1
    addi $t2, $t2, 1
    j reverse_loop

end_reverse:
    sb $zero, 0($t2)      # پایان‌دهی رشته معکوس‌شده

    ### مرحله ۲: پردازش کلمات ###
    la $t0, reversed      # اشاره‌گر به رشته معکوس‌شده
    la $t1, output         # اشاره‌گر به خروجی نهایی
    li $t5, 0              # پرچم اولین کلمه

process_loop:
    lb $t2, 0($t0)        # بارگذاری کاراکتر فعلی
    beqz $t2, done        # اگر به پایان رشته رسیدیم، تمام
    
    # بررسی جداکننده‌ها (فاصله یا "In")
    beq $t2, ' ', handle_space
    li $t3, 'n'
    lb $t4, 1($t0)
    beq $t2, 'I', check_In
    
    # شروع یک کلمه جدید
    move $t6, $t0         # ذخیره شروع کلمه
    li $t7, 0             # شمارنده طول کلمه (حداکثر ۹)

word_collect:
    lb $t2, 0($t0)
    beqz $t2, end_word    # پایان رشته
    beq $t2, ' ', end_word # فاصله
    li $t3, 'I'
    lb $t4, 1($t0)
    beq $t2, 'n', check_In_word
    
    addi $t7, $t7, 1      # افزایش طول کلمه
    addi $t0, $t0, 1      # حرکت به کاراکتر بعدی
    j word_collect

check_In_word:
    bne $t4, 'I', word_collect # اگر "In" نبود، ادامه جمع‌آوری
    j end_word

end_word:
    # معکوس کردن کلمه (بازگرداندن به حالت اصلی)
    move $a0, $t6
    move $a1, $t7
    jal reverse_substring
    
    # افزودن طول کلمه (به صورت رقم واحد)
    addi $t7, $t7, '0'
    sb $t7, 0($t1)
    addi $t1, $t1, 1
    
    # افزودن فاصله بین کلمات (به جز کلمه اول)
    beqz $t5, first_word
    li $t3, ' '
    sb $t3, 0($t1)
    addi $t1, $t1, 1
    
first_word:
    li $t5, 1
    j process_loop

handle_space:
    addi $t0, $t0, 1     # رد کردن فاصله
    j process_loop

check_In:
    bne $t4, 'n', word_collect # اگر "In" نبود
    addi $t0, $t0, 2     # رد کردن "In"
    j process_loop

reverse_substring:
    # $a0: آدرس شروع، $a1: طول کلمه
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    move $t8, $a0        # ابتدا
    add $t9, $a0, $a1    # انتها
    addi $t9, $t9, -1

swap_loop:
    bge $t8, $t9, end_swap
    lb $t3, 0($t8)       # مبادله کاراکترها
    lb $t4, 0($t9)
    sb $t4, 0($t8)
    sb $t3, 0($t9)
    addi $t8, $t8, 1
    addi $t9, $t9, -1
    j swap_loop

end_swap:
    # کپی به خروجی
    move $t8, $a0
    li $t9, 0
    
copy_loop:
    beq $t9, $a1, end_copy
    lb $t3, 0($t8)
    sb $t3, 0($t1)
    addi $t8, $t8, 1
    addi $t1, $t1, 1
    addi $t9, $t9, 1
    j copy_loop

end_copy:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

done:
    # نوشتن خروجی در فایل
    li $v0, 13
    la $a0, output_file
    li $a1, 1
    syscall
    move $s0, $v0
    
    li $v0, 15
    move $a0, $s0
    la $a1, output
    sub $a2, $t1, $a1    # محاسبه طول خروجی
    syscall
    
    li $v0, 16           # بستن فایل
    move $a0, $s0
    syscall
    
    li $v0, 10           # پایان برنامه
    syscall