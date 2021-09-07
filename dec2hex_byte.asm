.model small
.stack 100h
.data
        msg1 db 'hay nhap mot so nguyen:$'
        msg2 db 13,10,'gia tri hex la:$'
        so db 0
.code
main proc
        ; khoi tao doan du lieu
        mov ax, @data
        mov ds, ax
        
        ;hien thi thong bao nhap
        mov ah, 09h
        lea dx, msg1
        int 21h
        
        mov bl, 10 
nhap:
        mov ah, 01h
        int 21h
        cmp al, 13
        je thongbao2
        sub al, 30h
        mov dl, al
        xor ah, ah
        mov al, so
        mul bl
        add al, dl
        mov so, al
        jmp nhap
        
thongbao2:
        mov ah, 09h
        lea dx, msg2
        int 21h
        
        ;set up
        mov bl, 16
        xor cx, cx
        xor dx, dx
        xor ax, ax
        mov al, so
        
dec2hex:
        cmp al, 0
        je inkq
        div bl
        xchg al, ah
        push ax
        xchg al, ah
        mov ah, 0
        inc cx
        jmp dec2hex
inkq:   
        cmp cx, 0
        je thoat
        pop dx
        cmp dl, 10
        jl  in_1_9
        jnl in_a_f
in_1_9:
        add dl, 30h
        mov ah, 02h
        int 21h
        dec cx
        jmp inkq
in_a_f:
        add dl, 55
        mov ah, 02h
        int 21h
        dec cx
        jmp inkq  
thoat:
        mov ah, 4ch
        int 21h   
main endp
end main