.MODEL SMALL
.STACK 100h
.DATA
 MSG1 DB 'DIGITE SEU NOME$'
 MSG2 DB 10, 13, 'O NUMERO DE VOGAIS eh: $'
 VOGA DB ?
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 0      ; Contador de caracteres
    MOV BL, 0      ; Contador de vogais

    MOV AH, 09h
    LEA DX, MSG1
    INT 21H

LERCARACTERES:
    MOV AH, 01h
    INT 21H

    CMP AL, 13       ; Verifica se foi pressionada a tecla Enter
    JE FIM

    CMP AL, ' '      ; Verifica se é um espaço
    JE ESPACO

    ; Verifica se é uma vogal
    CMP AL, 'a'
    JE VOGAL
    CMP AL, 'e'
    JE VOGAL
    CMP AL, 'i'
    JE VOGAL
    CMP AL, 'o'
    JE VOGAL
    CMP AL, 'u'
    JE VOGAL
    CMP AL, 'A'
    JE VOGAL
    CMP AL, 'E'
    JE VOGAL
    CMP AL, 'I'
    JE VOGAL
    CMP AL, 'O'
    JE VOGAL
    CMP AL, 'U'
    JE VOGAL

    ; Se não for vogal e não for espaço, ignora
    JMP IGNORA

ESPACO:
    INC CX           ; Conta o espaço como um caractere
    JMP CHECA_LIMITE

VOGAL:
    INC BL           ; Incrementa o contador de vogais
    INC CX           ; Conta a vogal como um caractere
    JMP CHECA_LIMITE

IGNORA:
    INC CX           ; Incrementa o contador de caracteres
    JMP CHECA_LIMITE

CHECA_LIMITE:
    CMP CX, 10     ; Verifica se já foram lidos 5 caracteres
    JE FIM
    JMP LERCARACTERES

FIM:
    MOV AH, 09h
    LEA DX, MSG2
    INT 21H

    MOV VOGA, BL
    MOV AL, VOGA
    ADD AL, '0'      ; Converte para ASCII

    MOV AH, 02h
    MOV DL, AL
    INT 21H

    MOV AH, 4Ch
    INT 21H

MAIN ENDP
END MAIN
