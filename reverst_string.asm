.MODEL SMALL
.STACK 100H
.DATA
        NHAP DB 'HAY NHAP VAO MOT CHUOI KI TU:$'
        XUAT DB 'CHUOI KI TU NGUOC LAI LA:$'
        CRLF DB 13,10,'$'
.CODE
MAIN    PROC
        ;KHOI TAO DOAN DATA
        MOV AX, @DATA
        MOV DS, AX
        
        ;XUAT RA YEU CAU NHAP
        MOV AH, 9
        LEA DX, NHAP
        INT 21H
        
        ;XUONG DONG
        LEA DX, CRLF
        INT 21H
        
        ;NHAP KI TU KET THUC VAO STACK
        MOV AX, 13
        PUSH AX
        
        ;NHAN 1 CHUOI KI TU  
        MOV AH, 1
NHAPKITU:   
            INT 21H
            PUSH AX
            CMP AL, 13
            JNE NHAPKITU
            
        ;POP GIA TRI DAU STACK (13)
        POP BX
        
        ;IN THONG BAO PHAN HOI
        MOV AH, 9
        LEA DX, CRLF
        INT 21H
        LEA DX, XUAT
        INT 21H
        
        LEA DX, SP
        INT 21H 
        
        ;IN CHUOI KI TU NGUOC LAI
        MOV AH, 2
        
INKITU:
            POP DX
            INT 21H
            CMP DL, 13
            JNE INKITU      
        
        ;THOAT
        MOV AH, 4CH
        INT 21H

MAIN    ENDP
        END MAIN
             