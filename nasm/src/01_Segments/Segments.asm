section .data
; initialized variables go here
    caption db '64-bit hello!', 0 ; caption references a constant string value in memory of byte size (8 bits)
    message db 'Hello World!', 0 ; you can also use dw (for declare word) and dd (declare double word)

section .bss
; uninitialized variables go here
variable: resb 4 ; variable now refers to 4 bytes of memory (32-bits)

section .text
; code goes here


; after compiling & linking this assembly program, once the OS (specifically windows) loads it into memory, the memory layout will look like:

;  Lower memory addresses
;  |         Stack        |  The stack grows up toward lower addresses
;  |----------------------|
;  |         Heap         |  The heap grows down towards higher memory addresses
;  |----------------------|
;  |     Program Image    |  The program image contains your .text (your code) segment and your .data and .bss segments
;  |----------------------|
;  |  DLL's, TEBs & PEBs  |  Any shared or static libraries you've included. Examples include kernel32.dll, user32.dll etc.
;  |----------------------|
;  |     Kernel Land      |  The operating code exists here and every memory address in it would be inaccessible to your application that is running in usermode (userland).
;  |----------------------|
;  Higher memory addresses


; See PE and ELF file formats for more accurate information relating to how programs are loaded into memory, and how memory is organised based on the OS.