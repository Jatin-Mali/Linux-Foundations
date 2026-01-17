# Linux Boot Process

*A clear explanation from power-on to user space*

## Introduction

The **boot process** is the sequence of steps that Linux follows to turn off hardware into a fully usable operating system. 

Understanding this process is important for:

* System administration
* Fixing boot failures
* Working with the kernel and init system
* Developing low-level and embedded Linux

This document explains the Linux boot process **step by step**. It uses the correct terms, real components, and practical insights, while remaining easy to understand for beginners.

## High-Level Overview

At a high level, the Linux boot process follows this order:

1. Firmware (BIOS / UEFI)
2. Bootloader
3. Kernel
4. Init system (systemd)
5. User space services
6. Login / graphical environment

Each stage has a clear responsibility.

## 1. Power On and Firmware (BIOS / UEFI)

### What happens first

When the system powers on:

* The CPU resets.
* The firmware takes control.

Two common types of firmware are:

* **BIOS** (legacy)
* **UEFI** (modern)

### Firmware responsibilities

* Initialize the CPU, RAM, and essential hardware.
* Perform POST (Power-On Self Test).
* Locate a bootable device.
* Load the bootloader into memory.

Firmware does **not** load Linux directly.

### UEFI vs BIOS (brief)

| BIOS           | UEFI                |
| -------------- | ------------------- |
| Legacy         | Modern              |
| MBR-based      | GPT-based           |
| Limited        | Flexible            |
| No secure boot | Secure Boot support |

## 2. Bootloader (GRUB)

### What is a bootloader?

A **bootloader** is a small program that loads the Linux kernel.

The common Linux bootloader is:

* **GRUB (GRand Unified Bootloader)**

### What GRUB does

* Displays the boot menu.
* Allows kernel selection.
* Loads:

  * Kernel image (`vmlinuz`)
  * Initial RAM filesystem (`initramfs`)
* Passes parameters to the kernel.

### Typical GRUB configuration

Configuration file:


/boot/grub/grub.cfg


Kernel parameters example:


root=/dev/sda1 ro quiet splash


## 3. Linux Kernel

### Kernel loading

Once GRUB loads the kernel:

* Control goes to the Linux kernel.
* The kernel decompresses itself.
* Hardware detection begins.

### Kernel responsibilities during boot

* Initialize CPU scheduling.
* Set up memory management.
* Initialize device drivers.
* Mount the root filesystem (initially read-only).
* Start the first user-space process.

At this stage, **no user programs exist yet**.

## 4. initramfs (Initial RAM Filesystem)

### What is initramfs?

`initramfs` is a temporary filesystem loaded into RAM.

Purpose:

* Prepare the system before the real root filesystem is available.

### Why initramfs is needed

It provides:

* Storage drivers
* Filesystem drivers
* Logical volume support
* Encryption support

Once the real root filesystem is mounted:

* `initramfs` is discarded.

## 5. The First Process: init / systemd

### PID 1

The kernel starts **one process**:


PID 1


This process is:

* `systemd` (on modern Linux)
* Previously `init` or `sysvinit`

If PID 1 fails:

* The system cannot boot.

### Responsibilities of systemd

* Mount filesystems.
* Start system services.
* Manage dependencies.
* Handle system states (targets).

## 6. systemd Targets (Boot Stages)

systemd uses **targets** instead of runlevels.

Common targets:

| Target              | Purpose               |
| ------------------- | --------------------- |
| `basic.target`      | Basic system          |
| `multi-user.target` | Text mode, networking |
| `graphical.target`  | GUI environment       |
| `rescue.target`     | Recovery mode         |

Check the current target:


systemctl get-default


## 7. Starting User-Space Services

systemd launches:

* Networking
* Logging
* Audio
* Display manager
* Background services

Each service:

* Runs as its own process.
* Can be monitored and controlled.

Example:


systemctl status ssh

## 8. Login and User Environment

The final stage of boot:

* Login prompt (TTY or GUI).
* User authentication.
* Shell or desktop environment starts.

At this point:

* The system is fully operational.
* The boot process is complete.

## Boot Process Summary (Timeline)

Power On
  ↓
Firmware (BIOS/UEFI)
  ↓
Bootloader (GRUB)
  ↓
Kernel + initramfs
  ↓
systemd (PID 1)
  ↓
Services
  ↓
Login / GUI


## Common Boot Files and Locations

| File / Directory    | Purpose                |
| ------------------- | ---------------------- |
| `/boot/vmlinuz-*`   | Kernel image           |
| `/boot/initramfs-*` | Initial RAM filesystem |
| `/boot/grub/`       | GRUB configuration     |
| `/etc/systemd/`     | systemd configuration  |

## Debugging Boot Issues

View boot logs:


journalctl -b


Kernel messages:


dmesg


GRUB recovery mode:

* Advanced options → recovery

## Key Takeaways

* Firmware initializes hardware.
* Bootloader loads the kernel.
* Kernel initializes the system.
* systemd brings the system to a usable state.
* PID 1 is critical.
* Each stage depends on the previous one.
