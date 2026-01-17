# Processes and Threads in Linux

*A practical, beginner-friendly, industry-standard guide*

## Introduction

Linux runs programs using processes and threads. These are the basic units of execution in the operating system.

Every application, server, browser, or command you run relies on this model. Understanding processes and threads is important for:

* System programming
* Performance tuning
* Debugging
* Writing reliable concurrent software

This document explains what they are, how Linux implements them, and how you can use them, with actual commands and system calls.

## 1. What Is a Process?

A process is a running instance of a program.

When you execute a program:

./a.out


Linux creates a process that includes:

* Program code
* Memory (stack, heap, globals)
* File descriptors
* Process ID (PID)
* Execution state

Each process is isolated from others.

### Key Properties of a Process

* Has its own memory space
* Has at least one thread
* Identified by a PID
* Managed by the kernel scheduler

### Viewing Processes (Shell)


bash
ps
ps aux
top
htop


To find a specific process:


ps -p <PID>


### Creating a Process (C)

Linux uses the fork and exec model.


pid_t pid = fork();


* `fork()` duplicates the current process
* Both the parent and child run simultaneously

To run a new program:


execlp("ls", "ls", NULL);

### Process Lifecycle (Simplified)

1. Created (fork)
2. Ready
3. Running
4. Waiting (I/O, sleep)
5. Terminated (exit)

The parent waits using:


wait(NULL);


## 2. What Is a Thread?

A thread is a lightweight execution unit inside a process.

A process can have:

* One thread (single-threaded)
* Many threads (multi-threaded)

Threads share the same memory.

### What Threads Share

* Heap
* Global variables
* Code
* Open files

### What Threads Do NOT Share

* Stack (each thread has its own)
* Thread ID (TID)
* CPU registers

### Why Threads Exist

Threads allow:

* Parallel execution
* Better CPU use
* Responsive programs
* Less overhead than processes

Creating threads is much faster than creating processes.

## 3. Process vs Thread (Core Difference)

| Aspect        | Process    | Thread                   |
| ------------- | ---------- | ------------------------ |
| Memory        | Separate   | Shared                   |
| Creation cost | High       | Low                      |
| Communication | IPC needed | Direct (shared memory)   |
| Isolation     | Strong     | Weak                     |
| Crash impact  | Isolated   | Can crash entire process |

## 4. Linux Implementation Reality

In Linux:

 Threads are implemented as processes that share resources.

The kernel uses:


clone()


Both processes and threads are scheduled in the same way.

You can see threads using:


ps -T -p <PID>


or


top -H


## 5. Creating Threads in C (POSIX Threads)

Linux uses pthreads (POSIX standard).

### Basic Thread Example


#include <stdio.h>
#include <pthread.h>

void* worker(void* arg) {
    printf("Hello from thread\n");
    return NULL;
}

int main() {
    pthread_t thread;

    pthread_create(&thread, NULL, worker, NULL);
    pthread_join(thread, NULL);

    return 0;
}

### Compile


gcc thread.c -o thread -pthread


### Important Thread Functions

* `pthread_create()` – create thread
* `pthread_join()` – wait for thread
* `pthread_exit()` – exit thread
* `pthread_mutex_lock()` – lock shared data
* `pthread_mutex_unlock()` – unlock shared data

## 6. Thread Safety and Synchronization

Because threads share memory, data races can happen.

Example problem:

* Two threads modify the same variable
* Result becomes unpredictable

Solution: Mutex


pthread_mutex_t lock;

pthread_mutex_lock(&lock);
// critical section
pthread_mutex_unlock(&lock);

Other synchronization tools include:

* Mutex
* Condition variables
* Semaphores
* Read-write locks

## 7. Communication Models

### Process Communication (IPC)

Processes need kernel mechanisms:

* Pipes
* Shared memory
* Message queues
* Sockets

Examples:


pipe()
shmget()
mmap()

### Thread Communication

Threads communicate directly through:

* Shared variables
* Protected by locks

No kernel IPC is needed.

## 8. Scheduling and CPU Usage

The Linux scheduler:

* Schedules threads, not processes
* Each thread competes for CPU time

Check CPU usage with:


top
htop

Pin a process or thread:


taskset -p <PID>


## 9. When to Use Processes

Use processes when:

* Strong isolation is necessary
* Fault tolerance matters
* Security boundaries are needed
* Different programs must run independently

Examples:

* Web server workers
* Shell commands
* Daemons

## 10. When to Use Threads

Use threads when:

* Tasks share data heavily
* Performance is important
* Low latency is required
* Parallel computation is needed

Examples:

* Databases
* Web servers
* Game engines

## 11. Common Mistakes

* Forgetting wait() leads to zombie processes.
* Forgetting pthread_join() causes resource leaks.
* Sharing data without locks leads to race conditions.
* Assuming execution order leads to undefined behavior.

## 12. Mental Model

* Process = container
* Thread = worker inside container
* Process isolation = safety
* Thread sharing = speed

Both are tools. Choosing the right one is more important than using either.

## Summary

* A process is a running program with its own memory.
* A thread is an execution unit inside a process.
* Linux schedules threads.
* Processes isolate, threads share.
* Correct usage improves performance and stability.
