.model small
.stack 100
.data
        msg1 db 'hay nhap mot so hex:$'
        msg2 db 13,10,'gia tri thap phan:$'
        so dw 0
.code
main proc
        mov ax, @data
        mov ds, ax
        ;thong bao nhap
        mov ah, 09h
        lea dx, msg1
        int 21h  
nhap:
        mov ah, 01h
        int 21h
        cmp al, 13
        je thongbao2
        cmp al, '0'
        jl thoat
        cmp al, '9'
        jna input_1_9
        cmp al, 'A'
        jl thoat
        cmp al, 'F'
        jna input_upcase
        cmp al, 'a'
        jl thoat
        cmp al, 'f'
        jna input_lowcase
        
input_1_9:
        sub al, 48
        jmp ascii2num
input_upcase:
        sub al, 55
        jmp ascii2num
input_lowcase:
        sub al, 87
        jmp ascii2num
ascii2num:
        xor cx, cx
        mov cl, al
        mov ax, so
        mov dx, 16
        mul dx
        add ax, cx
        mov so, ax
        jmp nhap
thongbao2:
        mov ah, 09h
        lea dx, msg2
        int 21h
        ;set up
        xor cx, cx
        xor dx, dx
        mov ax, so
        mov bx, 10

hex2dec:
        cmp ax, 0
        je inketqua
        div bx
        push dx
        xor dx, dx
        inc cx
        jmp hex2dec
        
inketqua:
        pop dx
        add dx, 30h
        mov ah, 02h
        int 21h
        loop inketqua
thoat:
        mov ah, 4ch
        int 21h
        
main endp
end main