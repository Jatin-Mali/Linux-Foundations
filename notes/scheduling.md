# CPU Scheduling in Linux

*A clear, practical guide on how Linux decides what runs and when.*

## Introduction

A computer can run many programs at the same time, but a CPU can execute only one instruction per core at a time.

CPU scheduling is how Linux determines:

* Which process or thread runs
* How long it runs
* On which CPU core it runs

Every performance issue, lag, freeze, or overload traces back to scheduling choices.

This document explains CPU scheduling from the basics to real Linux behavior, making it beginner-friendly while remaining useful for professionals.

## 1. What Is CPU Scheduling?

CPU scheduling is the kernel’s process of choosing one runnable task from many and giving it to the CPU.

A task in Linux refers to:

* A process, or
* A thread (Linux schedules threads)

### Why Scheduling Is Necessary

At any given time:

* Hundreds or thousands of tasks may exist
* CPUs are limited
* Some tasks are interactive
* Some are background
* Some are critical

Without scheduling:

* One task could use up the CPU
* The system would become unusable

## 2. Key Scheduling Goals

Linux scheduling aims to balance:

* Fairness – no starvation
* Responsiveness – quick reaction to user input
* Throughput – maximum work completed
* Low latency – minimal waiting time
* Scalability – works on 1 core or 128 cores

No single goal is sufficient by itself.

## 3. What Linux Actually Schedules

Important fact:

Linux schedules threads, not processes.

Each thread is viewed as an independent schedulable unit.

This means:

* A multi-threaded program can run on multiple cores
* A single-threaded program cannot

You can observe this using:


top -H
ps -T -p <PID>


## 4. Task States (Essential Concept)

A task can be in one of several states:

| State    | Meaning                       |
| -------- | ----------------------------- |
| Running  | Currently executing on CPU    |
| Runnable | Ready to run, waiting for CPU |
| Sleeping | Waiting for I/O or event      |
| Stopped  | Paused by signal              |
| Zombie   | Finished, not yet cleaned     |

Only runnable tasks are considered for scheduling.

## 5. Preemptive Scheduling

Linux uses preemptive scheduling.

This means:

* A running task can be interrupted
* The CPU can be reassigned to another task
* This occurs automatically via timer interrupts

This prevents long-running tasks from blocking others.

## 6. Time Slice (CPU Time Quantum)

Each runnable task gets a time slice.

* A small unit of CPU time
* When it ends, the scheduler may switch tasks
* The exact duration is dynamic in modern Linux

This creates the illusion of parallel execution.

## 7. The Linux Scheduler (CFS)

Modern Linux uses the Completely Fair Scheduler (CFS).

### Core idea of CFS

Tasks should get CPU time based on their weight.

Linux no longer schedules tasks by fixed time slices. Instead, it keeps track of how much CPU time each task has already received.

### Virtual Runtime (vruntime)

Each task has a value called virtual runtime.

* It increases as the task runs
* The scheduler picks the task with the smallest vruntime
* Tasks that have run less get priority

This aims for fairness.

### Mental Model

Imagine a timeline:

* Each task moves forward as it runs
* The scheduler always chooses the task that has moved the least

## 8. Priority and Nice Values

Linux allows you to adjust task priority using nice values.

Range:

* `-20` → highest priority
* `0` → default
* `+19` → lowest priority

Check priority:


ps -o pid,ni,cmd


Change priority:


nice -n 10 ./program
renice -5 -p <PID>

Important:

* Nice affects weight, not absolute priority
* It influences how quickly vruntime increases

## 9. Real-Time Scheduling

Linux also supports real-time scheduling classes.

### Real-time policies

* SCHED_FIFO
* SCHED_RR

Characteristics:

* Run before normal tasks
* No fairness guarantees
* Can starve the system if misused

Used for:

* Audio processing
* Robotics
* Industrial control

Set policy (example):


sched_setscheduler()


## 10. Multi-Core Scheduling

On multi-core systems:

* Each CPU has its own run queue
* The scheduler balances load across cores
* Tasks can move between CPUs

View CPU affinity:


taskset -p <PID>


Pin a process to a CPU:


taskset -c 0 ./program


## 11. Context Switching

When the scheduler switches tasks:

* CPU registers are saved
* Memory context is preserved
* The new task state is loaded

This is known as a context switch.

Context switches are:

* Necessary
* Expensive if excessive

High context switching often signals:

* Too many threads
* Poor task design

## 12. Scheduling and Performance

Good scheduling behavior:

* Few runnable threads per core
* Short blocking operations
* Clear separation of CPU-bound versus I/O-bound tasks

Bad scheduling behavior:

* Busy waiting
* Over-threading
* Misuse of real-time tasks

## 13. Observing Scheduling in Practice

Useful tools:


top
htop
vmstat
perf


Check load average:

Run -
uptime

Load average does not equal CPU usage. It reflects runnable and waiting tasks.

## 14. Common Misconceptions

* “More threads = faster (False)"
* “Nice sets exact priority (False)"
* “CPU usage equals performance (False)” 
* “Scheduler guarantees execution order (False)”

Scheduling is based on probabilities and adjustments.

## 15. When Scheduling Becomes a Problem

Symptoms:

* High load average
* Low responsiveness
* CPU spikes
* Starvation

Root causes:

* Blocking I/O
* Poor thread design
* Misuse of priority
* Too many runnable tasks

## Summary

* CPU scheduling decides who runs and when
* Linux schedules threads
* CFS aims for fairness using virtual runtime
* Priority influences weight, not control
* Scheduling directly impacts performance and stability
