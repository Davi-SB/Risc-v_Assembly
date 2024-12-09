LOOP:
and x5, x5, x0 # x5 --> registrador acumulador (registrador = 0)

# Primeiro digito
    lb x6, 1025(x0)  # le do teclado
    addi x6, x6, -48 # sutrai 48 (ASCII to int)
    
    or x5, x5, x6   # adiciona o primeiro digito binario (x6) em x5
    slli x5, x5, 1  # Desloca x5 para a esquerda por 1 bit

# Segundo digito
    lb x6, 1025(x0)  # le do teclado
    addi x6, x6, -48 # sutrai 48 (ASCII to int)
    
    or x5, x5, x6   # adiciona o segundo digito binario (x6) em x5
    slli x5, x5, 1  # Desloca x5 para a esquerda por 1 bit

# Terceiro digito
    lb x6, 1025(x0)  # le do teclado
    addi x6, x6, -48 # sutrai 48 (ASCII to int)
    
    or x5, x5, x6   # adiciona o terceiro digito binario (x6) em x5
    slli x5, x5, 1  # Desloca x5 para a esquerda por 1 bit

# Quarto digito
    lb x6, 1025(x0)  # le do teclado
    addi x6, x6, -48 # sutrai 48 (ASCII to int)
    
    or x5, x5, x6   # adiciona o quarto digito binario (x6) em x5
# O registrador x5 agora contem o valor decimal correspondente aos 4 digitos binarios

# 16

beq x5, x0, ZERO

addi x5, x5, -1
beq x5, x0, UM

addi x5, x5, -1
beq x5, x0, DOIS

addi x5, x5, -1
beq x5, x0, TRES

addi x5, x5, -1
beq x5, x0, QUATRO

addi x5, x5, -1
beq x5, x0, CINCO

addi x5, x5, -1
beq x5, x0, SEIS

addi x5, x5, -1
beq x5, x0, SETE

addi x5, x5, -1
beq x5, x0, OITO

addi x5, x5, -1
beq x5, x0, NOVE

addi x5, x5, -6
beq x5, x0, CLEAR

jal x1, EOF

ZERO:
    lw x18, HIGH_0_1 # x18 = HIGH_0_1
    addi x6, x0, 1   # x6 = 1 == HIGH_e
    
    sw x18, 1027(x0) # endereco de digitalWrite (pinos 8 - 13, a,b,c,f,g)
    sw x6 , 1029(x0) # endereco de digitalWrite (pino 2, e)
    jal x1, final    # goto final;
UM:
    lw x19, HIGH_1
    
    sw x19, 1027(x0) # endereco de digitalWrite (pinos 8 - 13)
    sw x0 , 1029(x0) # endereco de digitalWrite (pino 2, e), x0 == LOW_e
    jal x1, final    # goto final;
DOIS:
    lw x18, HIGH_2_1 # x18 = HIGH_2_1
    addi x6, x0, 1   # x6 = 1 == HIGH_e
    
    sw x18, 1027(x0) # endereco de digitalWrite (pinos 8 - 13, a,b,c,f,g)
    sw x6 , 1029(x0) # endereco de digitalWrite (pino 2, e)
    jal x1, final    # goto final;
TRES:
    lw x19, HIGH_3
    
    sw x19, 1027(x0) # endereco de digitalWrite (pinos 8 - 13)
    sw x0 , 1029(x0) # endereco de digitalWrite (pino 2, e), x0 == LOW_e
    jal x1, final    # goto final;
QUATRO:
    lw x19, HIGH_4
    
    sw x19, 1027(x0) # endereco de digitalWrite (pinos 8 - 13)
    sw x0 , 1029(x0) # endereco de digitalWrite (pino 2, e), x0 == LOW_e
    jal x1, final    # goto final;
CINCO:
    lw x19, HIGH_5
    
    sw x19, 1027(x0) # endereco de digitalWrite (pinos 8 - 13)
    sw x0 , 1029(x0) # endereco de digitalWrite (pino 2, e), x0 == LOW_e
    jal x1, final    # goto final;
SEIS:
    lw x18, HIGH_6_1 # x18 = HIGH_6_1
    addi x6, x0, 1   # x6 = 1 == HIGH_e
    
    sw x18, 1027(x0) # endereco de digitalWrite (pinos 8 - 13, a,b,c,f,g)
    sw x6 , 1029(x0) # endereco de digitalWrite (pino 2, e)
    jal x1, final    # goto final;
SETE:
    lw x19, HIGH_7
    
    sw x19, 1027(x0) # endereco de digitalWrite (pinos 8 - 13)
    sw x0 , 1029(x0) # endereco de digitalWrite (pino 2, e), x0 == LOW_e
    jal x1, final    # goto final;
OITO:
    lw x18, HIGH_8_1 # x18 = HIGH_8_1
    addi x6, x0, 1   # x6 = 1 == HIGH_e
    
    sw x18, 1027(x0) # endereco de digitalWrite (pinos 8 - 13, a,b,c,f,g)
    sw x6 , 1029(x0) # endereco de digitalWrite (pino 2, e)
    jal x1, final    # goto final;
NOVE:
    lw x19, HIGH_9
    
    sw x19, 1027(x0) # endereco de digitalWrite (pinos 8 - 13)
    sw x0 , 1029(x0) # endereco de digitalWrite (pino 2, e), x0 == LOW_e
    jal x1, final    # goto final;
CLEAR:
    sw x0, 1027(x0) # endereco de digitalWrite (pinos 8 - 13)
    jal x1, final    # goto final;
final:
    jal x1, LOOP
EOF:
    halt

# 0, 2, 6 e 8 usam o pino especial
HIGH_0_1 : .word 0b011111 # +1
HIGH_1   : .word 0b000110
HIGH_2_1 : .word 0b101011 # +1
HIGH_3   : .word 0b101111
HIGH_4   : .word 0b110110
HIGH_5   : .word 0b111101
HIGH_6_1 : .word 0b111101 # +1
HIGH_7   : .word 0b000111
HIGH_8_1 : .word 0b111111 # +1
HIGH_9   : .word 0b111111

# ex de caso teste: 0001
# ex de caso teste (todas as possibilidades concatenadas): 00000001001000110100010101100111100010011111
