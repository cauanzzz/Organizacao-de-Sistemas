.MODEL SMALL
.STACK 100h
pulalinha MACRO
    mov ah, 02h           
    mov dl, 13        
    Int 21h               
    mov dl, 10          
    int 21h
endm
salvaleitura MACRO
    MOV AH,01
    INT 21H
endm
.DATA   
MSG1 DB 'SEJA BEM VINDO AO BATALHA NAVAL$'
MSG2 DB 'DIGITE QUALQUER NUMERO E DIGITE ENTER PARA INICIAR:$'


MATRIZINICIAL DB 20 DUP (20 DUP ("#"))
MATRIZUSER DB 20 DUP (20 DUP(0))

;INICIALIZAREMOS 10 MATRIZES QUE SERAO SELECIONADAS PELO USUARIO DE FORMA ALEATORIO
MATRIZ0 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0