.MODEL SMALL
.STACK 100H
.DATA
        NHAP DB 'NHAP CHUOI: $'
        XUAT DB 13,10,'CHUOI DA NHAP LA:$'
        CHUOI DB 200 DUP('$')   ; PLACEHOLD

MAIN PROC
         ; KHOI TAO DOAN DU LIEU
         MOV AX, @DATA
         MOV DS, AX
         ; THONG BAO NHAP CHUOI
         MOV AH, 09H
         LEA DX, NHAP
         INT 21H
         ; THUC HIEN NHAP CHUOI
         MOV AH, 0AH
         LEA DX, CHUOI
         INT 21H
         ; HIEN THI THONG BAO XUAT CHUOI
         MOV AH, 09H
         LEA DX, XUAT
         INT 21H
         ; HIEN THI CHUOI DA NHAP
         LEA DX, CHUOI+2
         INT 21H
         ; THOAT
         MOV AH, 4CH
         INT 21H
         
MAIN ENDP

END MAIN