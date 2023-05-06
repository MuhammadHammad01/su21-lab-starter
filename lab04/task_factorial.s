.text              

.globl _start

_start:

    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    la a1, result
    
    j write_tohost
 
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
# end code here

# Write the result to the host using the tohost memory-mapped register
write_tohost:
    sw a0, tohost, t5
    j write_tohost

.data 
n: .word 9
result: .word 0
.align 3

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 
