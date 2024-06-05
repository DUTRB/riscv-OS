# Description:

    .text
    .global _start

_start:
    li x4, 0
    la x5, arr_hello

while1:
    add x7, x4, x5
    lb x6, 0(x7)
    addi x4, x4, 1     # len++
    bne x6, x0, while1 # arr[len] != \0

    li x6, 0x2333

stop:
    j stop

arr_hello:
    .string "hello,world\0"

    .end