.model small
.stack 100h
.data
        mang db 21,11,12
             db 18,19,31
             db 22,44,80
             db 50,8,43
        tb1  db 13,10,'ket qua thap$'
        tb2  db 13,10,'ket qua cao$'
.code
main    proc
        ;khoi tao doan data
        mov ax, @data
        mov ds, ax
        ;gan mang[1][0] vao dl
        lea bx, mang
        mov dl, [bx+3]
        ;khoi tao bo dem
        xor cx, cx
        mov cx, 12
        ;gan gia tri phan tu dau tien mang vao al
tes:
        mov al, [bx]
        ;thuc hien vong lap tim phan tu lon nhat cua mang
        ;so sanh phan tu cua mang voi dl
        cmp dl, al
        jl  update
        inc bx
        loop tes
        jmp check
update:
        mov dl, al
        inc bx
        sub cx, 1
        jmp tes
check:
        cmp dl, 50
        jl  kq1
        jmp kq2
kq1:
        mov ah, 09h
        lea dx, tb1
        int 21h
        jmp thoat
kq2:    
        mov ah, 09h
        lea dx, tb2
        int 21h
        jmp thoat   
        
thoat:
        mov ah, 4ch
        int 21h
        

main    endp
end main