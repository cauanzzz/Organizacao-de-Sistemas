.MODEL SMALL
.STACK 100H
.DATA
msg db 'Digite um caracter: $'
msg2 db 'O caracter eh: $'
caracter db ?

.CODE
MAIN PROC

    ; Inicializa os dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibe a mensagem pedindo dados
    MOV AH, 09H
    LEA DX, msg
    INT 21H

    ; Lê 1 caractere
    MOV AH, 01H
    INT 21H
    MOV caracter, AL   ; Armazena o caractere lido

    ; Imprime a segunda mensagem
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    ; Imprime o caractere
    MOV DL, caracter    ; Move o caractere para DL
    MOV AH, 02H         ; Função para imprimir um caractere
    INT 21H

    ; Encerra o programa
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
