extern Windows_x64_PrintDialog
global x64_05_Loops

section .data

section .text
x64_05_Loops:
; rcx is a special register when used with loop. This instruction will loop until rcx is 0, so 8 times.
; We know this is true because if we were to return here, when C++ gets the return value from this
; routine it will be 8 (as rax is the return register).
    mov rax, 0
    mov rcx, 8
.loop8Times:
    inc rax
    loop .loop8Times

; here is the equivalent code as above but without the cool functionality of loop and rcx
    mov rax, 0
    mov rcx, 8
.loop8TimesWithoutRCX:
    inc rax
    dec rcx
    cmp rcx, 0
    jnz .loop8TimesWithoutRCX


    ret