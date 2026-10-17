#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Tairabek_Akerke_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Akerke"
echo "Surname: Tairabek"
echo "Group: IT2-2307"
echo "Student ID: 38137"
echo "=============================="
echo "System Information"
echo "=============================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s -r)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h

if [ -f "$INFO_FILE" ]; then
  echo "Student information file exists."
else
  echo "Student information file does not exist."
fi
