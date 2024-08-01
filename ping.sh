#!/bin/sh

# CSV file path
output_file="/logs/ping_results.csv"

# Ensure the CSV file exists and has a header if it's new
if [ ! -f "$output_file" ]; then
    echo "timestamp, status, response_time" > "$output_file"
fi

# Function to ping and log results
ping_and_log() {
    pong=$(ping -c 1 1.1.1.1)
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    if echo "$pong" | grep -q "time="; then
        response_time=$(echo "$pong" | sed -n -e 's/^.*time=\([0-9.]*\) ms/\1/p')
        echo "$timestamp, success, $response_time" >> "$output_file"
        echo "$timestamp - Success ($response_time ms)"
    else
        echo "$timestamp, fail," >> "$output_file"
        echo "$timestamp - Fail"
    fi
    sleep 4  # Delay of 4 seconds before the next ping
}

# Run indefinitely
while true
do
    ping_and_log
done