; tinh tong va hieu hai so kieu word
.MODEL SMALL
.STACK 100H
.DATA
        NHAPSO1 DB 'HAY NHAP SO THU NHAT:$'
        NHAPSO2 DB 13,10,'HAY NHAP SO THU HAI:$'
        KETQUA1 DB 13,10,'KET QUA PHEP CONG:$'
        SO_1 DW 0
        SO_2 DW 0
.CODE
MAIN    PROC
        ;KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        ;HIEN THI THONG BAO NHAP SO 1
HIENTHI1:
        MOV AH, 09
        LEA DX, NHAPSO1
        INT 21H
NHAP1:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE  HIENTHI2
        MOV CL, AL
        MOV CH, 0
        SUB CL, 30H
        MOV AX, SO_1
        MOV BX, 10
        MUL BX
        ADD AX, CX
        MOV SO_1, AX
        JMP NHAP1
HIENTHI2:
        MOV AH, 09H
        LEA DX, NHAPSO2
        INT 21H
NHAP2:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE HIENTHI3
        MOV CL, AL
        SUB CL, 30H
        MOV CH, 0
        MOV AX, SO_2
        MOV BX, 10
        MUL BX
        ADD AX, CX
        MOV SO_2, AX
        JMP NHAP2
HIENTHI3:
        MOV AH, 09H
        LEA DX, KETQUA1
        INT 21H
TONG:
        MOV AX, SO_1
        ADD AX, SO_2
        ; HIEN THI KET QUA TONG TREN MAN HINH
        MOV CX, 0
        MOV BX, 10
        MOV DX, 0
          ; CHIA DE CAT PHAN DU VAO NGAN XEP
CHIATONG:
        DIV BX
        PUSH DX
        INC CX
        CMP AX, 0
        JE  HIENTHIKQ
        MOV DX, 0
        JMP CHIATONG

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