#!/usr/bin/zsh

# Simple log watching script
# Usage: ./log_watch.sh [number_of_lines]

LINES=${1:-20}

echo "Showing last $LINES log entries (live)"
echo "Errors and warnings will be highlighted"
echo "Press Ctrl+C to stop"
echo "--------------------------------------"

journalctl -n "$LINES" -f | while read -r line
do
    if echo "$line" | grep -qi "error\|fail\|warn"; then
        echo "⚠️  $line"
    else
        echo "$line"
    fi
done

