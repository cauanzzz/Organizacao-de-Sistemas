.MODEL SMALL
.DATA
VETOR DB 1, 1, 1, 2, 2, 2 ; inicializacao do vetor
.CODE
MAIN PROC
MOV AX, @DATA ; acesso as variveis
MOV DS,AX
XOR DL, DL ;zera dl
MOV CX,6 ; define cx como 6
XOR DI, DI; zera DI
CALL VETORIAL ;aciona o procedimento vetorial

MOV AH,4CH ;encerra o programa
INT 21H ;saida para o DOS
MAIN ENDP

VETORIAL PROC ;nomeia e define o procedimento

VOLTA:
MOV DL, VETOR[DI] ; coloca o valor que DI aponta em vetor em DL para a impressão
INC DI ;+1 em DI
ADD DL, 30H ; transforma o carcter em ASCII
MOV AH, 02; impressao do caracter
INT 21H
LOOP VOLTA
RET

VETORIAL ENDP
END MAIN
