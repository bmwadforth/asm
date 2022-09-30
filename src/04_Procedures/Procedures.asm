extern Windows_x64_PrintDialog
global x64_04_Procedures_Sum

section .data

; int sum = SumProcedure(int a, int b, int c, int d, int e);
section .text
x64_04_Procedures_Sum:
    mov     rax, 0
    add     rax, rcx            ; int a
    add     rax, rdx            ; int b
    add     rax, r8             ; int c
    add     rax, r9             ; int d
    add     rax, [rsp + 0x28]   ; int e (stored on stack) (rsp + 40 bytes for argument 'e', as rsp + 0 through to rsp + 32 is 'shadow space' for fast call argument registers. See x64 calling convention on windows

    ret