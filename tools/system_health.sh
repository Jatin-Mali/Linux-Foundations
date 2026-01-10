#!/usr/bin/zsh

echo "=============================="
echo " Linux System Health Check"
echo "=============================="
echo ""

echo "Hostname:"
hostname
echo ""

echo "Uptime:"
uptime -p
echo ""

echo "Disk Usage:"
df -h /
echo ""

echo "Memory Usage:"
free -h
echo ""

echo "CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

echo "Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6
echo ""

echo "Health check completed."
