extern ExitProcess
extern MessageBoxA
extern Windows_User32_SysCall

section .data
    caption db '64-bit hello!', 0
    message db 'Hello World!', 0

section .text
Windows_User32_SysCall:
    sub    rsp,28h        ; shadow space, aligns stack
    mov    rcx, 0         ; hWnd = HWND_DESKTOP
    lea    rdx, [message] ; LPCSTR lpText
    lea    r8,  [caption] ; LPCSTR lpCaption
    mov    r9d, 0         ; uType = MB_OK
    call   MessageBoxA    ; call MessageBox API function
    mov    ecx, eax       ; uExitCode = MessageBox(...)
    call ExitProcess