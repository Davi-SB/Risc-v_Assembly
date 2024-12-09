ORG 0x7C00 ; endereço de memória do bootloader
BITS 16 ; modo real 16 bits
    jmp start

; output esperado: 10
msg: db "ABCDEFGHIJKLMNOPKRSTUVWXYZ abcdefghijqlmnopqrstuvwxyz", 0x0D, 0x0A, 0 ; string, quebra de linha e terminador de string

start:
    xor ax, ax ; zera ax
    mov ds, ax ; ds = 0
    mov es, ax ; es = 0
    mov ss, ax ; ss = 0

    mov si, msg ; si = &msg
    call print_string ; printa msg

    mov si, msg
    xor cx, cx ; cx = 0, armazena o número de vogais
    call count_vowels

    mov ax, cx ; print_number vai printar ax
    call print_number
end:
    jmp $ ; halt

count_vowels:
    .loop:
        lodsb ; carrega o próximo byte da string apontada por SI em AL e incrementa SI.
        or al, al ; se (al or al) == false, al = 0, zera a flag zero, final da string
        jz .done ; jz = jump if zero, se al = 0, pula para .done
        call is_vowel ; se al != 0, chama is_vowel
        cmp al, 1 ; is_vowel define al para 1 se for vogal. cmp registra o resultado em FLAGS
        jne .loop ; jump if not equal, verifica FLAGS, jump ocorre se al != 1
        inc cx ; incrementa cx, contador de vogais
        jmp .loop ; pula para .loop
    .done:
        ret

is_vowel:
    mov ah, al
    and al, 0xDF ; converte para maiúscula
    cmp al, 'A'
    je .vowel ; jump if equal
    cmp al, 'E'
    je .vowel
    cmp al, 'I'
    je .vowel
    cmp al, 'O'
    je .vowel
    cmp al, 'U'
    je .vowel
    xor al, al ; zera al em caso de não ser vogal
    ret
    .vowel:
        mov al, 1
        ret

print_string:
    .loop:
        lodsb
        or al, al
        jz .done
        mov ah, 0x0E
        int 0x10
        jmp .loop
    .done:
        ret

print_number:
    mov bx, 10
    xor cx, cx
    .loop1:
        xor dx, dx
        div bx
        add dx, '0'
        push dx
        inc cx
        cmp ax, 0
        jne .loop1
    .loop2:
        pop ax
        mov ah, 0x0E
        int 0x10
        loop .loop2
    .done:
        ret

; Boot sector signature
    times 510-($-$$) db 0
    dw 0xAA55