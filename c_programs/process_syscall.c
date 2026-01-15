// process_syscalls.c

#include <stdio.h>
#include <unistd.h>     // fork(), exec()
#include <sys/wait.h>   // wait()

int main() {
    int pid;

    pid = fork();   // create a new process

    if (pid == 0) {
        // Child process
        printf("Child: Hello from child process\n");

        // Run another program
        execlp("echo", "echo", "Child is now running a new program", NULL);
    } 
    else {
        // Parent process
        printf("Parent: Waiting for child to finish\n");

        wait(NULL);  // wait for child to complete

        printf("Parent: Child finished\n");
    }

    return 0;
}
