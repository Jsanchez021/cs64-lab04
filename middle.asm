# S24 CS 64 
# Lab 04
# middle.asm 

.data

    # TODO: Complete these declarations/initializations

    prompt_1: .asciiz "Enter the first number:\n"
    prompt_2: .asciiz "Enter the second number:\n"
    prompt_3: .asciiz "Enter the third number:\n"
    middle: .asciiz "Middle:\n"
    new_line: .asciiz "\n"


.text

main:

    li $v0, 4         #asking user for first number
    la $a0, prompt_1
    syscall

    li $v0, 5         #reading first number
    syscall
    move $s0, $v0

    li $v0, 4         #asking user for second number
    la $a0, prompt_2
    syscall

    li $v0, 5         #reading second number
    syscall
    move $s1, $v0

    li $v0, 4         #asking user for third number
    la $a0, prompt_3
    syscall

    li $v0, 5         #reading third number
    syscall
    move $s2, $v0

    
#finding the median

    blt $s0, $s1, smaller_1
    bgt $s0, $s1, bigger_1

smaller_1:
    bgt $s0, $s2, median
    blt $s0, $s2, minimum

bigger_1:
    blt $s0, $s2, median
    bgt $s0, $s2, maximum

minimum:
    bgt $s1, $s2, reg_2
    bgt $s2, $s1, reg_1

maximum:
    blt $s1, $s2, reg_2
    blt $s2, $s1, reg_1

reg_2:
    move $t0, $s2
    j median

reg_1:
    move $t0, $s1
    j median

median:
    li $v0, 4          #outputing the result
    la $a0, middle
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, new_line
    syscall

exit:
    # TODO: Write code to properly exit a SPIM simulation

    li $v0, 10
    syscall
