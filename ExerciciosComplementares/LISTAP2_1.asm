.MODEL SMALL
.STACK 100h
.DATA
VETOR DB 'C', 'A', 'U', 'A', 'N', 'B', 'R', 'A', 'G', 'A', '$'  ; Adicione um terminador
COUNT DB 0  ; Para armazenar o número de 'A's

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    XOR CX, CX         ; CX será o contador de 'A'
    XOR SI, SI         ; SI será o índice do vetor

COMPARE:
    CMP VETOR[SI], '$'  ; Verifique o terminador
    JE FIM              ; Se for o terminador, vá para FIM

    CMP VETOR[SI], 'A'  ; Compare o caractere atual com 'A'
    JNE NEXT            ; Se não for 'A', vá para NEXT
    INC CX              ; Se for 'A', incremente o contador

NEXT:
    INC SI              ; Avançar para o próximo caractere
    JMP COMPARE         ; Repetir o loop

FIM:
    XOR AX,AX
    MOV AL, CL         ; Carregar o contador de 'A' em AL
    ADD AL, 30H        ; Converter para caractere ASCII
    MOV AH, 02h
    MOV DL,AL
    INT 21h             ; Imprimir o resultado
    MOV AH,4CH

    ; Finaliza o programa
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
