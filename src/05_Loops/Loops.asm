extern x64_00_SystemCalls_Dialog
global x64_05_Loops

section .data
    title db '05_Loops', 0
    body db 'Loop example', 0

section .text
;int x64_05_Loops(int amountOfTimesToLoop);
x64_05_Loops:
    ; rcx is a special register when used with loop. This instruction will loop until rcx is 0, so the below code would loop 8 times.
    ; and also increment rax 8 times. Code won't need to define mov rcx, 8 if rcx is being set by the function that makes the call. (fast call argument passing).

    ;    mov rax, 0
    ;    mov rcx, 8
    ;  .loop8Times:
    ;    inc rax
    ;    loop .loop8Times




    ; below we will define some logic that doesn't use the fancy rcx counter, as we are calling a function each iteration, which could break our counter value (as RCX is a volatile register)

    mov DWORD [rsp - 8], 0      ; we want to use a local variable on the stack. We know the variable is an integer so we can use DWORD.
                                ; We are telling the assembler here that whatever lives at RSP - 8 (in this case an int) is a double word (32 bits)

    mov QWORD [rsp - 16], rcx   ; We will use this as our incrementer as rcx is volatile between function calls. Also have to define QWORD as rcx is 64bit and QWORD == 64 bits

.loop8Times:
    inc DWORD [rsp - 8]         ; increment our first local variable
    dec DWORD [rsp - 16]        ; decrement our second local variable (what rcx initially was)

    mov rcx, title
    mov rdx, body
    sub rsp, 0x28
    call x64_00_SystemCalls_Dialog
    add rsp, 0x28


    cmp DWORD [rsp - 16], 0     ; check if our second local variable is 0, if it is, set a flag in the eflags register
    jnz .loop8Times             ; if not zero, jump back to start of label and go again


    mov rax, [rsp - 8]
    ret