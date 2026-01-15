# Operating System Overview

We will learn about Kernel space and user space in operating system, and system calls (syscalls).

Before diving into spaces lets understand what is kernel

Kernel is a heart of the OS, A kernel is the core, central program of an operating system (OS) that acts as a bridge between software applications and hardware, managing critical system resources like CPU, memory, and I/O, and translating user requests into machine instructions to keep the system running efficiently and securely.

 
User mode and kernel mode are two key states in an operating system. User mode runs regular applications with limited access to system resources, while kernel mode runs the core OS with full control over hardware.

In short, The kernel helps the user to communicate through hardware. As a user cannot directly interact with hardware or system resources. So user takes the help of kenel to do so. 

# User Mode 

User Mode is a restricted environment where application programs run. When a program starts, the OS creates a separate process and assigns it its own memory space.
Programs in user mode can’t access hardware or kernel memory directly. They must request access through system calls to the kernel.

Each process in User mode run in its own memory space, Hardware access is only possible through kernel services. 

If a error or any carsh occurs it doesnt affect the whole system, and is only limited to that process only. 


# Kernel Mode 

Kernel Mode is the privileged mode where the core part of the operating system, the kernel executes. It has unrestricted access to all machine resources including CPU, memory, storage, and connected devices.

When a program running in user mode makes a request that requires hardware access, the system switches the CPU into kernel mode to perform the task. After execution, control returns to user mode.

Kernel can communicate with I/O devices, memory and processor directly, it manages process scheduling, memory allocation and deallocation and device drivers etc. 


If any services carshes the impact can affect the whole system. Also mistakes in kernel code are difficult to trace and fix. 


# Summarized 

User Mode - Applications run here with restricted access to system resources. 

Programs must use system calls to requiest services from the os. 


Kernel Mode - The OS runs here with full access to hardware and memory. 
It performs critical tasks like scheduling, memory management and IO control. 

# Kernel Location 

If the kernel source is installed through a package manager (e.g., kernel-source or kernel-devel package), it is typically found in the /usr/src/ directory. There is often a symbolic link named linux or linux-<version> that points to the actual source directory for the currently running kernel. 

A kernel is present a ring 0, which is closest to system hardware and user is present at the ring 3. 


# System Calls (syscalls)

From the above documentation you would have a clear idea of what a kernel and user is and how they work. 

But if user cant access hardware how do we perform operations on the hardare such as printing, volume up, down accessing resources etc...

Here comes the system calls or generally known as syscalls, A syscall is a interface between a user and kernel. 

Syscalls helps user to interact with kernel and access hardware and resource. 

For example - Whenever a user requires access of any resource a syscall is invoked and sent to kernel, At this point the cpu switches from user mode to kernel mode, and the kernel performs the further operations. 

Once the operation is completed kernel generates an appropriate output and sends it to the user, now the cpu again switches ti user mode from kernel mode. 

Note - user cant interact when cpu is in kernel mode. 

To know more about syscalls in detail we can read the manual of syscalls-

Run - man syscalls

This might return nothing on some machines so run - man 2 intro or man 2 syscalls. 

To fix the problem completely forever 
Run - sudo apt update && sudo apt install manpages-dev

Ok back to the point, you can read the manual about syscalls provided by the distribution and have a clear idea of what syscalls are. 

Go through the manual at least once and you will have a better understanding of system calls than any other documentation. 

If you read the manual you would have noticed thousands of syscalls. 

The syscalls are divided intro 5 categories mainly (not all of them.)

# 1. Process Control

Manages creation, execution, and termination of processes.

fork()
Creates a new process by duplicating the calling process. The child continues executing the same program as the parent.

exit()
Terminates a process and releases all resources held by it.

exec()
Replaces the currently running program with a new one inside the same process. No new process is created.

# 2. File Management

Handles file operations such as access and modification.

open()
Opens a file and returns a file descriptor.

read()
Reads data from a file. Multiple processes can read the same file simultaneously.

write()
Writes data to a file. Used to modify file contents.

close()
Closes an opened file descriptor.

# 3. Device Management

Controls device-specific operations.

ioctl()
Performs device-specific input/output operations that cannot be handled by standard system calls.

# 4. Information Maintenance

Manages process and system information exchange between user programs and the OS.

getpid()
Returns the process ID of the calling process.

alarm()
Schedules a signal to be delivered to the process after a specified time.

sleep()
Suspends process execution for a defined time, allowing other processes to run.

# 5. Communication (Inter-Process Communication – IPC)

Enables data exchange between processes.

IPC Models

Message Passing

Shared Memory

System Calls

pipe()
Creates a unidirectional communication channel between processes.

shmget()
Creates or accesses a shared memory segment.

mmap()
Maps files or devices into a process’s virtual memory space. 


