TITLE saidas2.asm
.MODEL SMALL
.STACK 100H
.DATA
    msgIni DB "Insira o numero que sera convertido: $"
    msgHexa DB 10,13, "BASE 16: $"
    msgOcta DB 10,13, "BASE 8: $"
    msgBin DB 10,13, "BASE 2: $"
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
    
    LEA DX,msgOCta
    INT 21H                 ;MENSAGEM OCTA
    CALL sai_oct            ;FUNÇÃO OCTA

    LEA DX,msgBin           ;MENSAGEM BIN
    INT 21H
    CALL sai_bin            ;FUNÇÃO BIN

    ;RESUMO DA FUNÇÃO DIV (PARA VALORES DE 4 BYTES)
    ; Quociente em AX
    ; Resto em DX
    ; Divisor em BX

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

;saida octal
sai_oct PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    xor cx,cx
    mov AX,bx
    MOV BX,8            ;Agora a divisao deve ser por 8 para converter para a base OCTA
    @LOOP_OCTA:
        XOR DX,DX
        DIV BX

        PUSH DX
        INC CX

        CMP AX,0
        JNE @LOOP_OCTA

        
        MOV AH,02H
    @IMPRIME_OCTA:
        POP DX
        CMP DX, 9
        JA @EH_LETRA1

        OR DX, 30H
        JMP @PULA_LETRA1

        @EH_LETRA1:
            ADD DX, 55D

        @PULA_LETRA1:
        INT 21H
        LOOP @IMPRIME_OCTA


    POP DX
    POP CX
    POP BX
    POP AX
RET
sai_oct ENDP

;saida binaria
sai_bin PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    xor cx,cx
    mov AX,bx
    MOV BX,2            ;Agora a divisao deve ser por 2 para converter para a base BINÁRIA
    @LOOP_BIN:
        XOR DX,DX
        DIV BX

        PUSH DX
        INC CX

        CMP AX,0
        JNE @LOOP_BIN

        
        MOV AH,02H
    @IMPRIME_BIN:
        POP DX
        CMP DX, 9
        JA @EH_LETRA2

        OR DX, 30H
        JMP @PULA_LETRA2

        @EH_LETRA2:
            ADD DX, 55D

        @PULA_LETRA2:
        INT 21H
        LOOP @IMPRIME_BIN


    POP DX
    POP CX
    POP BX
    POP AX
RET
sai_bin ENDP

END MAIN