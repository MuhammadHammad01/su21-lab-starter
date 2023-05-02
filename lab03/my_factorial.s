.globl factorial

.data
n: .word 8                      #value of 8 assigned  

.text
main:
    la t0, n                    # t0 = address of n 
    lw a0, 0(t0)                #a0  = value   of n
    addi a2, zero, 0            #define a2 for our use
    jal ra, factorial           #jump to factorial calculation

    addi a1, a0, 0              #return address stored in a0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'           #printing space in between
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10             #exit call
    ecall # Exit
#we can take advantage of non-preserved register a2 for this purpose to store the value of stack
factorial:
    addi t0, zero, 1
    ble  a0, t0,  check           #if (n) <= 1 then check
    addi sp, sp, -4             #expand the stack
    sw   a0, 0(sp)              #store the value at a2
    addi a2, a2,  1             #keep track of depth of stack
    addi a0, a0, -1             # n=n-1
    jal  factorial          #recursive function

check:
    beq  a2,zero,exit           #if a2==0 means no depth of stack, return 1
    slli t1, a2, 2              #simply store the address in temporary register t2
    lw   t2, t1(sp)              #store value of stack 
    addi sp, sp, 4              #shrink again the stack
    addi a2, a2, -1             # a2 = a2-1
    mul  a0, a0, t2
    jal  check
exit:
    addi t0, zero, 1
    bgt  a0, t0,   jump_back          #if (fact.) >= 1 then exit 
    addi a0, zero, 1            #we will return 1 on any value <=1
    jr   ra
jump_back:
    jr   ra