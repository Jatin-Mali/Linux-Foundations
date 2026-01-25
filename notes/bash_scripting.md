# Bash Scripting — Foundations to Practical Automation

*A complete, beginner-friendly, professional guide*

---

## Introduction

Bash scripting is the skill that turns Linux knowledge into **automation**.

If Linux is the operating system, Bash is how you:

* Control it
* Automate it
* Glue tools together
* Build operational workflows

This document is a **single, consolidated Bash reference** covering:

* Core syntax
* Control flow
* Text processing
* Error handling
* Automation
* Real-world scripting practices

It is written to be:

* Easy for beginners
* Useful for professionals
* Practical, not theoretical

---

## 1. What Is Bash?

**Bash (Bourne Again SHell)** is:

* A command interpreter
* A scripting language
* A glue layer between Linux tools

A Bash script is simply a text file containing commands that Linux would otherwise run manually.

---

## 2. Shebang (Script Entry Point)

Every Bash script should start with a **shebang**:

```bash
#!/bin/bash
```

What this means:

* Tells the system which interpreter to use
* Ensures the script runs consistently

Make script executable:

```bash
chmod +x script.sh
```

Run script:

```bash
./script.sh
```

---

## 3. Variables

### Defining variables

```bash
name="Linux"
```

Rules:

* No spaces around `=`
* Variables are strings by default

Access variable:

```bash
echo $name
```

---

### Environment variables

Provided by the system:

```bash
echo $HOME
echo $USER
echo $PATH
```

List all environment variables:

```bash
env
```

---

## 4. Script Arguments

Arguments passed to scripts:

```bash
./script.sh file.txt 10
```

Inside script:

```bash
$0  # script name
$1  # first argument
$2  # second argument
$#  # number of arguments
$@  # all arguments
```

Example:

```bash
echo "File: $1"
```

---

## 5. Exit Codes

Every command returns an **exit code**:

* `0` → success
* non-zero → failure

Check exit code:

```bash
echo $?
```

Exit manually:

```bash
exit 1
```

Exit codes are how scripts **communicate success or failure**.

---

## 6. Quoting (Very Important)

### Double quotes `" "`

* Variables are expanded
* Spaces preserved

```bash
echo "Hello $USER"
```

### Single quotes `' '`

* Everything literal
* No variable expansion

```bash
echo '$USER'
```

### No quotes

* Word splitting occurs
* Dangerous for filenames

Rule:

> Always quote variables unless you know why not to.

---

## 7. Conditional Logic (`if`)

Basic `if` statement:

```bash
if [ "$USER" = "root" ]; then
    echo "Running as root"
else
    echo "Not root"
fi
```

Common tests:

```bash
-f file    # file exists
-d dir     # directory exists
-z var     # empty string
```

---

## 8. Loops

### `for` loop

```bash
for file in *.txt; do
    echo "$file"
done
```

### `while` loop

```bash
while read line; do
    echo "$line"
done < file.txt
```

Used for reading files and streams.

---

## 9. Pipes and Redirection

### Redirection

```bash
command > file      # overwrite
command >> file     # append
command < file      # input
```

### Pipes

```bash
cat file | grep error | sort | uniq -c
```

Pipes connect commands:

* Output of one → input of next

This is the **core Unix philosophy**.

---

## 10. Text Processing Tools

### `grep` — searching

```bash
grep "root" /etc/passwd
```

### `awk` — structured data

```bash
awk -F: '{print $1, $7}' /etc/passwd
```

### `sed` — text editing

```bash
sed 's/foo/bar/g' file.txt
```

These tools are how Bash handles real data.

---

## 11. Functions

Functions group logic:

```bash
backup() {
    echo "Running backup"
}
```

Call function:

```bash
backup
```

Benefits:

* Reusability
* Readability
* Error isolation

---

## 12. Error Handling

### Exit on failure

```bash
set -e
```

Script stops on first error.

### Safer scripts

```bash
set -euo pipefail
```

* `-e` → exit on error
* `-u` → undefined variables fail
* `pipefail` → pipeline errors propagate

This is **production standard**.

---

## 13. Signals and Traps

Handle interruptions:

```bash
trap "echo 'Script interrupted'; exit 1" INT
```

Ensures cleanup on Ctrl+C or termination.

---

## 14. Automation with Cron

Cron runs scripts on a schedule.

Edit crontab:

```bash
crontab -e
```

Example:

```bash
0 2 * * * /home/user/backup.sh
```

Meaning:

* Run daily at 2 AM

Cron is Linux automation backbone.

---

## 15. Defensive Scripting Practices

* Validate input
* Check file existence
* Use absolute paths
* Log output
* Fail early

Example:

```bash
[ -f "$1" ] || exit 1
```

---

## 16. Mini Tool Pattern (Real-World)

Scripts should:

* Accept arguments
* Print usage
* Exit cleanly

Example usage block:

```bash
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi
```

This separates scripts from throwaway commands.

---

## 17. Common Mistakes

* Unquoted variables
* Ignoring exit codes
* Hardcoding paths
* Using Bash for heavy logic
* Writing unreadable one-liners

Bash is glue, not a full programming language.

---

## 18. Mental Model

* Bash connects tools
* Tools do the real work
* Scripts automate repetition
* Pipes move data
* Exit codes enforce correctness

---

## Final Summary

* Bash scripts automate Linux
* Small scripts beat complex ones
* Pipes and text tools are core
* Defensive scripting is mandatory
* Bash mastery signals operational maturity

---

## One-Line Takeaway

**Bash scripting is not about syntax — it is about controlling systems with precision and discipline.**

This file is designed to live as a permanent reference in a Linux fundamentals repository.
