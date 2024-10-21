.MODEL SMALL
.STACK 100h
.DATA
    VETOR DB 7 DUP(0)        ; Define um vetor de 7 elementos
    IMPR DB 10, 13, 'DIGITE O VETOR:$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Imprime a mensagem de entrada
    MOV AH, 09h
    LEA DX, IMPR
    INT 21h

    ; Lê os caracteres
    XOR SI, SI               ; Zera SI para usar como índice
    MOV CX, 7                ; Define quantos caracteres serão lidos
    CALL LERCARACTERES

    ; Inverte o vetor
    MOV CX, 7                ; Tamanho do vetor
    SHR CX, 1                ; Divide por 2 para fazer o loop de inversão
    XOR DI, DI               ; Reseta DI (índice do final)

INVERTENDO:
    MOV AL, VETOR[DI]        ; Carrega o elemento do início
    MOV DL, VETOR[6 - DI]    ; Carrega o elemento do final
    MOV VETOR[DI], DL        ; Troca os elementos
    MOV VETOR[6 - DI], AL    ; Troca os elementos

    INC DI                   ; Avança o índice da frente
    CMP DI, 3                ; Verifica se já trocou todos os pares
    JL INVERTENDO            ; Se DI < 3, continua invertendo

    ; Imprime o vetor invertido
    CALL PRINT

    ; Finaliza o programa
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

LERCARACTERES PROC
    MOV CX, 7                ; Número de caracteres a ler
LEITURA:
    MOV AH, 01h              ; Função para ler um caractere
    INT 21h
    MOV VETOR[SI], AL        ; Armazena o caractere no vetor
    INC SI                   ; Incrementa o índice
    LOOP LEITURA             ; Loop até ler todos os caracteres
    RET
LERCARACTERES ENDP

PRINT PROC
    MOV CX, 7                ; Número de caracteres a imprimir
    XOR SI, SI               ; Zera SI para usar como índice
    MOV AH, 02h              ; Função para imprimir caractere

IMPRIMIR:
    MOV DL, VETOR[SI]        ; Carrega o próximo caractere
    INT 21h                  ; Imprime o caractere
    INC SI                   ; Avança o índice
    LOOP IMPRIMIR            ; Continua até imprimir todos

    RET
PRINT ENDP

END MAIN
