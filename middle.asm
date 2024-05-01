# S24 CS 64 
# Lab 04
# middle.asm 

.data
    prompt_1: .asciiz "Enter the first number:\n"
    prompt_2: .asciiz "Enter the second number:\n"
    prompt_3: .asciiz "Enter the third number:\n"
    middle: .asciiz "Middle:\n"
    new_line: .asciiz "\n"

.text
main:
    # Asking user for the first number
    li $v0, 4
    la $a0, prompt_1
    syscall

    # Reading the first number
    li $v0, 5
    syscall
    move $s0, $v0

    # Asking user for the second number
    li $v0, 4
    la $a0, prompt_2
    syscall

    # Reading the second number
    li $v0, 5
    syscall
    move $s1, $v0

    # Asking user for the third number
    li $v0, 4
    la $a0, prompt_3
    syscall

    # Reading the third number
    li $v0, 5
    syscall
    move $s2, $v0

    # Finding the median
    blt $s0, $s1, smaller_1
    bgt $s0, $s1, bigger_1

    smaller_1:
        blt $s0, $s2, median
        bge $s0, $s2, minimum

    bigger_1:
        bge $s0, $s2, median
        blt $s0, $s2, maximum

    minimum:
        blt $s1, $s2, reg_2
        bge $s2, $s1, reg_1

    maximum:
        bge $s1, $s2, reg_2
        blt $s2, $s1, reg_1

    reg_2:
        move $t0, $s2
        j median

    reg_1:
        move $t0, $s1
        j median

    median:
        li $v0, 4
        la $a0, middle
        syscall
        li $v0, 1
        move $a0, $t0
        syscall
        li $v0, 4
        la $a0, new_line
        syscall

    exit:
        li $v0, 10
        syscall