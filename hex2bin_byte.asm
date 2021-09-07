.model small
.stack 100
.data
        msg1 db 'hay nhap so hex:$'
        msg2 db 13,10,'gia tri he thap phan la:$'
        so db 0
.code
main proc
        ;khoi tao doan du lieu
        mov ax, @data
        mov ds, ax
        ;hien thi thong bao nhap
        mov ah, 09h
        lea dx, msg1
        int 21h
        ;nhap vao cho so hex
        
nhap:
        mov ah, 01h
        int 21h
        cmp al, 13
        je hienthitb2
        cmp al, '0'
        jl thoat
        cmp al, '9'
        jna input_1_9
        cmp al, 'A'
        jl thoat
        cmp al, 'F'
        jna input_a_upcase  
        cmp al, 'a'
        jl thoat
        cmp al, 'f'
        jna input_a_lowcase
input_1_9:
        sub al, 48
        jmp ascii2num
input_a_upcase:
        sub al, 55
        jmp ascii2num
input_a_lowcase:
        sub al, 87
        jmp ascii2num     
ascii2num:
        mov dl, al
        mov al, so
        mov bl, 16
        mul bl
        add al, dl
        mov so, al
        jmp nhap
hienthitb2:
        mov ah, 09h
        lea dx, msg2
        int 21h  
        ;set up
        mov al, so
        mov ah, 0
        mov bl, 2
        xor cx, cx
convert:
        cmp al, 0
        je in_kq
        div bl
        xchg ah, al
        push ax
        inc cx
        xchg ah, al
        mov ah, 0
        jmp convert
in_kq:   
        pop dx
        add dl, 30h
        mov ah, 02h
        int 21h
        loop in_kq      
thoat:
        mov ah, 4ch
        int 21h

main endp
end main
         
                