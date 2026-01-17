# Stack vs Heap Memory

A clear, practical guide for Linux fundamentals


# Introduction

Every running program needs memory. How that memory is organized, used, and released affects performance, stability, and correctness.

In Linux and all similar systems, program memory is mainly managed using two regions:

Stack
Heap

These two areas serve different purposes and follow different rules. Understanding their distinctions is crucial for systems programming, debugging, and improving performance.

This document explains stack and heap memory from the basics, making it accessible for beginners while still being precise enough for advanced readers.



# Process Memory Layout (High-Level View)

When a program starts, the operating system gives it a private virtual memory space. This space is logically divided into regions:

```
+------------------+  High addresses
| Stack            |  (grows downward)
+------------------+
|      Gap         |
+------------------+
| Heap             |  (grows upward)
+------------------+
| Global / Static  |
+------------------+
| Program Code     |
+------------------+  Low addresses
```

This layout isn't random. Each region has a specific role.

This document focuses on the *Stack* and *Heap*.


# The Stack, What the Stack Is

The **stack** is a memory area used to manage function execution.

It stores:

- Local variables
- Function parameters
- Return addresses
- Saved CPU registers

The stack follows a strict rule:

Last In, First Out (LIFO)

This rule helps the system enter and exit functions quickly and safely.


### How the Stack Works

Each function call creates a **stack frame**.

A stack frame contains everything needed for the function to run.

Example:

c
void example(int a) {
    int x = 10;
}


When example() is called:

* Space is allocated for a
* Space is allocated for x
* The return address is stored

When the function returns:

* The entire stack frame is removed instantly

No manual cleanup is needed.



# Stack Characteristics

* **Automatic management** (handled by the compiler and CPU)
* **Very fast** allocation and deallocation
* **Fixed size limit**
* **Short-lived memory**
* **Thread-local** (each thread has its own stack)


# Stack Limitations

The stack's limited size can make certain patterns risky:

* Deep or infinite recursion
* Large local arrays

Exceeding stack limits causes a **stack overflow**, which usually terminates the program immediately.


### Stack Lifetime Rule

Stack memory exists **only while the function is running**.

Returning references or pointers to stack variables is invalid and leads to undefined behavior.

Example (incorrect):

c
int* bad() {
    int x = 10;
    return &x;   // invalid: x no longer exists
}



# The Heap What the Heap Is

The **heap** is a memory area used for dynamic and long-lived data.

It is used when:

* Size isn't known at compile time
* Data must last longer than the current function
* Memory must be shared across components

Programmers manage heap memory manually.


# How the Heap Works

Memory is requested explicitly:


int *p = malloc(sizeof(int));

Memory is released explicitly:

free(p);

The operating system does not automatically reclaim heap memory when a function returns.



# Heap Characteristics

* **Manual management**
* **Flexible size**
* **Slower than stack**
* **Long-lived memory**
* **Shared across threads**

Heap allocation involves bookkeeping, which makes it more expensive than stack allocation.


# Common Heap Errors

Poor heap management can cause serious issues:

* **Memory leaks** – allocated memory never freed
* **Use-after-free** – accessing memory after freeing it
* **Double free** – freeing the same memory twice
* **Heap fragmentation** – inefficient memory use over time

These problems often lead to silent corruption rather than immediate crashes.



# Stack vs Heap (Comparison)

| Aspect      | Stack              | Heap                  |
| ----------- | ------------------ | --------------------- |
| Allocation  | Automatic          | Manual                |
| Speed       | Very fast          | Slower                |
| Size        | Limited            | Large                 |
| Lifetime    | Short              | Long                  |
| Structure   | Strict (LIFO)      | Flexible              |
| Safety      | High by design     | Depends on discipline |
| Typical Use | Function execution | Dynamic data          |



# Stack and Heap Together

A common and important pattern:


int* create() {
    int *p = malloc(sizeof(int));
    *p = 42;
    return p;
}


* `p` (the pointer) is on the **stack**
* `*p` (the data) is on the **heap**

When the function returns:

* The pointer variable disappears
* The heap memory remains valid

This separation is powerful but risky if not managed properly.



# Virtual Memory Context

Both stack and heap exist in **virtual memory**.

This means:

* Each process has its own memory
* Addresses are mapped by the OS
* Protection is enforced by hardware

Stack and heap are logical regions, not physical RAM sections.



# Garbage-Collected Languages

Languages like Python, Java, and Go still use both stack and heap.

The difference:

* Heap memory is automatically reclaimed by a garbage collector

The basic memory model remains unchanged; only the management responsibility shifts.



# When to Use What

**Use the stack when:**

* Data is small
* Lifetime is short
* Scope is local

**Use the heap when:**

* Size is dynamic
* Lifetime crosses function boundaries
* Data needs to be shared or persistent

Ignoring these guidelines can lead to stability issues and bugs.



# Key Takeaways

* Stack memory is automatic, fast, and temporary
* Heap memory is manual, flexible, and long-lived
* Stack is for running code
* Heap is for storing data
* Proper memory management is essential in systems programming



# One-Line Summary

**The stack handles execution; the heap handles storage.**

Understanding this difference is key to writing correct, efficient, and maintainable Linux programs.
