.MODEL SMALL
.STACK 100h
.DATA
MATRIZ DB 1, 20, 30, 40
       DB 50, 2, 70, 80
       DB 90, 100, 3, 120
       DB 130, 140, 150, 3
SOMA DB 0  ; Inicializa SOMA como zero
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    XOR SI, SI          ; Inicializa o índice da matriz
    XOR BL, BL          ; BL será usado para somar
    MOV CX, 0           ; Inicializa o contador

LOOPI:
    MOV AL, MATRIZ[SI]  ; Carrega o elemento atual da matriz
    ADD BL, AL          ; Soma o elemento ao acumulador
    INC SI              ; Avança para o próximo elemento (incrementa em 1)
    INC CX              ; Incrementa o contador
    CMP CX, 12          ; Verifica se já somou 12 elementos
    JL LOOPI           ; Se não, continue o loop

FIM:
    ; Converte a soma em ASCII para impressão
    ADD BL, '0'         ; Converte para caractere ASCII

    MOV AH, 02h         ; Função para imprimir um caractere
    MOV DL, BL          ; Move o resultado para DL
    INT 21h             ; Chama a interrupção para imprimir

    ; Finaliza o programa
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
