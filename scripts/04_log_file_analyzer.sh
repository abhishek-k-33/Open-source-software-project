#!/bin/bash
# Script 4: Log File Analyzer
# Author: [Your Name] | Course: Open Source Software (OSS NGMC)
# Usage: ./04_log_file_analyzer.sh /path/to/logfile [keyword]
# Purpose: Count keyword matches in a log file and print recent matching lines.

LOGFILE="$1"
KEYWORD="${2:-error}"
COUNT=0
RETRIES=0
MAX_RETRIES=3

if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 /path/to/logfile [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# Do-while style retry for empty logs: check, wait, retry up to MAX_RETRIES.
while [ ! -s "$LOGFILE" ]; do
    RETRIES=$((RETRIES + 1))
    echo "Warning: $LOGFILE is empty. Retry $RETRIES/$MAX_RETRIES in 2 seconds..."

    if [ "$RETRIES" -ge "$MAX_RETRIES" ]; then
        echo "No data available after retries. Exiting."
        exit 1
    fi

    sleep 2
done

# Read file line by line and count matches case-insensitively.
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "============================================================"
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "------------------------------------------------------------"
echo "Last 5 matching lines:"

# Show only recent matching lines from the tail of the log for readability.
MATCHES="$(tail -n 2000 "$LOGFILE" | grep -i "$KEYWORD" | tail -n 5)"

if [ -n "$MATCHES" ]; then
    echo "$MATCHES"
else
    echo "No matching lines found."
fi

echo "============================================================"
