// src/arm64/asm/functions.s
// Example of a simple ARM64 function to add two numbers, callable from C/Rust.

.global __assembly_add
.align 2

__assembly_add:
    // x0 and x1 will contain the two arguments (first two 64-bit integer arguments)
    // x0 = arg1, x1 = arg2

    add     x0, x0, x1       // x0 = x0 + x1 (result is returned in x0 as per ABI)
    ret                      // Return from function