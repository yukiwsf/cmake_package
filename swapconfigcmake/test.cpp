#include "swap.h"
#include <cstdio>

int main(int argc, char** argv) {
    int a = 1, b = 2;
    printf("before swap, a = %d, b = %d\n", a, b);
    swap(&a, &b);
    printf("after swap, a = %d, b = %d\n", a, b);
    return 0;
}