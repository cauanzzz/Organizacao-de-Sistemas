.MODEL SMALL
.STACK 100H
.DATA
    msgInput DB 'Digite um numero decimal (ate 16 bits): $'
    msgOutput DB 0DH, 0AH, 'O numero binario armazenado em BX e: $'
    teclaEnter DB 13 ; ASCII para Enter
.CODE
START:
    ; Configura o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibe a mensagem para o usuário
    MOV AH, 09H
    LEA DX, msgInput
    INT 21H

    ; Zera BX para preparar o armazenamento
    XOR BX, BX

LER_CARACTERE:
    ; Captura um caractere digitado
    MOV AH, 01H
    INT 21H

    ; Verifica se a tecla Enter foi pressionada
    CMP AL, teclaEnter
    JE FIM_ENTRADA

    ; Converte os caracteres '0' ou '1' em valores binários
    SUB AL, '0'

    ; Rotaciona BX e insere o bit lido
    ROL BX, 1    ; Rotaciona BX para a esquerda
    OR BL, AL    ; Insere o bit no LSB de BX

    ; Continua a leitura do próximo caractere
    JMP LER_CARACTERE

FIM_ENTRADA:
    ; Exibe a mensagem de resultado
    MOV AH, 09H
    LEA DX, msgOutput
    INT 21H

    ; Chama a função para exibir o valor binário de BX
    CALL MOSTRAR_BINARIO

    ; Finaliza a execução do programa
    MOV AH, 4CH
    INT 21H

; Função para exibir o valor binário de BX
MOSTRAR_BINARIO PROC
    PUSH AX
    PUSH BX
    MOV CX, 16       ; Número de bits a serem exibidos

EXIBIR_BITS:
    ; Rotaciona BX e verifica o carry flag
    RCL BX, 1
    JC IMPRIME_1     ; Se o carry for 1, exibe '1'
    MOV DL, '0'      ; Caso contrário, exibe '0'
    JMP IMPRIMIR_CARACTERE

IMPRIME_1:
    MOV DL, '1'

IMPRIMIR_CARACTERE:
    MOV AH, 02H      ; Função de exibição de caractere
    INT 21H
    LOOP EXIBIR_BITS  ; Continua até exibir todos os 16 bits

    POP BX
    POP AX
    RET
MOSTRAR_BINARIO ENDP

END START
