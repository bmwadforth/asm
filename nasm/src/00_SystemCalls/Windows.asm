extern ExitProcess
extern MessageBoxA
global Windows_x64_PrintDialog

section .data

section .text
Windows_x64_PrintDialog:
    mov    r10, rcx       ; save first argument (char *) in r10 (title)
    mov    r11, rdx       ; save second argument (char *) in r11 (body)
    ;sub    rsp,28h        ; shadow space, aligns stack
    mov    rcx, 0         ; hWnd = HWND_DESKTOP
    lea    rdx, [r11]     ; LPCSTR lpText
    lea    r8,  [r10]     ; LPCSTR lpCaption
    mov    r9d, 0         ; uType = MB_OK
    call   MessageBoxA    ; call MessageBox API function
    ;mov    ecx, eax       ; uExitCode = MessageBox(...)
    ;call   ExitProcess
    ret
