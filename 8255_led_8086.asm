.MODEL SMALL
.STACK 100H
.DATA
        PORTA EQU 00H
        PORTB EQU 02H
        PORTC EQU 04H
        PORT_COM EQU 06H
        MEM DB 00H, 01H, 04H, 05H, 10H, 11H, 14H, 15H, 40H, 41H
.CODE
MAIN    PROC
        ;KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        ;KHOI TAO CHE DO
        MOV DX, PORT_COM
        MOV AL, 10000001B
        OUT DX, AL
        ;KIEM TRA PHIM BAM
THIETLAP:
        LEA BX, MEM
        MOV CX, BX
        ADD CX, 10
CHECK:  
        IN AL, PORTC
        TEST AL, 01H
        JZ HIENTHI
        MOV DX, PORTA
        MOV AL, [BX]
        OUT DX, AL
        JMP CHECK
HIENTHI:
        INC BX
        CMP BX, CX
        JE  THIETLAP
        MOV DX, PORTA
        MOV AL, [BX]
        OUT DX, AL
        IN AL, PORTC
        TEST AL, 01H
        JZ HIENTHI
        JMP CHECK 
    
MAIN    ENDP
END     MAIN
 
        