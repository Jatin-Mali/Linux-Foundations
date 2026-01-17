#include <stdio.h>
#include <stdlib.h>

int main() {

    /* -------- STACK MEMORY -------- */
    int stack_number = 10;   // allocated on stack
    printf("Stack value: %d\n", stack_number);

    /* -------- HEAP MEMORY -------- */
    int *heap_number = malloc(sizeof(int));  // allocated on heap

    if (heap_number == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    *heap_number = 20;
    printf("Heap value: %d\n", *heap_number);

    /* -------- FREE HEAP MEMORY -------- */
    free(heap_number);

    return 0;
}
