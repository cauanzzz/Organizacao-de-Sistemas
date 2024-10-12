.MODEL SMALL
.STACK 100H
.DATA
    msgInput DB 'Insira um valor binario (max 16 bits): $'
    msgOutput DB 0DH, 0AH, 'O valor em BX e: $'
    enterKey DB 13 ; Código ASCII para Enter
.CODE
START:
    ; Configura o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibe a mensagem para entrada de dados
    MOV AH, 09H
    LEA DX, msgInput
    INT 21H

    ; Zera BX (limpa o registrador BX)
    XOR BX, BX

LOOP_ENTRADA:
    ; Lê um caractere do teclado
    MOV AH, 01H
    INT 21H

    ; Verifica se a tecla Enter foi pressionada
    CMP AL, enterKey
    JE FIM_ENTRADA

    ; Converte o caractere ASCII '0' ou '1' para binário
    SUB AL, '0'

    ; Desloca BX uma posição para a esquerda
    SHL BX, 1

    ; Armazena o bit no menor bit de BX
    OR BL, AL

    ; Volta para continuar a leitura
    JMP LOOP_ENTRADA

FIM_ENTRADA:
    ; Exibe a mensagem de resultado
    MOV AH, 09H
    LEA DX, msgOutput
    INT 21H

    ; Chama a função para imprimir o valor binário de BX
    CALL MOSTRAR_BINARIO

    ; Finaliza a execução do programa
    MOV AH, 4CH
    INT 21H

; Função para imprimir o valor binário de BX
MOSTRAR_BINARIO PROC
    PUSH AX
    PUSH BX
    MOV CX, 16       ; Define que serão exibidos 16 bits

LOOP_IMPRIMIR:
    ; Desloca BX para a esquerda e verifica o bit mais significativo
    SHL BX, 1
    JC PRINTAR_1     ; Se o carry estiver setado, imprime '1'
    MOV DL, '0'      ; Se o carry não estiver setado, imprime '0'
    JMP IMPRIMIR_CARAC

PRINTAR_1:
    MOV DL, '1'

IMPRIMIR_CARAC:
    MOV AH, 02H      ; Função de exibição de caractere
    INT 21H
    LOOP LOOP_IMPRIMIR  ; Continua até imprimir todos os 16 bits

    POP BX
    POP AX
    RET
MOSTRAR_BINARIO ENDP

END START
