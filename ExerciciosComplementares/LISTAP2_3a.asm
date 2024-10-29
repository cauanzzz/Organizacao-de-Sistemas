TITLE saidas2.asm
.MODEL SMALL
.STACK 100H
.DATA
    msgIni DB "Insira o numero que sera convertido: $"
    msgHexa DB 10,13, "BASE 16: $"
.CODE
main PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,09
    LEA DX,msgIni       ;MENSGEM INICIAL
    INT 21H

        @LOOP_LEITURA:
        MOV AH,01
        INT 21H
        CMP AL,13
        JE @SAI_LEITURA     ;SE É ENTER ENTÃO SAI
        AND  AX, 0FH      ;TRANSFORMA EM NUMERO
        PUSH AX             ;GUARDA VALOR ANTES DA OPERACAO
        MOV AX,10           ;MOVE MULTIPLICADOR PARA AX
        MUL BX              ;FAZ AX x BX
        POP BX              ;DEVOLVE O VALOR PARA BX
        ADD BX,AX           ;ADCIONA O VALOR ANTES LIDO AGORA DO VALOR TOTAL (BX = BX + (BX x AX))
        JMP @LOOP_LEITURA
        @SAI_LEITURA:
       MOV AH,09
    LEA DX,msgHexa          ;MENSAGEM HEXA
    INT 21H
    CALL sai_hexa           ;FUNÇÃO HEXA
        MOV AH,4CH
    INT 21H
main ENDP
;saida hexa
sai_hexa PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX             ;SALVA VALORES DA MAIN NA PILHA PARA DEPOIS DEVOLVER

    xor cx,cx           ;ZERA CONTADOR
    mov AX,bx           ;MOVE DIVIDENDO PARA AX (SERÁ O NÚMERO INSERIDO PELO USUÁRIO)
    MOV BX,16           ;DIVISOR É 16 (POIS ESTAMOS CONVERTENDO PARA A BASE 16
    @LOOP_HEXA:
        XOR DX,DX       ;Vamos armazenar o resto em DX toda vez que o loop voltar entao precisa ser sempre zerado
        DIV BX          ; AX : BX (RESTO EM DX E QUOCIENTE EM AX)

        PUSH DX         ;Guardar o valor do resto para a impressão mais tarde
        INC CX          ;incrementa mais um algarismo que será impresso

        CMP AX,0        ;Se o quociente for 0, significa que devemos parar a divisao e iniciar a impressão
        JNE @LOOP_HEXA

        
        MOV AH,02H      
    @IMPRIME_HEXA:      ;LOOP DE IMPRESSÃO
        POP DX
        CMP DX, 9
        JA @EH_LETRA

        OR DX, 30H
        JMP @PULA_LETRA

        @EH_LETRA:
            ADD DX, 55D

        @PULA_LETRA:
        INT 21H
        LOOP @IMPRIME_HEXA


    POP DX
    POP CX
    POP BX              ;vamos devolver os valores originais aos registradores
    POP AX
    RET
sai_hexa ENDP
END MAIN