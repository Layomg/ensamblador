section .data
    msg_suma: db "La suma de 4+5 es: "
    len_suma: equ $ - msg_suma

    msg_resta: db 0xA, 0xD,"La resta de 5-4 es:"
    len_resta: equ $ - msg_resta

    msg_incremento: db 0xA, 0xD,"Incremento en uno de eax es: "
    len_incremento: equ $ - msg_incremento

    msg_decremento: db 0xA, 0xD,"Decremento: "
    len_decremento: equ $ - msg_decremento

    contador db 1

section .bss
    resultado: resb 1

section .text
    global _start

_start:
    ;mostrar mensaje de suma
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_suma
    mov edx, len_suma
    int 0x80

    ;sumar
    mov eax, 4
    mov ebx, 5
    add eax, ebx            ;eax += ebx
    add eax, '0'            ;añadir el caracter final para mostrar por pantalla
    mov [resultado], eax          ;asignar el valor de eax a el valor de la variable res
    
    ;mostrar resultado de la suma
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    ;mostrar mensaje de resta
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resta
    mov edx, len_resta
    int 0x80

    ;restar
    mov eax, 5
    mov ebx, 4
    sub eax, ebx
    add eax, '0'
    mov [resultado], eax

    ;mostrar resultado de la resta
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    ;mostrar mensaje incremento
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_incremento
    mov edx, len_incremento
    int 0x80    

    ;incrementar
    mov eax, 1
    inc eax
    add eax, '0'
    mov [resultado], eax

    ;mostrar resultado incremento
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    ;mostrar mensaje decremento
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_decremento
    mov edx, len_decremento
    int 0x80

    ;decremento
    mov eax, 1
    dec eax
    add eax, '0'
    mov [resultado], eax

    ;mostrar resultado decremento
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    mov eax,1     ;salir del programa
    int 0x80

