; Diretivas para o assembler
org 0x7C00
bits 16

jmp start

; Dados
hello db "hello world", 0x0D, 0x0A, 0
msg   db "escreva algo: ", 0x0D, 0x0A, 0
fim   db 0x0D, 0x0A, "fim do programa", 0x0D, 0x0A, 0
newline db 0x0D, 0x0A, 0
input_buffer db 0 ; String inicialmente vazia (terminador nulo)

;input_buffer db 256 dup(0) ; Buffer para entrada do teclado

; Início do programa
start:

configurando_ivt:
    push ds
    xor ax, ax
    mov ds, ax       ; Garantir que DS = 0 (IVT começa no segmento 0)
    mov di, 0x100    ; Offset do vetor para a interrupção 40h
    mov word [di], isr_print_string ; Offset da ISR
    mov word [di+2], 0              ; Segmento da ISR
    pop ds           ; Restaurar DS

    ; Mensagem inicial
    mov ax, hello
    push ax
    int 0x40         ; Chamar a interrupção 40h
    add sp, 2

    ; Solicitar entrada do usuário
    mov ax, msg
    push ax
    int 0x40
    add sp, 2

    ; Ler entrada do teclado
    call get_keyboard_input

    ; Imprimir uma quebra de linha antes da string recebida
    mov ax, newline
    push ax
    int 0x40
    add sp, 2

    ; Passar a string lida para a interrupção 40h
    lea ax, input_buffer
    push ax
    int 0x40
    add sp, 2

end:
    ; Adicionar uma quebra de linha após "fim do programa"
    mov ax, fim
    push ax
    int 0x40
    add sp, 2
    jmp $ ; Halt

; Função para ler entrada do teclado
get_keyboard_input:
    pusha
    mov di, input_buffer  ; Ponteiro para onde armazenar a string
.loop_input:
    mov ah, 0x00
    int 0x16              ; Ler um caractere do teclado
    cmp al, 0x0D          ; Verificar se é Enter
    je .done_input        ; Se Enter, sair do loop
    stosb                 ; Armazenar o caractere em DI
    mov ah, 0x0E
    int 0x10              ; Ecoar o caractere na tela
    jmp .loop_input
.done_input:
    mov byte [di], 0      ; Adicionar o terminador nulo
    popa
    ret

; Função para imprimir string (implementada como interrupção 40h)
isr_print_string:
    push bp         ; Salvar BP
    mov bp, sp      ; Configurar BP para acessar os parâmetros
    pusha           ; Salvar todos os registradores

    mov ax, [bp+8]  ; Carregar o offset da string (primeiro parâmetro)
    mov si, ax      ; SI aponta para a string

.loop_print:
    lodsb           ; Carregar um byte da string em AL
    or al, al       ; Verificar se é o final da string (byte nulo)
    jz .done_print  ; Se for 0, fim da string
    mov ah, 0x0E    ; Configurar para imprimir o caractere em AL
    int 0x10        ; Chamar a interrupção de vídeo
    jmp .loop_print ; Continuar o loop

.done_print:
    popa            ; Restaurar os registradores
    pop bp          ; Restaurar BP
    iret            ; Retornar da interrupção

; Assinatura do boot sector
times 510-($-$$) db 0
dw 0xAA55
