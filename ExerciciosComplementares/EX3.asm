.MODEL SMALL
.STACK 100h
.DATA
MSG DB 'DIGITE UM CARACTER: $'
MSG2 DB 10,13, "O NUMERO DE 1s NO CODIGO ASCII EH: $"
CHAR DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09
    LEA DX,MSG
    INT 21H
    MOV AH,01
    INT 21H
    MOV CHAR,AL
    XOR BL,BL
    MOV CX,8

    CONTAGEM:
    TEST AL, 1          ; Verifica o bit menos significativo
    JZ MAIS             ; Se for 0, pula para MAIS
    INC BL              ; Se for 1, incrementa o contador

MAIS:
    SHR AL, 1           ; Desloca à direita
    LOOP CONTAGEM       ; Decrementa CX e repete se CX != 0

    IMPRIMIR:
    MOV AH,09
    LEA DX,MSG2
    INT 21H
    ADD BL,30h
    MOV AH,02
    MOV DL,BL 
    INT 21H
    MOV AH,4CH
    INT 21h
MAIN ENDP
END MAIN
