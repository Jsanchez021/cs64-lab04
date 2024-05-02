# S24 CS 64 
# Lab 04
# gcd.asm 

##### C++ (NON-RECURSIVE) code snippet of gcd(a,b):
    # int main()
    # {
    #     int a, b, n;
    #     int gcd = 1;

    #     cout << "Enter the first number:\n"; 
    #     cin >> a;
    #     cout << "Enter the second number:\n"; 
    #     cin >> b;
        
    #     if(a<b)
    #     {    n = a; }
    #     else
    #     {    n = b; }

    #     for(int i = 1; i <= n; i++)
    #     {
    #         if(a%i==0 && b%i==0)
    #             gcd = i;
    #     }

    #     cout << "GCD: " << gcd <<  "\n"; 

    #     return 0;
    # }


##### Assembly (NON-RECURSIVE) code version of gcd(a,b):

.data

	# TODO: Complete these declarations/initializations
    prompt_1: .asciiz "Enter the first number:\n"
    prompt_2: .asciiz "Enter the second number:\n"
    gcd: .asciiz "GCD:\n"
    new_line: .asciiz "\n"

.text
main:
	li $v0, 4         #ask for first number
    la $a0, prompt_1
    syscall

    li $v0, 5        #read first number
    syscall
    move $s0, $v0

    li $v0, 4         #ask for second number
    la $a0, prompt_2
    syscall

    li $v0, 5        #read second number
    syscall
    move $s1, $v0

    #find the gcd
    li $t0, 1
    blt $s0, $s1, n_0
    blt $s1, $s0, n_1

n_0:
    move $t1, $s0
    j GCD

n_1:
    move $t1, $s1
    j GCD    

GCD:
    # Check if i <= n
    bgt $t0, $t1, loop_exit  # if (i > n) goto loop_exit
    
    # Check if both numbers are divisible by i
    div $s0, $t0
    mfhi $t5         # Remainder of a / i
    beq $t5, $zero, check_b
    j increment_i

check_b:
    div $s1, $t0
    mfhi $t5         # Remainder of b / i
    bne $t5, $zero, increment_i
    
    # If both are divisible, update gcd
    move $t6, $t0   # gcd = i

increment_i:
    addi $t4, $t4, 1   # i++
    j for_loop  # Repeat the loop
    
loop_exit:
    move $t0, $t6
    j print

print:
    li $v0, 4         #printing the gcd
    la $a0, gcd
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, new_line

exit:
	li $v0, 10
    syscall