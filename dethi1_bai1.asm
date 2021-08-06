.MODEL SMALL
.STACK 100H
.DATA
        MSG1 DB 13,10,'HE IS A BABY$'
        MSG2 DB 13,10,'HE IS A BOY$'
        MSG3 DB 13,10,'HE IS A MAN$'
        MSG4 DB 13,10,'HE IS RETIRED$'
        MSG0 DB 'ENTER HIS AGE:$'
        AGE  DB 0
.CODE
MAIN    PROC
        ;KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        ;HIEN THI THONG BAO NHAP TUOI
        MOV AH, 09H
        LEA DX, MSG0
        INT 21H
        ;NHAP TUOI
        MOV BL, 10 
NHAP:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE  CHAY
        SUB AL, 30H
        MOV CL, AL
        MOV AL, AGE
        MUL BL
        ADD AL, CL
        MOV AGE, AL
        JMP NHAP
        
        
CHAY:
        CMP AGE, 3
        JNA INMSG1
        CMP AGE, 18
        JNA INMGS2
        CMP AGE, 60
        JNA INMSG3
        JMP INMSG4
INMSG1:
        MOV AH, 09H
        LEA DX, MSG1
        INT 21H
        JMP THOAT
INMGS2:
        MOV AH, 09H
        LEA DX, MSG2
        INT 21H
        JMP THOAT
INMSG3:
        MOV AH, 09H
        LEA DX, MSG3
        INT 21H
        JMP THOAT
INMSG4:
        MOV AH, 09H
        LEA DX, MSG4
        INT 21H
        JMP THOAT
        
THOAT:
        MOV AH, 4CH
        INT 21H
        
MAIN    ENDP
END     MAIN