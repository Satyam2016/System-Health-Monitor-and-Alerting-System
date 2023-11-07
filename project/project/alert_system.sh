#!/bin/bash

# Define threshold values
CPU_THRESHOLD=1

# Function to check CPU usage and send an alert if it exceeds the threshold
check_cpu_alert() {
  CPU_USAGE=$(top -n 1 -b | grep "%Cpu(s)" | awk '{print $2}' | cut -d "." -f1)

  if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "High CPU usage detected: $CPU_USAGE%" | mailx  -s "CPU Alert" sk9161511745@gmail.com
  fi
}


