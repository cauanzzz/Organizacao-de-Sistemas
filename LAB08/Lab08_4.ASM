.MODEL SMALL
.STACK 100H

.DATA
.CODE
principal PROC
    ; Inicializa o segmento de dados
    MOV AX, @DATA           
    MOV DS, AX              

    ; Carrega o valor hexadecimal para exibir
    MOV BX, 1234H           

    ; Define a quantidade de nibbles (16 bits = 4 nibbles)
    MOV CX, 4               

proximo_nibble:
    ; Copia BX para DX e mascara os 4 bits mais significativos
    MOV DX, BX              
    AND DX, 0F000H          

    ; Desloca os 12 bits para a direita para isolar o nibble
    SHR DX, 12              

    ; Verifica se o valor é menor que 10
    CMP DL, 9               
    JBE converter_p_digito  

    ; Ajusta para caracteres 'A'-'F' se for maior que 9
    ADD DL, 7               

converter_p_digito:
    ; Converte para caractere ('0'-'9' ou 'A'-'F')
    ADD DL, '0'             
    CALL mostrar_caractere  

    ; Desloca BX 4 bits à esquerda para o próximo nibble
    SHL BX, 4               
    LOOP proximo_nibble     

    ; Termina a execução do programa
    MOV AH, 4CH             
    INT 21H                 

; Função para exibir um caractere na tela
mostrar_caractere PROC
    ; Chama a função de exibição de caractere
    MOV AH, 02H             
    INT 21H                 
    RET                     
mostrar_caractere ENDP

principal ENDP
END principal
