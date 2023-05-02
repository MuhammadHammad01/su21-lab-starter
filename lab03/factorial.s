.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    addi sp, sp,  -8            #expand the stack
    sw   a0, 4(sp)              #store the current value of n
    sw   ra, 0(sp)              #store return address
    addi t0, zero, 1            #t0 for comparison
    bgt  a0, t0,   calc         #if a0>1, go to cacl
    addi a0, zero, 1            #else return 1
    addi sp, sp,   8            #shrink the stack
    jr   ra                     #return to main

calc:
    addi a0, a0, -1             #we need n=n-1
    jal  factorial              # recursive calculations
    lw   t1, 4(sp)              #store n into t1
    lw   ra, 0(sp)              #store return address
    addi sp, sp, 8              #shrink the stack
    mul  a0, t1, a0             # n*fact(n-1)
    jr   ra                     #return to main