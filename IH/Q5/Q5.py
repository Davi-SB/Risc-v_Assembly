# carrega os valores das variaveis para os devidos registradores
lw x18, v736
lw x19, v634
lw x20, v531
lw x21, v429
lw x22, v327

# define que o pino A0 (valor 0) para leitura analogica (1030(x0))
sb x0, 1030(x0) # atribui o valor zero ao endereco 1030(x0) (essa eh a porta de escrita do numero do pino analogico)

# carrega o valor medido pelo sensor de temperatura para o registrador x23
lh x23, 1031(x0)

# -------------------------------------------------------------------------------------

# se >= 36 (736)
bge x23, x18, Vermelho_Esquerda # if(x >= 736) goto Vermelho_Esquerda;

# se >= 31 (634)
bge x23, x19, Vermelho_Direita # if(x >= 634) goto Vermelho_Direita;

# se >= 26 (531)
bge x23, x20, Amarelo_Direita # if(x >= 531) goto Amarelo_Direita;

# se >= 21 (429)
bge x23, x21, Verde_Direita # if(x >= 429) goto Verde_Direita;

# se >= 16 (327)
bge x23, x22, Verde_Esquerda # if(x >= 327) goto Verde_Esquerda;

# se >= 0 (0)
bge x23, x0,  Amarelo_Esquerda # if(x >= 000) goto Amarelo_Esquerda;

# -------------------------------------------------------------------------------------

# ligar led Amarelo_Esquerda (0 - 15)
Amarelo_Esquerda:
	lw x28, HIGH8    # atribui o valor que ativa o pino 8
	sw x28, 1027(x0) # escreve esse valor no endereco de escrita do digitalWrite
	jal x1, final    # goto final;

# ligar led Verde_Esquerda (16 - 20)
Verde_Esquerda:
	lw x28, HIGH9    # atribui o valor que ativa o pino 9
	sw x28, 1027(x0) # escreve esse valor no endereco de escrita do digitalWrite
	jal x1, final    # goto final;

# ligar led Verde_Direita (21 - 25)
Verde_Direita:
	lw x28, HIGH10   # atribui o valor que ativa o pino 10
	sw x28, 1027(x0) # escreve esse valor no endereco de escrita do digitalWrite
	jal x1, final    # goto final;

# ligar led Amarelo_Direita (26 - 30)
Amarelo_Direita:
	lw x28, HIGH11   # atribui o valor que ativa o pino 11
	sw x28, 1027(x0) # escreve esse valor no endereco de escrita do digitalWrite
	jal x1, final    # goto final;

# ligar led Vermelho_Direita (31 - 35)
Vermelho_Direita:
	lw x28, HIGH12   # atribui o valor que ativa o pino 12
	sw x28, 1027(x0) # escreve esse valor no endereco de escrita do digitalWrite
	jal x1, final    # goto final;

# ligar led Vermelho_Esquerda (36 - )
Vermelho_Esquerda:
	lw x28, HIGH13   # atribui o valor que ativa o pino 13
	sw x28, 1027(x0) # escreve esse valor no endereco de escrita do digitalWrite
	# jal x1, final    # goto final; # nao necessario

final:
	halt

# -------------------------------------------------------------------------------------

v736:   .word 736
v634:   .word 634
v531:   .word 531
v429:   .word 429
v327:   .word 327

HIGH8:  .word 1  # 000001
HIGH9:  .word 2  # 000010
HIGH10: .word 4  # 000100
HIGH11: .word 8  # 001000
HIGH12: .word 16 # 010000
HIGH13: .word 32 # 100000