.MODEL SMALL
.STACK 100H
.DATA
        NHAPSO1 DB 'HAY NHAP MOT GIA TRI:$'
        KETQUA DB 13,10,'SO NHI PHAN CUA NO:$'
        S0_1 DB 0
.CODE
MAIN    PROC
        ;KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        ;HIEN THI THONG BAO NHAP GIA TRI
HIENTHI1:
        MOV AH, 09H
        LEA DX, NHAPSO1
        INT 21H
NHAPSO:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE  HIENTHI2
        MOV BL, 10
        SUB AL, 30H
        MOV CL, AL
        MOV AL, S0_1
        MUL BL
        ADD AL, CL
        MOV S0_1, AL
        JMP NHAPSO

HIENTHI2:
        MOV AH, 09H
        LEA DX, KETQUA
        INT 21H
        MOV CX, 0
        MOV AH, 0
        MOV BL, 2
        MOV AL, S0_1
CHIAKETQUA:
        DIV BL
        XCHG AL, AH
        PUSH AX
        INC CX
        CMP AH, 0
        JE HIENTHIKQ
        XCHG AL, AH
        MOV AH, 0
        JMP CHIAKETQUA
HIENTHIKQ:
        POP DX
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        LOOP HIENTHIKQ

THOAT:
        MOV AH, 4CH
        INT 21H

MAIN    ENDP
END MAIN