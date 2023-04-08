#include <stdio.h>
static inline int rightshift(int number, int shift)
{
    return (number>>shift);
}
void main()
{
    int x=32;
    int shift=1;
    int shifted=rightshift(x,shift);
    printf("The value of %d after being shift by %d bit is %d\n",x,shift,shifted);
}
