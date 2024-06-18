#include <stdio.h>

int main(void)
{
    int a = 20;
    int b = 30;
    int c = 40;
    int x = 0;

    int five = 5;
    int sfive = 65;
    int ffive = 15;

    if(a < five)
    {
        goto dRuim;
    }
    if(c == ffive)
    {
        goto dRuim;
    }
    if(c < ffive)
    {
        goto dRuim;
    }
    if(b == sfive)
    {
        goto dBom;
    }
    if(b > sfive)
    {
        goto dRuim;
    }

    dBom:
        x++;
    dRuim:
        printf("x = %d\n",x);


    return 0;
}