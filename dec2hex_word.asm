.model small
.stack 100h
.data 
        msg1 db 'hay nhap mot so nguyen duong:$'
        msg2 db 13,10,'gia tri hex la:$'
        so dw 0
        
.code
main proc
        ; khoi tao doan du lieu
        mov ax, @data
        mov ds, ax          
        ;hien thi thong bao nhap
        mov ah, 09h
        lea dx, msg1
        int 21h
        ; nhap
        mov bx, 10
        xor dx, dx
        xor cx, cx
nhap:
        mov ah, 01h
        int 21h
        cmp al, 13
        je hienthitb2
        sub al, 30h
        mov cl, al
        mov ax, so
        mul bx
        add ax, cx
        mov so, ax
        jmp nhap
        
hienthitb2:
        mov ah, 09h
        lea dx, msg2
        int 21h
        ; set up
        xor cx, cx
        xor dx, dx
        mov bx, 16
        mov ax, so
dec2bin:
        cmp ax, 0
        je inkq
        div bx
        push dx
        xor dx, dx
        inc cx
        jmp dec2bin
inkq:   
        cmp cx, 0
        je thoat
        pop dx
        cmp dx, 10
        jl  in_1_9
        jnl in_a_f
in_1_9:
        add dx, 30h
        mov ah, 02h
        int 21h
        dec cx
        jmp inkq
in_a_f:
        add dx, 55
        mov ah, 02h
        int 21h
        dec cx
        jmp inkq 
thoat:
        mov ah, 4ch
        int 21h        
    
main endp
end main