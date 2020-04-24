section .data
    msg db "Hola_mundo", 0xA, 0xD
    msg2 db "Hola chavales", 0xA, 0xD
    len equ $ - msg
    len2 equ $ - msg2

section .text
    global _start

_start:
    mov eax, 4      ;llamada al sistema (sys_write)
    mov ebx, 1      ;stdout
    mov ecx, msg    ;msg pantalla
    mov edx, len    ;longitud del mensaje
    int 0x80

    mov ecx, msg2
    mov edx, len2

    int 0x80        ;llamada al sistema de interrupciones
    
    mov eax, 1      ;exit
    int 0x80
