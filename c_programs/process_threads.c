#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <pthread.h>

/* Thread function */
void* say_hello(void* arg) {
    printf("Thread: Hello (PID = %d)\n", getpid());
    return NULL;
}

int main() {

    int pid = fork();

    if (pid == 0) {
        printf("Process: I am the child (PID = %d)\n", getpid());
    } else {
        wait(NULL);
        printf("Process: I am the parent (PID = %d)\n", getpid());
    }

    pthread_t t;
    pthread_create(&t, NULL, say_hello, NULL);
    pthread_join(t, NULL);

    return 0;
}
