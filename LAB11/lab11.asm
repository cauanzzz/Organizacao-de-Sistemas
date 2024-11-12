.MODEL SMALL
.DATA
msg db 10, 13, 'Digite um numero a ser convertido: $'
msg1 db 10, 13, 'Escolha o tipo de conversao: ', 10, 13, 'Binario = 1',10, 13,'Octal = 2',10, 13,'Hexadecimal = 3',10,13,'-> $'
msg2 db 10,13, 'Numero em binario: $'
msg3 db 10,13, 'Numero em octal: $'
msg4 db 10,13, 'Numero em hexadecimal: $'

.CODE
main proc
    mov ax, @DATA
    mov ds, ax         ; Inicializa o segmento de dados

    ; Exibe mensagem para entrada do numero
    mov ah, 9
    mov dx, offset msg
    int 21h

entrada_num:
    mov ah, 1           ; Le um caractere do teclado
    int 21h
    cmp al, 13          ; Verifica se é Enter para finalizar a entrada
    je escolher_base
    
    and ax, 0FH         ; Converte caractere para valor numerico
    push ax             ; Armazena temporariamente na pilha
    mov ax, 10          ; Multiplica por 10 para ajustar posição decimal
    mul bx              ; Multiplicacao com valor atual em BX
    pop bx              ; Recupera valor anterior
    add bx, ax          ; Acumula valor total em BX
    jmp entrada_num

escolher_base:
    ; Exibe mensagem de seleção de base de conversão
    mov ah, 09
    lea dx, msg1
    int 21h

leitura_opcao:
    mov ah, 1           ; Le a escolha da base de conversao
    int 21h
    cmp al, '1'         ; Verifica se a escolha foi Binario
    je bin
    cmp al, '2'         ; Verifica se a escolha foi Octal
    je octal
    cmp al, '3'         ; Verifica se a escolha foi Hexadecimal
    je hexa

bin:
    mov ah, 09
    lea dx, msg2        ; Exibe mensagem para conversao binaria
    int 21h
    call conv_bin       ; Procedimento para conversao binaria
    jmp fim

octal:
    mov ah, 09
    lea dx, msg3        ; Exibe mensagem para conversao octal
    int 21h
    call conv_octal     ; Procedimento para conversao octal
    jmp fim

hexa:
    mov ah, 09
    lea dx, msg4        ; Exibe mensagem para conversao hexadecimal
    int 21h
    call conv_hexa      ; Procedimento para conversao hexadecimal
    jmp fim

fim:
    mov ah, 4Ch
    int 21h             ; Termina o programa
main endp

; Procedimento de conversao para binario
conv_bin PROC
    push ax
    push bx
    push cx
    push dx

    xor cx, cx
    mov ax, bx
    mov bx, 2           ; Prepara divisor para conversao binaria
ciclo_bin:
    xor dx, dx
    div bx              ; Divide por 2
    push dx             ; Armazena resto
    inc cx
    cmp ax, 0
    jne ciclo_bin

    ; Exibe os bits na ordem correta
    mov ah, 02H
imprime_bin:
    pop dx
    cmp dx, 9
    ja ajusta_letra_bin
    or dx, 30h
    jmp imprime_binario
ajusta_letra_bin:
    add dx, 55D

imprime_binario:
    int 21H
    loop imprime_bin

    ; Recupera registradores
    pop dx
    pop cx
    pop bx
    pop ax
    ret
conv_bin ENDP

; Procedimento de conversao para octal
conv_octal PROC
    push ax
    push bx
    push cx
    push dx

    xor cx, cx
    mov ax, bx
    mov bx, 8           ; Prepara divisor para conversao octal
ciclo_octal:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne ciclo_octal

    ; Exibe os valores octais
    mov ah, 02H
imprime_octal:
    pop dx
    cmp dx, 9
    ja ajusta_letra_octal
    or dx, 30h
    jmp imprime_octais
ajusta_letra_octal:
    add dx, 55D

imprime_octais:
    int 21H
    loop imprime_octal

    ; Recupera registradores
    pop dx
    pop cx
    pop bx
    pop ax
    ret
conv_octal ENDP

; Procedimento de conversao para hexadecimal
conv_hexa PROC
    push ax
    push bx
    push cx
    push dx

    xor cx, cx
    mov ax, bx
    mov bx, 16          ; Prepara divisor para conversao hexadecimal
ciclo_hexa:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne ciclo_hexa

    ; Exibe os valores hexadecimais
    mov ah, 02H
imprime_hexa:
    pop dx
    cmp dx, 9
    ja ajusta_letra_hexa
    or dx, 30h
    jmp imprime_hexadec
ajusta_letra_hexa:
    add dx, 55D

imprime_hexadec:
    int 21H
    loop imprime_hexa

    ; Recupera registradores
    pop dx
    pop cx
    pop bx
    pop ax
    ret
conv_hexa ENDP

end main
