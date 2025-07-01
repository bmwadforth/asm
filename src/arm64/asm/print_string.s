// src/arm64/asm/print_string.s
// Example of an ARM64 function to print a string to stdout, callable from C/Rust.

.global __print_assembly_string
.align 2 // Ensure proper alignment for the function

.data
    message: .asciz "Hello from ARM64 macOS Assembly!\n"
    message_len = . - message

.text
__print_assembly_string:
    ; Register conventions for macOS ARM64 system calls:
    ; x0: syscall number
    ; x1-x5: arguments
    ; x0: return value (from syscall)

    ; sys_write (syscall number 0x2000004 for macOS ARM64)
    ; Arguments:
    ; x1: file descriptor (1 for stdout)
    ; x2: buffer address
    ; x3: length of buffer

    ldr     x0, =0x2000004  ; Load syscall number for sys_write from literal pool into x0
    mov     x1, #1          ; Set file descriptor to 1 (stdout) into x1
    adrp    x2, message@PAGE ; Load the page address of the message string into x2
    add     x2, x2, message@PAGEOFF ; Add the page offset to get the full address of the message string into x2
    ldr     x3, =message_len ; Load the length of the message into x3
    svc     #0              ; Execute the system call

    ; The sys_write call returns the number of bytes written (or an error code) in x0.
    ; For this simple print function, we don't need to check the return value.

    ret                     ; Return from the function to the caller (Rust)
