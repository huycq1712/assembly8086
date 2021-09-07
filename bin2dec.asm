.model small
.stack 100h
.data
    messIn db 'nhap chuoi can chuyen doi:$'
    messOut db 13,10,'gia tri sau chuyen doi:$'
    so db 0 
.code
main proc
    
    ; khoi tao doan du lieu
    mov ax, @data
    mov ds, ax            
    
    ;hien thi thong bao nhap
    mov ah, 09h
    lea dx, messIn
    int 21h
    
    mov cx, 0
nhap:
     cmp cx, 8
     je in_thong_bao_kq
     mov ah, 01h
     int 21h
     sub al, 30h
     mov dl, al
     mov ah, 0
     mov al, so
     mov bl, 2
     mul bl
     add al, dl
     mov so, al
     inc cx
     jmp nhap

in_thong_bao_kq:
     mov ah, 09h
     lea dx, messOut
     int 21h
     
     mov bl, 10
     mov al, so
     mov ah, 0
     mov cx, 0

in_kq:
     cmp al, 0
     je in_ra_kq
     inc cx
     div bl
     mov dl, ah
     mov ah, 0
     push dx
     jmp in_kq

in_ra_kq:
     pop dx
     add dl, 30h
     mov ah, 02h
     int 21h
     loop in_ra_kq
     
thoat:
     mov ah, 4ch
     int 21h

main endp
end main