#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name] | Course: Open Source Software (OSS NGMC)
# Purpose: Show core Linux identity details for the audit environment.

# -----------------------------
# Student and project variables
# -----------------------------
STUDENT_NAME="Your Name"
SOFTWARE_CHOICE="Apache HTTP Server"

# -----------------------------
# System information collection
# -----------------------------
KERNEL="$(uname -r)"
USER_NAME="$(whoami)"
HOME_DIR="$HOME"
UPTIME="$(uptime -p)"
NOW="$(date '+%A, %d %B %Y %I:%M:%S %p')"

# Read distro name from os-release if available.
if [ -r /etc/os-release ]; then
    DISTRO_NAME="$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
else
    DISTRO_NAME="$(uname -s)"
fi

# Linux kernel license note for this report context.
OS_LICENSE_NOTE="Linux kernel is licensed under GNU GPL v2."

# -----------------------------
# Display
# -----------------------------
echo "============================================================"
echo "Open Source Audit - System Identity Report"
echo "Student   : $STUDENT_NAME"
echo "Software  : $SOFTWARE_CHOICE"
echo "============================================================"
echo "Distro    : $DISTRO_NAME"
echo "Kernel    : $KERNEL"
echo "User      : $USER_NAME"
echo "Home Dir  : $HOME_DIR"
echo "Uptime    : $UPTIME"
echo "Date/Time : $NOW"
echo "License   : $OS_LICENSE_NOTE"
echo "============================================================"
