# Description:

    .text
    .global _start

# #define set_struct(s) \
#  s.a = a; \
#  s.b = b;
# #define get_struct(s) \
#  a = s.a; \
#  b = s.b;

.macro get_struct S_s
    lw x6, 0(\S_s)
    lw x7, 4(\S_s)
.endm

.macro set_struct S_s
    sw x6, 0(\S_s)
    sw x7, 4(\S_s)
.endm


_start:
    li x6, 0x12345678
    li x7, 0x87654321
    la x5, struct_S_s

    set_struct x5
    li x6, 0
    li x7, 0
    get_struct x5

stop:
    j stop

struct_S_s:
    .word 0
    .word 0

    .end