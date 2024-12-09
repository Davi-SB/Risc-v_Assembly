#include <stdio.h>

int main() {
    int x; scanf("%d", &x);

    // se >= 36
    if(x >= 36)
    goto Vermelho_Esquerda;

    // se >= 31
    if(x >= 31)
    goto Vermelho_Direita;

    // se >= 26
    if(x >= 26)
    goto Amarelo_Direita;

    // se >= 21
    if(x >= 21)
    goto Verde_Direita;
    
    // se >= 16
    if(x >= 16)
    goto Verde_Esquerda;

    // se >= 0
    if(x >= 0)
    goto Amarelo_Esquerda;

    goto Temp_Invalida;

    // ----------------------------------

    Amarelo_Esquerda: // 0 - 15
    // ligar led Amarelo_Esquerda
    // printf("%d --> Amarelo_Esquerda\n", x);
    goto final;

    Verde_Esquerda: // 16 - 20
    // ligar led Verde_Esquerda
    // printf("%d --> Verde_Esquerda\n", x);
    goto final;

    Verde_Direita: // 21 - 25
    // ligar led Verde_Direita
    // printf("%d --> Verde_Direita\n", x);
    goto final;

    Amarelo_Direita: // 26 - 30
    // ligar led Amarelo_Direita
    // printf("%d --> Amarelo_Direita\n", x);
    goto final;

    Vermelho_Direita: // 31 - 35
    // ligar led Vermelho_Direita
    // printf("%d --> Vermelho_Direita\n", x);
    goto final;

    Vermelho_Esquerda: // 36 - 
    // ligar led Vermelho_Esquerda
    // printf("%d --> Vermelho_Esquerda\n", x);
    goto final;

    Temp_Invalida:
    // printf("temp invalida\n");
    goto final;

    final:
    return 0; // halt
}

/*
x0: the constant value 0
• x1: return address
• x2: stack pointer
• x3: global pointer
• x4: thread pointer
• x5 – x7, x28 – x31: temporaries
• x8: frame pointer
• x9, x18 – x27: saved registers
• x10 – x11: function arguments/results
• x12 – x17: function arguments
*/