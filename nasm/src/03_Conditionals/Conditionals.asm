extern Windows_x64_PrintDialog
global Unconditional_Jumps

section .data
    title db '64-bit hello!', 0
    body db 'Hello from unconditional jump!', 0

section .text
Unconditional_Jumps:
    ; function prologue
    ;mov    rbp, rsp
    sub    rsp, 28h        ; reserve 40 bytes of shadow space, aligns stack

    mov rcx, title
    mov rdx, body
    call Windows_x64_PrintDialog

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

; unconditional jump to label
    jmp .JumpLabel       ; jumping to jump label

.JumpLabel:
    ;mov rax, 10         ; moving 10 into rax (return value) so Unconditional_Jumps() will return 10.

    ; function epilogue
    add    rsp, 28h       ; remove 40 bytes of shadow space, aligns stack
    ret