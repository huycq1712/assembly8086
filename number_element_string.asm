.MODEL SMALL
.STACK 100H
.DATA
        NHAP DB 'NHAP MOT CHUOI:$'
        XUAT DB 'DO DAI CUA CHUOI:$'
        CRLF DB 13,10,'$'
.CODE

MAIN    PROC
    
            ;KHOI TAO DOAN DU LIEU
            MOV AX, @DATA
            MOV DS, AX
            
            ;HIEN THI THONG BAO NHAP VAO
            MOV AH, 09H
            LEA DX, NHAP
            INT 21H
                        
            ;XOA BX, CX
            XOR BX, BX
            XOR CX, CX
            ;NHAP MOT CHUOI
            
NHAPCHUOI:
            MOV AH, 01H
            INT 21H
            CMP AL, 13
            JE RA
            INC CX
            JNE NHAPCHUOI
           
RA:
            MOV AH, 09H
            LEA DX, CRLF
            INT 21H
            LEA DX, XUAT
            INT 21H
            ;GAN DXAX
            
            MOV AX, CX
            XOR CX, CX
            MOV BX, 10
DODAI:      
            MOV DX, 0
            DIV BX
            PUSH DX
            CMP AX, 0
            JE KETQUA
            INC CX
            JNE DODAI
         
KETQUA:
            MOV AH, 02H
            POP DX
            ADD DX, 30H
            INT 21H
            CMP CX, 0
            JE THOAT
            DEC CX
            JNE KETQUA            




THOAT:            
            
            ;THOAT
            MOV AH, 4CH
            INT 21H


MAIN    ENDP
END     MAIN