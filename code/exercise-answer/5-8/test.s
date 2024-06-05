# Description:

    .text
    .global _start

_start:
    la sp, stack_end
    li a0, 3
    call sum_square

stop:
    j stop

sum_square:
    #prologue
    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw ra, 12(sp)

    mv s2, a0   # i = 3
    li s0, 0    # sum = 0
    li s1, 1    # j = 1
    bgtu s1, s2, for_end
for:
    mv a0, s1
    call square
    add s0, s0, a0      # sum += sq(j)
    addi s1, s1 , 1     # j++
    bleu s1, s2, for

for_end:
    mv a0, s0

    # epilogue
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw ra, 12(sp)
    addi sp, sp, 16
    ret

square:
    addi sp, sp, 4
    sw s0, 0(sp)

    mv s0, a0
    mul a0, s0, s0

    lw s0, 0(sp)
    addi sp, sp, 4
    ret

# allocate stack area
stack_start:
    .rept 12
    .word 0
    .endr
stack_end:

    .end