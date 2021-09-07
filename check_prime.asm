.model small
.stack 100
.data
        msg1 db 'hay nhap mot so nguyen: $'
        msg2 db 13,10,'day la so nguyen to!$'
        msg3 db 13,10,'day khong phai so nguyen to!$' 
.code

main proc
     
     ;khoi tao doan du lieu
     mov ax,@data
     mov ds, ax
     ;hien thi thong bao nhap du lieu
     mov ah, 09h
     lea dx, msg1
     int 21h
     
     ;nhap tu nhien
     mov bx, 10
     xor dx, dx
     xor cx, cx
nhap:
     mov ah, 01h
     int 21h
     cmp al, 13
     je set_up
     sub al, 30h
     mov cl, al
     mov ax, dx
     mul bx
     add ax, cx
     mov dx, ax
     jmp nhap
     

set_up:
     ;set up check so ngto
     mov bx, 02h
     mov cx, dx
     mov dx, 0

check_ngto:
     mov ax, cx
     mov dx, 0
     div bx
     cmp dx, 0
     je result1
     inc bx
     cmp bx, ax
     jnl check_it
     jmp check_ngto 

check_it:
     cmp dx, 0
     je result1
     jne result2
     
result1:
     mov ah, 09h
     lea dx, msg3
     int 21h
     jmp thoat
     
result2:
     mov ah, 09h
     lea dx, msg2
     int 21h
     jmp thoat   
     
thoat:
     mov ah, 4ch
     int 21h
    
main endp
end main