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

    jmp .JumpLabel       ; jumping to jump label

.JumpLabel:
    mov rax, 10         ; moving 10 into rax (return value) so Unconditional_Jumps() will return 10.

    ; function epilogue
    add    rsp, 28h       ; remove 40 bytes of shadow space, aligns stack
    ret