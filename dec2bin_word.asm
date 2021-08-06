.MODEL SMALL
.STACK 100H
.DATA
        NHAP DB 'HAY NHAP MOT GIA TRI:$'
        XUAT DB 13,10,'GIA TRI NHI PHAN:$'
        SO DW 0
.CODE
MAIN    PROC
        ;KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        ;HIEN THI THONG BAO NHAP
TBNHAP:
        MOV AH, 09H
        LEA DX, NHAP
        INT 21H
        ;NHAP SO
        MOV BX, 10
NHAPSO:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE  TBXUAT
        SUB AL, 30H
        MOV CL, AL
        MOV CH, 0
        MOV AX, SO
        MUL BX
        ADD AX, CX
        MOV SO, AX
        JMP NHAPSO
        
TBXUAT:
        MOV AH, 09H
        LEA DX, XUAT
        INT 21H
        MOV CX, 0
        MOV BL, 2
        MOV AX, SO

CHIA:
        DIV BL
        XCHG AL, AH
        PUSH AX
        INC CX
        CMP AH, 0
        JE KETQUA
        XCHG AL, AH
        MOV  AH, 0
        JMP CHIA
KETQUA:
        POP DX
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        LOOP KETQUA

THOAT:
        MOV AH, 4CH
        INT 21H
        
        
        

MAIN    ENDP
END MAIN
