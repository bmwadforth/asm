section .text


; The following table displays the register names for x64.
; An important thing to note about the register names is when you call a function in the win32 API for example
; there is a calling convention that you need to follow https://docs.microsoft.com/en-us/cpp/build/x64-calling-convention?view=msvc-170
; If you're calling a Win32 API (function) that expects two integer paramters for example, the registers you will need to load values into
; for the API to work would be RCX, RDX. Similarly if a function returns an integer, there will be a specific register to find that return value in.
; See the URL above for more info about the windows x64 calling convention.

; 64-bit register | Lower 32 bits | Lower 16 bits | Lower 8 bits
; ==============================================================
; rax             | eax           | ax            | al
; rbx             | ebx           | bx            | bl
; rcx             | ecx           | cx            | cl
; rdx             | edx           | dx            | dl
; rsi             | esi           | si            | sil
; rdi             | edi           | di            | dil
; rbp             | ebp           | bp            | bpl
; rsp             | esp           | sp            | spl
; r8              | r8d           | r8w           | r8b
; r9              | r9d           | r9w           | r9b
; r10             | r10d          | r10w          | r10b
; r11             | r11d          | r11w          | r11b
; r12             | r12d          | r12w          | r12b
; r13             | r13d          | r13w          | r13b
; r14             | r14d          | r14w          | r14b
; r15             | r15d          | r15w          | r15b