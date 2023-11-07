
#!/bin/bash

. ./alert_system.sh
. ./generate_report.sh

# Define log file paths
CPU_LOG="cpu.log"
MEMORY_LOG="memory.log"
DISK_LOG="disk.log"

#truncating the file to size zero
if [ -e "$CPU_LOG" ];
then
	truncate -s 0 "$CPU_LOG"
fi

if [ -e "$MEMORY_LOG" ]
then
	truncate -s 0 "$MEMORY_LOG"
fi

if [ -e  "$DISK_LOG" ]
then
	truncate -s 0 "$DISK_LOG"
fi


# Function to collect CPU usage
monitor_cpu() {
  date +"%Y-%m-%d %H:%M:%S" >> "$CPU_LOG"
  top -n 1 -b | grep "%Cpu(s)" >> "$CPU_LOG"
}

# Function to collect memory usage
monitor_memory() {
  date +"%Y-%m-%d %H:%M:%S" >> "$MEMORY_LOG"
  free -m >> "$MEMORY_LOG"
}

# Function to collect disk space usage
monitor_disk() {
  date +"%Y-%m-%d %H:%M:%S" >> "$DISK_LOG"
  df -h >> "$DISK_LOG"
}

i=1
# Main monitoring loop
while [ $i -le 5 ];
do
  monitor_cpu
  monitor_memory
  monitor_disk
  check_cpu_alert
  sleep 10  # Adjust the sleep interval (in seconds) as needed
  i=$(( i+1 ))
done

generate_daily_report


