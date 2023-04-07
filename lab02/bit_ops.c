#include <stdio.h>
#include "bit_ops.h"

/* Returns the Nth bit of X. Assumes 0 <= N <= 31. */
unsigned get_bit(unsigned x, unsigned n) {
    /* YOUR CODE HERE */
    int bit;
    bit = x>>n;
    int bit_masked=bit&1;
    return bit_masked; /* UPDATE WITH THE CORRECT RETURN VALUE*/
}

/* Set the nth bit of the value of x to v. Assumes 0 <= N <= 31, and V is 0 or 1 */
void set_bit(unsigned *x, unsigned n, unsigned v) {
    int remove=~(1<<n);
    
    *x=*x & remove;
    
    int mask=v<<n;

    *x=*x | mask;


}
/* Flips the Nth bit in X. Assumes 0 <= N <= 31.*/
void flip_bit(unsigned *x, unsigned n) {
    /* YOUR CODE HERE */
    int flip_bit = get_bit(*x,n);
    set_bit(x,n,!flip_bit);
}

