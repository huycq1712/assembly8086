.MODEL SMALL
.STACK 100H
.DATA
        MSG0 DB 'HAY NHAP MOT GIA TRI N TU 1 DEN 9:$'
        MSG1 DB 13,10,'NHAP LAI:$'
        MSG2 DB 13,10,'GIA TRI N!:$'
        GT   DB 0
.CODE
MAIN    PROC
        ;KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        ;HIEN THI THONG BAO NHAP
        MOV AH, 09H
        LEA DX, MSG0
        INT 21H
NHAP:
        MOV AH, 01H
        INT 21H
        CMP AL, 30H
        JNA NHAPLAI
        CMP AL, 3AH
        JNL NHAPLAI
        SUB AL, 30H
        MOV GT, AL
        JMP THONGBAOKQ
NHAPLAI:
        MOV AH, 09H
        LEA DX, MSG1
        INT 21H
        MOV AH, 01H
        INT 21H
        CMP AL, 30H
        JNA NHAPLAI
        CMP AL, 3AH
        JNL NHAPLAI
        SUB AL, 30H
        MOV GT, AL
        JMP THONGBAOKQ
THONGBAOKQ:
        MOV AH, 09H
        LEA DX, MSG2
        INT 21H        
        
TINHGIAITHUA:
        XOR CX, CX
        MOV CL, GT
        MOV AX, CX
        SUB CX, 1
NHAN:
        CMP CX, 1
        JE  SETUPCHIA
        MUL CX
        MOV BX, DX
        DEC CX
        MOV DX, BX
        JMP NHAN
            
SETUPCHIA:
        MOV CX, 0
        MOV BX, 10
CATSTACK:
        DIV BX
        PUSH DX
        MOV DX, 0
        INC CX
        CMP AX, 0
        JE  INKQ
        JMP CATSTACK
INKQ:
        POP DX
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        LOOP INKQ
   
        
THOAT:
        MOV AH, 4CH
        INT 21H


      
        
MAIN    ENDP
END     MAIN