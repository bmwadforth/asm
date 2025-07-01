.global __print_assembly_string

.data
    message: .asciz "Hello from ARM64 macOS Assembly!\n"
    message_len = . - message

.text
__print_assembly_string:
    ; Register conventions for macOS ARM64 system calls:
    ; x0: syscall number
    ; x1-x5: arguments
    ; x0: return value

    ; sys_write (syscall number 0x2000004)
    ; Arguments:
    ; x1: file descriptor (1 for stdout)
    ; x2: buffer address
    ; x3: length of buffer

    ldr     x0, =0x2000004  ; Load syscall number for sys_write from literal pool
    mov     x1, #1          ; file descriptor (stdout)
    adrp    x2, message@PAGE ; address of message string (page)
    add     x2, x2, message@PAGEOFF ; address of message string (offset)
    ldr     x3, =message_len ; length of the message
    svc     #0              ; execute syscall

    ; sys_exit (syscall number 0x2000001)
    ; Arguments:
    ; x1: exit code

    ldr     x0, =0x2000001  ; Load syscall number for sys_exit from literal pool
    mov     x1, #0          ; exit code (0 for success)
    svc     #0              ; execute syscall
