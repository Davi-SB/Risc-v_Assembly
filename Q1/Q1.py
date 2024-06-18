# ex caso teste: ADB FKJQ
# Em caso de empate --> output 0

#load registrador
lw x18, player1
lw x19, player2
lw x20, empate
lw x21, um
lw x22, dois
lw x23, compararEspaco

#loop do player 1
loopP1:
    lb x25, 1025(x0) #letra
    beq x25, x23, loopP2 #espaco->P2
    beq x0, x0, opsP1

loopP2:
    lb x25, 1025(x0) #letra
    beq x25, x0, acaba #acabou->resultado
    beq x0, x0, opsP2

opsP1:
    addi x26, x0, 68
    beq x25, x26, update1P1
    addi x26, x0, 71
    beq x25, x26, update1P1
    addi x26, x0, 84
    beq x25, x26, update1P1
    addi x26, x0, 70
    beq x25, x26, update2P1
    addi x26, x0, 72
    beq x25, x26, update2P1
    addi x26, x0, 86
    beq x25, x26, update2P1
    addi x26, x0, 87
    beq x25, x26, update2P1
    addi x26, x0, 89
    beq x25, x26, update2P1
    addi x26, x0, 65 
    beq x25, x26, update3P1
    addi x26, x0, 69
    beq x25, x26, update3P1
    addi x26, x0, 73
    beq x25, x26, update3P1
    addi x26, x0, 79
    beq x25, x26, update3P1
    addi x26, x0, 85
    beq x25, x26, update3P1
    addi x26, x0, 66
    beq x25, x26, update4P1
    addi x26, x0, 67
    beq x25, x26, update4P1
    addi x26, x0, 77
    beq x25, x26, update4P1
    addi x26, x0, 78
    beq x25, x26, update4P1
    addi x26, x0, 80
    beq x25, x26, update4P1
    addi x26, x0, 75
    beq x25, x26, update5P1
    addi x26, x0, 82
    beq x25, x26, update5P1
    addi x26, x0, 83
    beq x25, x26, update5P1
    addi x26, x0, 81
    beq x25, x26, update6P1
    addi x26, x0, 90
    beq x25, x26, update6P1
    addi x26, x0, 74
    beq x25, x26, update8P1
    addi x26, x0, 76
    beq x25, x26, update8P1
    addi x26, x0, 88
    beq x25, x26, update8P1

update3P1:
    addi x18, x18, 3
    beq x0, x0, loopP1

update1P1:
    addi x18, x18, 1
    beq x0, x0, loopP1

update2P1:
    addi x18, x18, 2
    beq x0, x0, loopP1

update4P1:
    addi x18, x18, 4
    beq x0, x0, loopP1

update5P1:
    addi x18, x18, 5
    beq x0, x0, loopP1

update6P1:
    addi x18, x18, 6
    beq x0, x0, loopP1

update8P1:
    addi x18, x18, 8
    beq x0, x0, loopP1

opsP2:
    addi x26, x0, 68
    beq x25, x26, update1P2
    addi x26, x0, 71
    beq x25, x26, update1P2
    addi x26, x0, 84
    beq x25, x26, update1P2
    addi x26, x0, 70
    beq x25, x26, update2P2
    addi x26, x0, 72
    beq x25, x26, update2P2
    addi x26, x0, 86
    beq x25, x26, update2P2
    addi x26, x0, 87
    beq x25, x26, update2P2
    addi x26, x0, 65
    beq x25, x26, update3P2
    addi x26, x0, 69
    beq x25, x26, update3P2
    addi x26, x0, 73
    beq x25, x26, update3P2
    addi x26, x0, 79
    beq x25, x26, update3P2
    addi x26, x0, 85
    beq x25, x26, update3P2
    addi x26, x0, 66
    beq x25, x26, update4P2
    addi x26, x0, 67
    beq x25, x26, update4P2
    addi x26, x0, 77
    beq x25, x26, update4P2
    addi x26, x0, 78
    beq x25, x26, update4P2
    addi x26, x0, 80
    beq x25, x26, update4P2
    addi x26, x0, 89
    beq x25, x26, update2P2
    addi x26, x0, 75
    beq x25, x26, update5P2
    addi x26, x0, 82
    beq x25, x26, update5P2
    addi x26, x0, 83
    beq x25, x26, update5P2
    addi x26, x0, 74
    beq x25, x26, update8P2
    addi x26, x0, 76
    beq x25, x26, update8P2
    addi x26, x0, 88
    beq x25, x26, update8P2
    addi x26, x0, 81
    beq x25, x26, update6P2
    addi x26, x0, 90
    beq x25, x26, update6P2

update3P2:
    addi x19, x19, 3
    beq x0, x0, loopP2

update1P2:
    addi x19, x19, 1
    beq x0, x0, loopP2

update4P2:
    addi x19, x19, 4
    beq x0, x0, loopP2

update2P2:
    addi x19, x19, 2
    beq x0, x0, loopP2

update5P2:
    addi x19, x19, 5
    beq x0, x0, loopP2

update8P2:
    addi x19, x19, 8
    beq x0, x0, loopP2

update6P2:
    addi x19, x19, 6
    beq x0, x0, loopP2

acaba:
    beq x18, x19, empatou
    blt x18, x19, P2G
    sw x21, 1024(x0)
    halt

empatou:
    sw x20, 1024(x0)
    halt

P2G:
    sw x22, 1024(x0)
    halt
 
player1:    .word 48
player2:    .word 48
empate:    .word 48
um:      .word 49
dois:    .word 50
compararEspaco: .word 32