#!/usr/bin/zsh

# What to sort by: cpu or mem (cpu is default)
TYPE=${1:-cpu}

# How many to show (10 is default)  
COUNT=${2:-10}

# Show top processes
ps aux --sort=-%$TYPE | head -$((COUNT + 1))
