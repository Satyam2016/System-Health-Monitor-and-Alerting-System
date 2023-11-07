#!/bin/bash

# Define log file paths
CPU_LOG="cpu.log"
MEMORY_LOG="memory.log"
DISK_LOG="disk.log"
REPORT_DIR="reports"

# Create the reports directory if it doesn't exist
mkdir -p "$REPORT_DIR"

# Function to generate daily reports
generate_daily_report() {
  TODAY=$(date +"%Y-%m-%d")
  REPORT_FILE="$REPORT_DIR/$TODAY.txt"

  echo "System Health Report - $TODAY" > "$REPORT_FILE"

  echo -e "\nCPU Usage:" >> "$REPORT_FILE"
  cat "$CPU_LOG" >> "$REPORT_FILE"

  echo -e "\nMemory Usage:" >> "$REPORT_FILE"
  cat "$MEMORY_LOG" >> "$REPORT_FILE"

  echo -e "\nDisk Space Usage:" >> "$REPORT_FILE"
  cat "$DISK_LOG" >> "$REPORT_FILE"

  echo "Report generated at $(date)" >> "$REPORT_FILE"

}

