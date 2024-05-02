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

    li $v0, 4         #ask for second number
    la $a0, prompt_2
    syscall

    #find the gcd
    


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