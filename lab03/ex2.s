.globl main

.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
fun:
    addi t0, a0, 1     #t0 = source[k] +1 ......a0 currently has the value source[k]
    sub t1, x0, a0     #t1 = -x 
    mul a0, t0, t1     #a0 = -x * (x+1) 
    jr ra              #a0 is used for return argument register

main:
    # BEGIN PROLOGUE
    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)
    # END PROLOGUE
    addi t0, x0, 0    # t0 used for k
    addi s0, x0, 0    # s0 used for sum
    la s1, source     # s1 is source of first array
    la s2, dest       # s2 is empty desitnation array  
loop:
    slli s3, t0, 2    #simply shifting left t0 by 2 will add 4 (address calculator)
    add t1, s1, s3    #t1 = s1(base address for source address) + s3(new address which is jumped by 4) 
    lw t2, 0(t1)      #load the value of s3[k] into s2
    beq t2, x0, exit  # 0 == source[k]
    add a0, x0, t2    # send the value of source[k] through argument register
    addi sp, sp, -8   #increase the depth of stack
    sw t0, 0(sp)      #save the non-preserved register t0 (currently zero)
    sw t2, 4(sp)      #save the value of source[k] = t2
    jal fun           #jumpt to fun
    lw t0, 0(sp)      #load the value of t0 back
    lw t2, 4(sp)      #load the value of t2 back
    addi sp, sp, 8    #shrink the stack again
    add t2, x0, a0    #t2 = return value from fun
    add t3, s2, s3    #t3 = (base address of dest[]) + (calculated address for k)
    sw t2, 0(t3)      #store t2 in dest[k]
    add s0, s0, t2    #sum = sum + dest[k]
    addi t0, t0, 1    #k=k+1
    jal x0, loop      #jump back
exit:
    add a0, x0, s0
    # BEGIN EPILOGUE
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    # END EPILOGUE
    jr ra
