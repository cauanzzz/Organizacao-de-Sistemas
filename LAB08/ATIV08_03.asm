.MODEL SMALL
.STACK 100H
.DATA
    msgEntrada DB 'Insira um numero hexadecimal (ate 4 digitos): $'
    enterKey DB 13 ; ASCII para tecla Enter
.CODE
START:
    ; Configura o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibe a mensagem de entrada para o usuário
    MOV AH, 09H
    LEA DX, msgEntrada
    INT 21H

    ; Inicializa o registrador BX em 0
    XOR BX, BX

LER_LOOP:
    ; Captura um caractere digitado
    MOV AH, 01H
    INT 21H

    ; Verifica se o usuário pressionou Enter (fim da entrada)
    CMP AL, enterKey
    JE FIM_ENTRADA

    ; Converte o caractere hexadecimal para binário
    ; Se o caractere estiver entre '0' e '9'
    CMP AL, '9'
    JBE DIGITO_09
    ; Se o caractere estiver entre 'A' e 'F'
    CMP AL, 'A'
    JB CARACTERE_INVALIDO
    CMP AL, 'F'
    JA CARACTERE_INVALIDO
    SUB AL, 'A' - 10
    JMP DESLOCA_BX

DIGITO_09:
    SUB AL, '0'

DESLOCA_BX:
    ; Desloca BX 4 bits para a esquerda para acomodar o próximo dígito
    SHL BX, 4

    ; Armazena o valor binário nos 4 bits menos significativos de BX
    OR BL, AL

    ; Continua lendo o próximo caractere
    JMP LER_LOOP

CARACTERE_INVALIDO:
    ; Se o caractere for inválido, podemos ignorá-lo ou tratar o erro de outra forma
    JMP LER_LOOP

FIM_ENTRADA:
    ; Finaliza a execução do programa
    MOV AH, 4CH
    INT 21H

END START
