extern x64_00_SystemCalls_Dialog
global x64_03_Conditionals

section .data
    title db '03_Conditionals', 0
    body db 'Hello from unconditional jump!', 0

section .text
x64_03_Conditionals:
    ; function prologue
    ;mov    rbp, rsp
    sub    rsp, 0x28        ; reserve 40 bytes of shadow space, aligns stack

    mov rcx, title
    mov rdx, body
    call x64_00_SystemCalls_Dialog

; unconditional jump to label
    jmp .JumpLabel       ; jumping to jump label

.JumpLabel:
    mov rax, 10         ; moving 10 into rax (return value) so Unconditional_Jumps() will return 10.

    ; function epilogue
    add    rsp, 0x28       ; remove 40 bytes of shadow space, aligns stack
    ret