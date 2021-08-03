.MODEL SMALL
.STACK 100H
.DATA
        NHAP1 DB 'HAY NHAP SO HANG DAU TIEN:$'
        NHAP2 DB 13,10,'HAY NHAP SO HANG THU HAI :$'
        XUAT  DB 13,10,'KET QUA LA:$'  
        CRLF  DB 13,10,'$'
        
        SO_1 DB 0
        SO_2 DB 0
.CODE
MAIN    PROC
        
        ;KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        
        ;HIEN THI THONG BAO NHAP SO HANG DAU TIEN
        MOV AH, 09H
        LEA DX, NHAP1
        INT 21H
        
        ;NHAP SO HANG DAU TIEN
        XOR DX, DX
        MOV BL, 10
        MOV AX, 0000H
        PUSH AX
NHAPSO1:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE  THONGBAONHAP2
        SUB AL, 30H
        MOV DL, AL
        MOV AL, SO_1
        MUL BL
        ADD AL, DL
        MOV SO_1, AL
        JMP NHAPSO1
        
THONGBAONHAP2:
        MOV AH, 09H
        LEA DX, NHAP2
        INT 21H
NHAPSO2:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE  THONGBAOKETQUA
        SUB AL, 30H
        MOV DL, AL
        MOV AL, SO_2
        MUL BL
        ADD AL, DL
        MOV SO_2, AL
        JMP NHAPSO2
THONGBAOKETQUA:
        MOV AH, 09H
        LEA DX, XUAT
        INT 21H
        MOV AL, SO_1
        ADD AL, SO_2
        
        MOV CX, 0
        MOV BL, 10
        MOV AH, 0

HIENTHINOIDUNG:
        DIV BL
        PUSH AX
        INC CX
        CMP AL, 0
        JE  HIENTHIKETQUA
        MOV AH, 0
        JMP HIENTHINOIDUNG
        
HIENTHIKETQUA:
        POP AX
        MOV DL, AH
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        LOOP HIENTHIKETQUA
        
        MOV AH, 4CH
        INT 21H
        
        
        
         
        
    
    
    
MAIN    ENDP
END     MAIN