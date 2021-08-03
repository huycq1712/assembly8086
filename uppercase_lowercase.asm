.MODEL SMALL
.STACK 100H
.DATA
        NHAP DB 'NHAP MOT KI TU THUONG:$'
        XUAT DB 'KI TU HOA DO LA:$'
        CRLF DB 13,10,'$'
.CODE      
MAIN    PROC
        ; KHOI TAO DOAN DU LIEU
        MOV AX, @DATA
        MOV DS, AX
        
        ;IN YEU CAU NHAP MOT KI TU
        MOV AH, 9
        LEA DX, NHAP
        INT 21H     
        
        ;LUU KI TU VAO THANH GHI
        MOV AH, 1
        INT 21H  
        ;CHUYEN KI TU THUONG THANH KI TU HOA      
        SHB AL, 20H
        ;CAT THANH GHI AX VAO STACK
        PUSH AX
        ;XUONG DONG
        MOV AH, 9
        LEA DX, CRLF
        INT 21H
        ;IN 'KI TUA HOA DO LA:'
        LEA DX, XUAT
        INT 21H
        ;IN KI TU VIET HOA
        POP DX
        MOV AH, 2
        INT 21H
        ;THOAT RA KHOI CHUONG TRINH
        MOV AH, 4CH
        INT 21H
        
        
        

MAIN    ENDP

        END MAIN
        