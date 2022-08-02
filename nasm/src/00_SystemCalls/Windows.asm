extern ExitProcess
extern MessageBoxA
global Windows_x64_PrintDialog

section .data

section .text
Windows_x64_PrintDialog:
    ; function prologue
    sub    rsp, 0x28       ; reserve 40 bytes of shadow space, aligns stack

    lea    r8, [rcx]       ; save first argument (char *) in r10 (title)
    lea    r9, [rdx]       ; save second argument (char *) in r11 (body)

    mov    rcx, 0         ; hWnd = HWND_DESKTOP
    lea    rdx, [r9]     ; LPCSTR lpText
    lea    r8,  [r8]     ; LPCSTR lpCaption
    mov    r9, 0         ; uType = MB_OK
    call   MessageBoxA    ; call MessageBox API function
    ;mov    ecx, eax       ; uExitCode = MessageBox(...)
    ;call   ExitProcess

    ; function epilogue
    add    rsp, 0x28       ; remove 40 bytes of shadow space, aligns stack
    ret
